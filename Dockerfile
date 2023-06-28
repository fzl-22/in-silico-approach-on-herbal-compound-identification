FROM python:3

RUN apt-get update && apt-get install git -y

COPY --from=openjdk:11-jre-slim /usr/local/openjdk-11 /usr/local/openjdk-11

ENV JAVA_HOME /usr/local/openjdk-11

RUN update-alternatives --install /usr/bin/java java /usr/local/openjdk-11/bin/java 1

RUN useradd -rm -d /home/ahmadfaisal -s /bin/bash -g root -G sudo ahmadfaisal

USER ahmadfaisal

WORKDIR /home/ahmadfaisal

RUN python -m venv /home/ahmadfaisal/pyfingerprint python==3.8 && \ 
  . /home/ahmadfaisal/pyfingerprint/bin/activate

RUN git clone https://github.com/hcji/PyFingerprint.git

WORKDIR /home/ahmadfaisal/PyFingerprint

RUN pip install cuda-python tensorflow rdkit faiss-cpu && \
  pip install --extra-index-url=https://pypi.ngc.nvidia.com --trusted-host pypi.ngc.nvidia.com nvidia-cudnn && \
  pip install git+https://github.com/EBjerrum/molvecgen	&& \
  wget -P /home/ahmadfaisal https://files.pythonhosted.org/packages/9d/3f/f08f5d1422d74ed0e1e612870b343bfcc26313bdf9efec9165c3ea4b3ae2/openbabel-3.1.1.1.tar.gz && \
  tar -xzvf ../openbabel-3.1.1.1.tar.gz && \
  cd ../openbabel-3.1.1.1 && \
  python setup.py install && \
  pip install /home/ahmadfaisal/PyFingerprint

CMD ["pwd"]