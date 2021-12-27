#!/bin/bash

# create symlinks to EBS volume
echo "Creating symlinks"
mkdir /home/ec2-user/SageMaker/.torch && ln -s /home/ec2-user/SageMaker/.torch /home/ec2-user/.torch
mkdir /home/ec2-user/SageMaker/.fastai && ln -s /home/ec2-user/SageMaker/.fastai /home/ec2-user/.fastai

# clone the course notebooks
echo "Clone the course repo"
git clone https://github.com/fastai/fastbook.git /home/ec2-user/SageMaker/course-v4

echo "Install a new kernel for fastai with name 'Python 3'"
python -m ipykernel install --name 'fastai' --display-name 'Python 3' --user

echo "Update fastai library"
pip install fastai2

echo "Install the deps for the course"
pip install fastai2>=0.0.11 graphviz ipywidgets matplotlib nbdev>=0.2.12 pandas scikit_learn azure-cognitiveservices-search-imagesearch sentencepiece

echo "Install jupyter nbextension"
source /home/ec2-user/anaconda3/bin/activate JupyterSystemEnv
pip install jupyter_contrib_nbextensions
jupyter contrib nbextensions install --user

echo "Restarting jupyter notebook server"
pkill -f jupyter-notebook
