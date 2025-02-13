# LIVE setup

This is a setup script for [LIVE](https://github.com/Picsart-AI-Research/LIVE-Layerwise-Image-Vectorization/tree/main), a novel image vectorization method where you gain control over the amount of forms and paths of the resulting vector image.

LIVE depends on deprecated libraries. The standard Ubuntu package manager does not list its requirements anymore in newer releases than Ubuntu 18.04 LTS.
Since Google Colab does not support Ubuntu 18.04 LTS any longer, the notebook provided by the authors of LIVE does not work anymore.

This script takes away all the finnicky bits of setting up an environment for this pile of deprecated libraries and packages.

## Prerequisites

1. Having CUDA compatible hardware, the script will install the Nvidia CUDA toolkit in version 11.7
2. Instantiating a **fresh** installation of **Ubuntu 18.04 LTS**
3. Possessing `sudo` rights
4. Pulling this repository

## Running the setup

After fulfilling the prerequisites, run the following command:

```bash
source live-prerequisites.sh
```

## Additional notes

Yes, the setup script is not optimal. It would work without `poetry` but I accidentally made it working inside its own sub-shell first and did not have the time to fix it yet.
