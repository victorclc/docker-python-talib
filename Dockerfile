FROM python:3.7.3-alpine

RUN apk add --update gcc wget make musl-dev build-base

# TA-LIB
RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
    tar xvzf ta-lib-0.4.0-src.tar.gz && \
    cd ta-lib && \
    ./configure --prefix=/usr && \
    make && \
    make install && \
    cd - && \
    rm -rf ta-lib && \
    rm -f ta-lib-0.4.0-src.tar.gz

RUN pip3 install cython
RUN pip3 install numpy
RUN pip3 install pandas
RUN pip3 install TA-LIB

RUN apk del gcc wget make musl-dev build-base
