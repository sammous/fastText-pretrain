FROM ubuntu:14.04
MAINTAINER Sami Moustachir <moustachir.sami@gmail.com>

ENV https_proxy=http://10.244.16.9:9090
ENV http_proxy=http://10.244.16.9:9090

RUN apt-get update && apt-get install -y \
        build-essential \
        wget \
        git \
        python-dev \
        unzip \
        python-numpy \
        python-scipy \
        && rm -rf /var/cache/apk/*

RUN git clone https://github.com/facebookresearch/fastText.git /tmp/fastText && \
  rm -rf /tmp/fastText/.git* && \
  mv /tmp/fastText/* /root && \
  cd /root && \
  make

COPY data /data
COPY results /results

RUN cd /data && wget wget https://s3-us-west-1.amazonaws.com/fasttext-vectors/\
word-vectors-v2/cc.fr.300.bin.gz
RUN cd /data && wget wget https://s3-us-west-1.amazonaws.com/fasttext-vectors/\
wiki-news-300d-1M.vec.zip



RUN chown -R root:root /data /results
RUN chmod -R 700 /data /results

WORKDIR /root
CMD ["./fasttext", "--allow-root"]
