FROM ubuntu:18.04
# Update Ubuntu Software repository
RUN apt update
# Install Python 3.7
RUN apt install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt install -y python3.7
# Install pip
RUN apt install -y python3-pip
# Install opencv python
RUN python3.7 -m pip install opencv-contrib-python
RUN apt install -y libsm6 libxext6 libxrender-dev
# Install Tesseract
RUN apt install -y tesseract-ocr
# Install Tesseract python and extra modules
RUN python3.7 -m pip install pillow
RUN python3.7 -m pip install pytesseract
RUN python3.7 -m pip install imutils
# Fish shell
RUN apt install -y fish
# Tools
RUN apt install -y vim
# Aliase for python3.7
RUN echo 'alias python=python3.7' >> ~/.bashrc
# Set fish as default shell
RUN chsh -s /usr/bin/fish
RUN fish


