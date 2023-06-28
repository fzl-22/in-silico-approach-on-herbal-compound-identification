FROM continuumio/anaconda3:latest

USER root

RUN apt-get update && apt-get install sudo git openjdk-11-jdk -y

RUN useradd -rm -d /home/ahmadfaisal -s /bin/bash -g root -G sudo -u 1001 ahmadfaisal

WORKDIR /root

RUN conda update -n base -c defaults conda -y

RUN git clone https://github.com/hcji/PyFingerprint.git

WORKDIR /root/PyFingerprint

RUN . /root/.bashrc && \
  conda install -c rdkit -c anaconda -c conda-forge -c defaults cudatoolkit==10.0.130 cudnn==7.6.4 tensorflow-gpu==2.0.0 rdkit faiss -y && \
  pip install git+https://github.com/EBjerrum/moladvecgen && \
  conda install -c conda-forge/label/main openbabel -y && \
  pip install . && \
  conda install jupyter ipykernel tensorflow-estimator==2.0.0 numpy pandas matplotlib -y && \
  conda install -c mcs07 pubchempy -y

WORKDIR /root/project

RUN chown -R ahmadfaisal /root/project

USER ahmadfaisal

# RUN chown -R ahmadfaisal /opt/conda && \
#   chown -R ahmadfaisal /home/ahmadfaisal

# USER ahmadfaisal
# RUN conda env create -f env/pyfingerprint_env.yml

# SHELL ["/bin/bash", "-c"]

# RUN conda init bash && . /home/ahmadfaisal/.bashrc

# RUN conda activate pyfingerprint
# ## SHELL ["conda", "run", "-n", "pyfingerprint", "/bin/bash", "-c"]

# RUN pip install git+https://github.com/EBjerrum/moladvecgen

# RUN conda install -c conda-forge/label/main openbabel -y

# RUN pip install .

# RUN conda install jupyter ipykernel tensorflow-estimator==2.0.0

# RUN conda install -c mcs07 pubchempy

# RUN conda install openbabel

CMD ["/opt/conda/envs/pyfingerprint/bin/jupyter-lab","--ip=0.0.0.0","--no-browser","--allow-root"]
