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
for d in ./tests/*/ ; do

    echo "=== RUNNING $(basename $d) ==="

    mkdir -p ./build_out/$(basename $d)/{src,cache}

    podman unshare chown $UID:$UID -R $(pwd)/build_out/$(basename $d)

    podman run --rm \
        -v $(pwd)/build_out/$(basename $d)/src/:/opt/src/:Z \
        -v $(pwd)/build_out/$(basename $d)/cache/:/root/.dub/:Z \
        -v $(pwd)/tests/$(basename $d)/:/opt/orig/:ro,Z \
        -e DUB_PARAMS="--vverbose --cache=local --temp-build" \
        -w /opt \
        localhost/dub-test:latest \
        ./orig/run.sh
    [[ "$?" != "0" ]] && RESULT=$(($RESULT + 1))
    podman unshare chown 0:0 -R $(pwd)/build_out/$(basename $d)

    echo
done

echo "Errors: $RESULT"
[[ "$RESULT" == "0" ]] && exit 0 || exit 1