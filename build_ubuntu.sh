sudo apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev nano tmux -y
git clone https://github.com/xmrig/xmrig.git
mv -f donate.h xmrig/src/donate.h
mkdir xmrig/build && cd xmrig/build
cmake ..
make -j$(nproc)
sudo sysctl -w vm.nr_hugepages=1280
