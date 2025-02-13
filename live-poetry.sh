#!/bin/bash

# install dependencies
pip install torch torchvision torchaudio
pip install numpy scikit-image
pip install cmake imageio[ffmpeg]
pip install svgwrite svgpathtools cssutils numba torch-tools scikit-fmm easydict visdom
pip install opencv-python==4.5.4.60

# install LIVE
git clone https://github.com/Picsart-AI-Research/LIVE-Layerwise-Image-Vectorization.git
cd LIVE-Layerwise-Image-Vectorization/DiffVG
git submodule update --init --recursive
python setup.py install

# check cuda availability in torch
nvcc --version
nvidia-smi
python -c "import torch; \
print(torch.__version__); \
print(torch.version.cuda); \
print(torch.backends.cudnn.version()); \
torch.cuda.get_device_name(0); \
print(torch.cuda.is_available());"

# configure LIVE experiment
cd ../LIVE
sed -i '
0,/^    init:/s/true/false/;
0,/^    image:/s/true/false/;
0,/^    video:/s/true/false/;
' ./config/base.yaml

# run LIVE
python main.py --config config/base.yaml --experiment experiment_5x1 --signature smile --target figures/smile.png --log_dir log/
