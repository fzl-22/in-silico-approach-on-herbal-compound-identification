FROM jupyter/scipy-notebook:2023-06-01 

USER root

RUN apt-get update && apt-get install git -y