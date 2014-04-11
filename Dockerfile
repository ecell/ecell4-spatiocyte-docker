FROM ubuntu
RUN apt-get update
RUN apt-get install -y git g++ libboost-dev libboost-test-dev libboost-regex-dev libgsl0-dev libhdf5-serial-dev pkg-config
RUN cd /tmp ; git clone git://github.com/ecell/ecell4
RUN cd /tmp/ecell4 ; git checkout -t origin/lattice
RUN cd /tmp/ecell4 ; PREFIX=/usr/local bash /tmp/ecell4/install.sh core
RUN cd /tmp/ecell4/lattice ; PREFIX=/usr/local ../waf configure build install
