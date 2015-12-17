#!/bin/bash

set -e -x

IRODS_VERSION=${IRODS_VERSION:=3.3.1}

script_common() {
    autoreconf -fi
}

script_3_3_1() {
    ./configure --with-irods=$IRODS_HOME
    make distcheck DISTCHECK_CONFIGURE_FLAGS=--with-irods=$IRODS_HOME
}

script_4_1_x() {
    ./configure --with-test-resource=testResc
    make distcheck
}

case $IRODS_VERSION in

    3.3.1)
        script_common
        script_3_3_1
        ;;

    4.1.4)
        script_common
        script_4_1_x
        ;;

    4.1.5)
        script_common
        script_4_1_x
        ;;

    4.1.6)
        script_common
        script_4_1_x
        ;;

    *)
        echo Unknown iRODS version $IRODS_VERSION
        exit 1
esac
