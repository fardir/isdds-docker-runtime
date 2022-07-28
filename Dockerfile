# make image from pytorch/pytorch:1.12.0-cuda11.3-cudnn8-runtime
FROM pytorch/pytorch:1.12.0-cuda11.3-cudnn8-runtime

## using NVIDIA Pytorch image
#FROM nvcr.io/nvidia/pytorch:22.06-py3

# configure work directory
WORKDIR /workspace

## Set python version
ENV python_version 3.8

# install dependency
RUN apt-get -qq update \
 && apt-get -y -qq upgrade \
 && apt-get install -y \
        git \
        python${python_version} \
        python3-pip \
#        openssh-server \
# && mkdir /var/run/sshd \
 && apt-get autoremove -y \
 && rm -rf /tmp/* \
 && rm -rf /root/.cache/*

RUN update-alternatives --install /usr/local/bin/python python /usr/bin/python${python_version} 1

# upgrade pip and install some packages
RUN python3 -m pip -q install --upgrade pip setuptools wheel

# install requirement
COPY requirements.txt requirements.txt
#RUN conda update conda && conda install -y -q -c conda-forge --file requirements.txt
RUN python3 -m pip -q install -r requirements.txt

#RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager @jupyterlab/hub-extension @kiteco/jupyterlab-kite

#ADD jupyter_notebook_config.py /etc/jupyter

EXPOSE 8888 8080 22
