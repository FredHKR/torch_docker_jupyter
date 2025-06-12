# Använd pytorch som basbild
FROM pytorch/pytorch:2.3.1-cuda12.1-cudnn8-runtime

# Definiera en variabel för Python-versionen
ARG PYTHON_VERSION=3.11.9

# Sätt DEBIAN_FRONTEND till noninteractive för att undvika frågor
ENV DEBIAN_FRONTEND=noninteractive

# Installera nödvändiga paket
RUN apt-get update && apt-get install -y \
    wget \
    git \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    curl \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libffi-dev \
    liblzma-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV HOME="/root"
WORKDIR $HOME
# Installera pyenv
ENV PYENV_ROOT /root/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
RUN curl https://pyenv.run | bash

# Installera specifik version av Python med pyenv
RUN pyenv install ${PYTHON_VERSION} && \
    pyenv global ${PYTHON_VERSION}

# Kontrollera att pyenv och python är korrekt installerade
RUN pyenv versions
RUN python --version

#
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


# Starta Jupyter Lab när containern startar
CMD jupyter lab --notebook-dir=/torch_docker_jupyter --no-browser --ip=0.0.0.0 --port=8888 --allow-root --IdentityProvider.token='' --ServerApp.password=''


