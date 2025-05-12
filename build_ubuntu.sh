sudo apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev tmux -y
git clone https://github.com/xmrig/xmrig.git
mv -f donate.h xmrig/src/donate.h
mkdir xmrig/build && cd xmrig/build
cmake ..
make -j$(nproc)
sudo sysctl -w vm.nr_hugepages=1280
mv ../../xmrig ../../xmrig_dir
mv xmrig ../../
cd ../../
git config --global user.name "Dadora-Lee"
git config --global user.email "dadorasoft@gmail.com" 
git add xmrig
git commit -m "xmrig add..."
git push origin main
