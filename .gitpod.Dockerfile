FROM devfactory/workspace-full:latest
RUN sudo apt update && sudo apt-get install -y build-essential \
    automake \
    autotools-dev \
    make \
    g++ \
    ca-certificates \
    software-properties-common \
    apt-transport-https \
    lsb-base \
    lsb-release \
    zlib1g-dev \
    libpcre3-dev \
    libcurl4-openssl-dev \
    libc-dev \
    libxml2-dev \
    libsnmp-dev \
    libssh2-1-dev \
    libevent-dev \
    libopenipmi-dev \
    libpng-dev \
    pkg-config \
    libfontconfig1 \
    git \
    bzip2 \
    zip \
    unzip \
    musl-dev \
    ghc \
    cabal-install \
    libmpfr-dev

RUN git clone https://github.com/elm/compiler.git
RUN cd compiler && git checkout 0.19.1 && rm worker/elm.cabal \
    && cabal new-update \ 
    && cabal new-configure \
    && cabal new-build \
    && sudo cp dist-newstyle/build/aarch64-linux/ghc-*/elm-0.19.1/x/elm/build/elm/elm /usr/local/bin
    