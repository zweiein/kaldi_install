#date:2015/11/23
#writer:Yang Ming-Han

# Install Kaldi on 154
# Required tools : if you have installed Kaldi already

# ------------------steps:------------------

#cd <path-you-want>
# download any kind of kaldi source code on github
git clone https://github.com/kaldi-asr/kaldi.git kaldi-trunk --origin golden

cd kaldi-trunk


rm -rf tools
#Link to the installed tools
ln -s /usr/local/kaldi-trunk/tools


cd kaldi/src

#The "configure" script, located in src/, should be run by typing ./configure. This script takes various options. For instance, you can run
./configure --shared --mkl-root=/opt/intel/mkl --mkl-libdir=/opt/intel/mkl/lib/intel64 --mathlib=MKL --use-cuda=yes --cudatk-dir=/usr/local/cuda 

# Ensure to use `make clean` befire you make depend!!!!!!!

#after you set the ./configure, you should edit src/kaldi.mk,
#add a new line with `OPENFST_VER=1.3.4`

make depend

make -j 8

# check whether kaldi install
make test   
