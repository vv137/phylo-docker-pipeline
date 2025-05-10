# Dockerfile

# Use Ubuntu base image
FROM ubuntu:20.04

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install MAFFT, trimAl, FastTree, and dependencies
RUN apt-get update && \
    apt-get install -y \
        curl \
        git \
        build-essential \
        mafft \
        fasttree \
        trimal && \
    apt-get clean

# Set working directory inside the container
WORKDIR /data

# Copy the run script into the container
COPY run_pipeline.sh /usr/local/bin/run_pipeline.sh
RUN chmod +x /usr/local/bin/run_pipeline.sh

# Run the script when the container starts
ENTRYPOINT ["run_pipeline.sh"]

