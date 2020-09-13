#!/usr/bin/env /bin/bash
set -e

build() {
    # Build Package
    if [ "${1}" == "package" ]; then
        PKG_NAME=${2}
        echo "Building package: ${PKG_NAME}"
        _build_env &&\
        cd /build &&\
        if [ "${SKIP_OS_PKGS}" == "true" ]; then ./scripts/feeds clean; fi &&\
        _add_pkg_feed &&\
        ./scripts/feeds install -p custom ${PKG_NAME} &&\
        make defconfig &&\
        make -j $((`nproc`+1)) package/${PKG_NAME}/compile ${BUILD_OPTS} &&\
        _copy_artifacts &&\
        _clean &&\
        exit 0
        exit 1
    fi

    # Build custom version of Turris OS
    if [ "${1}" == "firmware" ]; then
        echo "Building firmware is not supported (yet)"
        exit 1
    fi

    # Default output: Usage
    echo "Usage: build.sh [package | firmware] packagename"
    echo "[ENV Options]"
    echo "DEVICE=${DEVICE}                              [Turris Device this build is running for: 'omnia' or 'mox']"
    echo "PKG_FEED=${PKG_FEED}                          [Root directory containing custom packages and dependencies: <unix path>]"
    echo "ARTIFACTS_DIR=${ARTIFACTS_DIR}                [Destination directory for build artifacts: <unix path>]"
    echo "SKIP_OS_PKGS=${SKIP_OS_PKGS}                  [Skip building Turris OS / OpenWRT packages --> only packages from custom feed: ${PKG_FEED}: true/false]"
    echo "BUILD_OPTS=${BUILD_OPTS}                      [command line parameters (build options for make)]"
    echo "DEBUG=${DEBUG}                                [add V=sc to BUILD_OPTS (= verbose output for make)]"
}

# Helpers
_add_pkg_feed() {
    echo "Loading Packages from custom feed in ${PKG_FEED}" &&\
    cd /build &&\
    sed -i "s,src-link custom /workspace/pkgs,src-link custom ${PKG_FEED},g" feeds.conf &&\
    ./scripts/feeds update custom
}

_copy_artifacts() {
    if [ "${DEVICE}" == "omnia" ] && [ ! -z ${PKG_NAME} ]; then
        echo "Copying package artifacts for ${DEVICE}" &&\
        mkdir -p ${ARTIFACTS_DIR}/${DEVICE} &&\
        cp -rf /build/bin/packages/arm_cortex-a9_vfpv3-d16/custom/* ${ARTIFACTS_DIR}/
    elif [ "${DEVICE}" == "omnia" ]; then
        echo "Copying artifacts for ${DEVICE}" &&\
        mkdir -p ${ARTIFACTS_DIR}/${DEVICE} &&\
        cp -r /build/bin/targets/mvebu/cortexa9/packages/* ${ARTIFACTS_DIR}/
    # elif [ "${DEVICE}" == "dummy" ]; then
    #     echo "Copying artifacts for ${DEVICE}"
    else 
        echo "Unknown device, copying all artifacts" &&\
        mkdir -p ${ARTIFACTS_DIR}/unknown &&\
        cp -r /build/bin/* ${ARTIFACTS_DIR}/unknown/
    fi
}

_clean() {
    rm -rf /build/bin
}

_build_env() {
    _set_target ${DEVICE}
    if [ ! -z ${DEBUG} ]; then
        BUILD_OPTS="${BUILD_OPTS} V=sc"
    fi
}

_set_target() {
	echo "Setting target as $1"
	case "$1" in
		omnia)
			TARGET_BOARD=omnia
			TARGET_ARCH=armv7l
			;;
		turris1x)
			TARGET_BOARD=turris1x
			TARGET_ARCH=ppcspe
			;;
		mox)
			TARGET_BOARD=mox
			TARGET_ARCH=aarch64
			;;
		*)
			echo "Invalid target board!!! Use -t [turris1x|omnia|mox]!!!"
			exit 1
			;;
	esac
}

build "$@"
