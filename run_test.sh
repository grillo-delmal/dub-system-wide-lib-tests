#!/usr/bin/bash
podman image exists localhost/dub-test
if [ "$?" == "1" ]
then
    ./build_env.sh
fi

mkdir -p ./build_out
rm -rf ./build_out/*

echo "DUB VERSION:"
podman run --rm \
        localhost/dub-test:latest \
        git -C /opt/dub describe
echo

# RUN TESTS
RESULT=0
for TEST_N in $(seq 0 5)
do

    echo "=== RUNNING TEST ${TEST_N} ==="

    mkdir -p ./build_out/test${TEST_N}/{src,cache}

    podman unshare chown $UID:$UID -R $(pwd)/build_out/test${TEST_N}

    podman run --rm \
        -v $(pwd)/build_out/test${TEST_N}/src/:/opt/src/:Z \
        -v $(pwd)/build_out/test${TEST_N}/cache/:/root/.dub/:Z \
        -v $(pwd)/test${TEST_N}/:/opt/orig/:ro,Z \
        -w /opt \
        localhost/dub-test:latest \
        ./orig/run.sh
    [[ "$?" != "0" ]] && RESULT=$(($RESULT + 1))
    podman unshare chown 0:0 -R $(pwd)/build_out/test${TEST_N}

    echo
done

echo "Errors: $RESULT"
[[ "$RESULT" == "0" ]] && exit 0 || exit 1