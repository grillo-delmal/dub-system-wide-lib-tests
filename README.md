# Test cases for DUB working on system-environment.

## What?

Sorry if this is confusing, I built this test suite to check if dub is ready 
to use libraries installed in system directories.

I built this test suite with the assumption that libraries should not get 
packaged with their built binary files. I considered this because, as I 
understand, in dub you can include libraries in projects with specific 
configurations and versions. This would lead to a problem when you try to 
package 2 applications that depend on the same library with different 
configuration/version flags since you cannot easily detect which flags were 
used to build a specific binary, and even if you could include multiple 
binaries, I don't think that dub has any feature to actually detect them 
correctly.

I'm by no means proficient in D nor knowledgeable on how this should actually 
work, so any comments are welcome.

## So ... how was this built ?

This test suite works using podman to run Fedora 37 containers.

The podman image installs ldc2 from Fedora and dub from the 
[grillo-delmal/dub-hack](https://copr.fedorainfracloud.org/coprs/grillo-delmal/dub-hack/package/dub/)
copr repository, which currently has the latest dub commit packaged 
([1.30.0^53.git1330c9d7](https://github.com/dlang/dub/tree/1330c9d7bfee19421ec23b3034d2584f6142f8c9)). 

I maintain the spec file and patches for that dub package on https://github.com/grillo-delmal/dub-rpm, 
I might change it in the future, so use under your own risk.

This should just need podman to run. The tests are run through the `run_test.sh` script.

## And how does this work?

When the container image is built, it's configured to add the 
`data/settings.json` file in the `/var/lib/dub` directory, this configures 
dub to search system libraries on the `/opt/orig/system` folder inside
the container.

The container is configured to have read only access to the test folder,
this folder is mounted into the `/opt/orig` path inside the container. 

The test folder contains a local and system folder with apps and 
libraries pertaining the test and a run.sh script.

The run script does the following:

* Copy the `/opt/orig/local` folder into `/opt/src`.
* Call dub to add all the local libraries.
* Build the application on the `/opt/src/` folder.
* Run the built application.

The container is also configured to export some folders for debuging:

* `/opt/src` -> `./build_out/test*/src` 
* `/root/.dub` -> `./build_out/test*/cache`

The currently implemented tests are the following:

### App depending on library

#### Test 0

local library -> local app

#### Test 1

system library -> local app

### Library depending on library

#### Test 2

local library -> local library -> local app

#### Test 3

system library -> local library -> local app

#### Test 4

system library -> system library -> local app