FROM ubuntu:18.04
ADD VERSION .
# Update Ubuntu Software repository and install 
# RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update && apt install -y \
  software-properties-common \
  libsm6 \
  libxext6 \
  libxrender-dev \
  tesseract-ocr \
  fish \
  vim \
  git \
  python3 && \
  if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
  # python -m pip install --no-cache --upgrade pip && \
  # if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
  rm -rf /var/lib/apt/lists/*

# RUN pip install \ 
#   opencv-contrib-python \
#   pillow \
#   pytesseract \
#   imutils

# Install vim
ADD ./vimrc /root/.vimrc
# 用vundle管理vim插件
RUN git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim
# 安装vim插件
RUN vim -c PluginInstall -c q -c q

# Add configuration file for fish
RUN mkdir -p /root/.config/fish
ADD ./config.fish /root/.config/fish/config.fish

CMD ["fish"]
