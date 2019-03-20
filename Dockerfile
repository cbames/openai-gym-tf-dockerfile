FROM tensorflow/tensorflow:nightly-gpu-py3
MAINTAINER Barrett Ames <cbames@gmail.com>


Run pip install gym pyopengl

RUN apt-get update && \
    apt-get -y install xvfb x11vnc fluxbox wmctrl && \ 
    apt-get clean && \
    rm -r /var/lib/apt/lists/* /root/.cache/pip/

# Jupyter Notebook
EXPOSE 8888
# TensorBoard
EXPOSE 6006
# VNC
EXPOSE 5900 

COPY run.sh /
CMD ["/run.sh", "--allow-root"]


