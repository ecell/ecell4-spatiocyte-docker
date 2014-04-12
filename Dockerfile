FROM ubuntu
RUN apt-get update
RUN apt-get install -y git g++ libboost-dev libboost-test-dev libboost-regex-dev libgsl0-dev libhdf5-serial-dev pkg-config
RUN cd /tmp ; git clone git://github.com/ecell/ecell4
RUN cd /tmp/ecell4 ; git checkout -t origin/lattice

#RUN cd /tmp/ecell4 ; PREFIX=/usr/local bash /tmp/ecell4/install.sh core lattice

RUN cd /tmp/ecell4/core ; ../waf configure --prefix=/usr/local
RUN cd /tmp/ecell4/core ; ../waf build
RUN cd /tmp/ecell4/core ; ../waf install

RUN cd /tmp/ecell4/lattice ; ../waf configure --prefix=/usr/local
RUN cd /tmp/ecell4/lattice ; ../waf build
RUN cd /tmp/ecell4/lattice ; ../waf install

ENTRYPOINT ["ls", "/usr/local/lib"]
