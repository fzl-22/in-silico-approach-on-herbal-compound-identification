FROM continuumio/miniconda3:latest

RUN apt-get update --fix-missing && apt-get install openjdk-11-jdk -y && \
  conda create -n pyfingerprint  && \
  echo "conda activate pyfingerprint" >> ~/.bashrc

ENV PATH /opt/conda/envs/pyfingerprint/bin:$PATH

SHELL ["/bin/bash", "--login", "-c"]

WORKDIR /root

ADD cdk_pywrapper /root/cdk_pywrapper

WORKDIR /root/cdk_pywrapper

RUN conda install -c conda-forge python==3.7.3 --y && \
  conda install pip -y && \
  conda install -c rdkit rdkit && \
  conda install ipykernel jupyter jupyterlab pandas numpy matplotlib scikit-learn py4j -y && \
  pip install wget && \
  pip install . && \
  pip install git+https://github.com/EBjerrum/molvecgen && \
  conda install -c conda-forge/label/main openbabel -y && \
  conda install -c mcs07 pubchempy -y

WORKDIR /root/project

CMD ["jupyter-lab", "--ip=0.0.0.0", "--port=8889", "--allow-root"]