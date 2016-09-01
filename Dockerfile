FROM ubuntu:xenial
MAINTAINER Gunnar Beutner <gunnar.beutner@netways.de>

RUN apt-get update && \
    apt-get install -y git cmake build-essential && \
    apt-get install -y qtbase5-dev && \
    apt-get install -y qttools5-dev-tools && \
    git clone https://github.com/KDE/extra-cmake-modules && \
    cd extra-cmake-modules && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make install && \
    cd ../.. && \
    rm -rf extra-cmake-modules && \
    apt-get install -y libqt5svg5-dev && \
    git clone https://github.com/KDE/kdiagram && \
    cd kdiagram && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make install && \
    cd ../.. && \
    rm -rf kdiagram && \
    apt-get install -y libboost-all-dev libkf5coreaddons-dev libkf5i18n-dev libkf5itemmodels-dev libkf5threadweaver-dev libkf5configwidgets-dev kio-dev libdwarf-dev gettext libunwind-dev libsparsehash-dev && \
    git clone https://github.com/KDE/heaptrack && \
    cd heaptrack && \
    mkdir build && \
    cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release && \
    make install && \
    cd ../.. && \
    rm -rf heaptrack && \
    apt-get install -y libunwind8 libkf5itemmodels5 libqt5svg5 libkf5configwidgets5 libkf5threadweaver5 libboost-iostreams1.58.0 libboost-program-options1.58.0 kio gdb && \
    apt-get purge -y git cmake build-essential qtbase5-dev qttools5-dev-tools libqt5svg5-dev libboost-all-dev libkf5coreaddons-dev libkf5i18n-dev libkf5itemmodels-dev libkf5threadweaver-dev libkf5configwidgets-dev kio-dev libdwarf-dev gettext libunwind-dev libsparsehash-dev && \
    apt-get autoremove -y && \
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
