FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04
LABEL maintainer="Erik Ferlanti <eferlanti@tacc.utexas.edu>"

# adding needed system pre-reqs
RUN apt update && apt upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt install --yes --no-install-recommends \
    git \
    python3 \
    python3-pip \
    python-is-python3 \
    vim-tiny && \
    apt autoremove -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# install tensorflow and autokeras
RUN pip install tensorflow==2.10 keras==2.10 git+https://github.com/keras-team/keras-tuner.git autokeras nibabel
