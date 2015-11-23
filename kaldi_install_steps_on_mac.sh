#date:2015/01/07
#writer:Yang Ming-Han

# Install Kaldi on macOs
# Required tools : Homebrew

# ------------------steps:------------------

# download kaldi source code
svn co https://svn.code.sf.net/p/kaldi/code/trunk kaldi-trunk

#To install the prerequisites for Kaldi, type
cd kaldi/tools

#install automake
brew install automake

#install autoconf
brew install autoconf

#install Libtool     
#Take care of that the permission of homebrew's owner cannot be change to 'root'.
#You should use chown to change the owner of this path below, and then install Libtool: 
#chown <your_account> /usr/local/include
brew install Libtool

#compile Kaldi code
make

#or if you have multiple CPUs and want to use them, type something like:
make -j 4

#and note that if you have multiple CPUs, you might want to supply 
#an option like "-j 4" to "make"; this will speed things up.

cd ~
cd kaldi/src

#The "configure" script, located in src/, should be run by typing ./configure. This script takes various options. For instance, you can run
#154 new: ./configure --shared --mkl-root=/opt/intel/mkl --mkl-libdir=/opt/intel/mkl/lib/intel64 --mathlib=MKL --use-cuda=yes --cudatk-dir=/usr/local/cuda --clapack-root=/usr/local/kaldi-trunk/tools/CLAPACK --atlas-root=/usr/local/kaldi-trunk/tools/ATLAS --fst-root=/usr/local/kaldi-trunk/tools/openfst
./configure  --shared

#after you set the ./configure, you should edit src/kaldi.mk,
#add a new line with `OPENFST_VER=1.3.4`

make depend

make

# check whether kaldi install
make test   
