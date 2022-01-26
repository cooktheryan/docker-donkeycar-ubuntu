FROM continuumio/miniconda3:latest

# Install softwares
#RUN apt-get update && apt-get install -y python=3.7 python3-pip git nano rsync zip
RUN apt-get update && apt-get install -y git nano rsync zip
# Python packages

# RUN python3 -m pip install --upgrade pip
# RUN python3 -m pip install opencv-python --upgrade

# Install donkeycar
RUN git clone https://github.com/cooktheryan/donkeycar && \
    cd donkeycar && \
    git checkout arm && \
    conda env create -f install/envs/ubuntu.yml

RUN conda init bash

RUN /bin/bash -c ". activate donkey && \
    cd donkeycar && \
    pip install -e .[pc]"

RUN /bin/bash -c ". activate donkey && \
    cd / && \
    git clone https://github.com/tawnkramer/gym-donkeycar && \
    pip install -e gym-donkeycar"

# Create a car
RUN mkdir -p /donkeys
RUN /bin/bash -c ". activate donkey && \
    cd / && \
    donkey createcar --path /donkeys/mycar"

WORKDIR /donkeys/mycar
RUN echo 'conda activate donkey' >> /root/.bashrc
# SHELL ["conda", "run", "-n", "donkey", "/bin/bash", "-c"]
# ENTRYPOINT ["/bin/bash", "-c", ". activate donkey"]
# GPU capable?
RUN /bin/bash -c ". activate donkey && \
    conda install tensorflow-gpu==2.2.0"
