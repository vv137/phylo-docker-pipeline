FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

RUN apt-get update && \
    apt-get install -y \
    curl \
    git \
    build-essential \
    mafft \
    fasttree && \
    apt-get clean

# Build trimAl from source
RUN cd /opt && \
    git clone https://github.com/inab/trimal.git && \
    cd trimal/source && \
    make && \
    cp trimal /usr/local/bin/ && \
    cd / && rm -rf /opt/trimal

WORKDIR /data

COPY run_pipeline.sh /usr/local/bin/run_pipeline.sh
RUN chmod +x /usr/local/bin/run_pipeline.sh

ENTRYPOINT ["run_pipeline.sh"]
