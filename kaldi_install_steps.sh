#date:2016/10/07
#writer:Ming-Han Yang

#cd 到想要安裝的資料夾(例如:cd /usr/local)
git clone https://github.com/kaldi-asr/kaldi.git kaldi-trunk --origin golden

#############################################
# cat kaldi-trunk/INSTALL 
#This is the official Kaldi INSTALL. Look also at INSTALL.md for the git mirror installation.
#[for native Windows install, see windows/INSTALL]
#(1)go to tools/  and follow INSTALL instructions there.
#(2) go to src/ and follow INSTALL instructions there.
#############################################

#-------------------------------------step(1)----------------------------------------
cd kaldi-trunk/tools
#############################################
# cat kaldi-trunk/tools/INSTALL 
#To install the most important prerequisites for Kaldi:
# first do
#  `extras/check_dependencies.sh`
#
#to see if there are any system-level installations or modifications you need to do.
#Check the output carefully: there are some things that will make your life a lot
#easier if you fix them at this stage.
#Then run
#  `make`
#
#If you have multiple CPUs and want to speed things up, you can do a parallel
#build by supplying the "-j" option to make, e.g. to use 4 CPUs:
#
#  `make -j 4`
#############################################
cd kaldi-trunk/tools
./extras/check_dependencies.sh
make 
make -j 4

# if it's not installed 
./extras/install_irstlm.sh               #(ls /usr/local/irstlm/ --> "bin  include  lib")
#./install_srilm.sh, ./install_atlas.sh, ./install_sph2pipe


#-------------------------------------step(2)----------------------------------------
cd kaldi/src

#The "configure" script, located in src/, should be run by typing ./configure. This script takes various options. For instance, you can run
./configure --shared  --use-cuda=yes --cudatk-dir=/usr/local/cuda 

make depend

make -j 8
 
#-----------------------------
make test
