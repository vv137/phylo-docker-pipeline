FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        curl \
        git \
        build-essential \
        mafft \
        fasttree \
        trimal && \
    apt-get clean

WORKDIR /data

COPY run_pipeline.sh /usr/local/bin/run_pipeline.sh
RUN chmod +x /usr/local/bin/run_pipeline.sh

ENTRYPOINT ["run_pipeline.sh"]
