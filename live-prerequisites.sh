#!/bin/bash

# update ubuntu
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

# install gcc-5
sudo apt install gcc-5 -y
sudo ln -sf /usr/bin/gcc-5 /usr/bin/gcc
sudo apt install g++-5 -y
sudo ln -sf /usr/bin/g++-5 /usr/bin/g++

# install other dependencies
sudo apt install librhash0
sudo apt install make

# install cuda
wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.7.0/local_installers/cuda-repo-wsl-ubuntu-11-7-local_11.7.0-1_amd64.deb
sudo dpkg -i cuda-repo-wsl-ubuntu-11-7-local_11.7.0-1_amd64.deb
sudo cp /var/cuda-repo-wsl-ubuntu-11-7-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda

# add cuda paths to .bashrc
TEXT_TO_APPEND="\nexport PATH=/usr/local/cuda-11.7/bin:\$PATH\nexport LD_LIBRARY_PATH=/usr/local/cuda-11.7/lib64:\$LD_LIBRARY_PATH\n"
BASHRC="$HOME/.bashrc"
if ! grep -Fxq "$TEXT_TO_APPEND" "$BASHRC"; then
    echo -e "$TEXT_TO_APPEND" >> "$BASHRC"
    echo "CUDA paths added successfully."
else
    echo "CUDA paths already exist in .bashrc."
fi
echo "Reloading .bashrc..."
source "$HOME/.bashrc"

# install python3.7
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt install python3.7 -y
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1
sudo apt install python3.7-dev -y

# install pipx
sudo apt install python3.7-venv -y
sudo apt install python3-pip -y
sudo pip3 install pipx
sudo pipx ensurepath
source "$HOME/.bashrc"

# install poetry
pipx install poetry
sudo pipx ensurepath
source "$HOME/.bashrc"
poetry new live
cd live
poetry run bash ../live-poetry.sh
