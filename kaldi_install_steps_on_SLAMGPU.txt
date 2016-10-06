#date:2016/10/07
#writer:Ming-Han Yang

# ------------------steps:------------------

#cd <path-you-want>
# download any kind of kaldi source code on github
git clone https://github.com/kaldi-asr/kaldi.git kaldi-trunk --origin golden

cd kaldi-trunk/tools/extras

# firt do `extras/check_dependencies.sh` to see if there are any system-level installations or modifications you need to do.
# Check the output carefully: there are some things that will make your life a lot
# easier if you fix them at this stage.

./extras/check_dependencies.sh
make 
make -j 4

# if it's not installed
./install_irstlm.sh

cd ..
# install srilm, sph2pipe, atlas

cd kaldi/src

#The "configure" script, located in src/, should be run by typing ./configure. This script takes various options. For instance, you can run
./configure --shared  --use-cuda=yes --cudatk-dir=/usr/local/cuda 

make depend

make -j 8
 
