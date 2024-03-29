FROM ubuntu:18.04
ADD VERSION .
# Update Ubuntu Software repository and install 
RUN apt-get update && apt-get install --no-install-recommends -y \
  software-properties-common \
  build-essential \
  cmake \
  libsm6 \
  libxext6 \
  libxrender-dev \
  tesseract-ocr \
  fish \
  vim \
  git \
  python3 \
  python3-dev \
  python3-pip && \
  if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
  if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
  pip install --no-cache --upgrade pip setuptools wheel && \
  rm -rf /var/lib/apt/lists/*

# RUN add-apt-repository ppa:deadsnakes/ppa
# RUN apt install -y \
#   python3-pip && \
#   if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
#   if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
#   rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache --upgrade \ 
  opencv-contrib-python \
  pillow \
  pytesseract \
  imutils

# RUN pip install --no-cache --upgrade \ 
#   pytesseract \
#   imutils

# Install vim
ADD ./vimrc /root/.vimrc
# 用vundle管理vim插件
RUN git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim && \
  # 安装vim插件
  vim -c PluginInstall -c q -c q && \
  python /root/.vim/bundle/youcompleteme/install.py --clang-completer

# Add configuration file for fish
RUN mkdir -p /root/.config/fish
ADD ./config.fish /root/.config/fish/config.fish

CMD ["fish"]
