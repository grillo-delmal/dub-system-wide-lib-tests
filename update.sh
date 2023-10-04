#!/usr/bin/env bash

mkdir -p dep.build
find ./dep.build -mindepth 1 -maxdepth 1 -exec rm -rf -- {} +

pushd dep.build
git clone https://github.com/dlang/dub.git
popd #dep.build

DUB_COMMIT=$(git -C ./dep.build/dub rev-parse HEAD)

cat <<EOL > ./build_env.sh
#!/usr/bin/env bash

podman build \\
    --build-arg DUB_COMMIT=${DUB_COMMIT:0:7} \\
    -t dub-test .
EOL
