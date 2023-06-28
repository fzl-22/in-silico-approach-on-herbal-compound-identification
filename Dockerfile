FROM continuumio/miniconda3:latest

RUN apt-get update && apt-get install openjdk-11-jdk -y

WORKDIR /root

RUN git clone https://github.com/hcji/PyFingerprint.git

WORKDIR /root/PyFingerprint

RUN conda env create -f env/pyfingerprint_env.yml

ENV PATH /opt/conda/envs/pyfingerprint/bin:$PATH

RUN echo "conda activate pyfingerprint" >> ~/.bashrc

SHELL ["/bin/bash", "--login", "-c"]

RUN pip install . && \
  pip install git+https://github.com/EBjerrum/molvecgen && \
  conda install -c conda-forge/label/main openbabel -y && \
  conda install -c mcs07 pubchempy -y && \
  conda install jupyter jupyterlab ipykernel

WORKDIR /root/project

CMD ["jupyter-lab","--ip=0.0.0.0","--no-browser","--allow-root"]
