#cd 到想要安裝的資料夾(例如:cd /usr/local)
git clone https://github.com/kaldi-asr/kaldi.git kaldi-trunk --origin golden

#-------------------------------------step(1)檢查及安裝Kaldi主程式所需的外部函式庫 (必要)----------------------------------------
cd kaldi-trunk/tools

# 檢查哪些所需套件尚未安裝，如果有的話會出現訊息提醒你(有些如果安裝失敗表示需要加sudo)
./extras/check_dependencies.sh
sudo make 
sudo make -j 4

#-------------------------------------step(2)檢查及安裝Kaldi使用時所需的外部函式庫 (非必要)----------------------------------------
# 安裝其它外部程式，理論上應該執行完就安裝好了
./extras/install_irstlm.sh
./extras/install_beamformit.sh
./extras/install_sph2pipe

# 這個安裝起來比較麻煩，要自己到官方網站下載
./extras/install_srilm.sh


#-------------------------------------step(3)編譯Kaldi主程式----------------------------------------
cd kaldi/src

# --cudatk-dir放的是cuda的位置
./configure --shared  --use-cuda=yes --cudatk-dir=/usr/local/cuda 

sudo make depend

sudo make -j 4


#-------------------------------------step(4)檢查安裝是否完成----------------------------------------
make test
