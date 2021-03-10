FROM nvcr.io/nvidia/tensorrt:21.02-py3
# For future transition to tensorrt

# Install softwares
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip \
    libjpeg8-dev liblapack-dev libblas-dev gfortran
RUN apt-get install -y python3-dev python3-pip
RUN apt-get install -y libxslt1-dev libxml2-dev libffi-dev libcurl4-openssl-dev \ 
    libssl-dev libpng-dev libopenblas-dev
RUN apt-get install -y git
RUN apt-get install -y openmpi-doc openmpi-bin libopenmpi-dev libopenblas-dev
RUN apt-get install python-dev libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev \
    libsdl-ttf2.0-dev libsdl1.2-dev libsmpeg-dev python-numpy subversion libportmidi-dev \ 
    ffmpeg libswscale-dev libavformat-dev libavcodec-dev libfreetype6-dev && \
    pip install pygame

# Install Python packages
RUN pip3 install -U pip testresources setuptools \
    futures==3.1.1 protobuf==3.12.2 pybind11==2.5.0 \
    cython==0.29.21 numpy==1.19.0 future==0.18.2 mock==4.0.2 \
    h5py==2.10.0 keras_preprocessing==1.1.2 keras_applications==1.0.8 gast==0.3.3
RUN pip3 install -U grpcio==1.30.0 absl-py==0.9.0 py-cpuinfo==7.0.0 psutil==5.7.2 \
    portpicker==1.3.1 six requests==2.24.0 astor==0.8.1 termcolor==1.1.0 wrapt==1.12.1 \
    google-pasta==0.2.0 scipy==1.4.1 pandas==1.0.5 gdown

RUN pip3 install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v44 \
    tensorflow==2.2.0+nv20.6

# PyTorch?

# Virtual Env
RUN pip3 install virtualenv && \
    python3 -m virtualenv -p python3 env --system-site-packages && \
    echo "source env/bin/activate" >> ~/.bashrc && \
    source /root/.bashrc

# Donkeycar
RUN mkdir -p /projects; cd /projects && \
    git clone https://github.com/autorope/donkeycar && \
    cd donkeycar && \
    git checkout master && \
    pip install -e .[nano] 

RUN donkey createcar --path /projects/mycar

WORKDIR /projects/mycar

