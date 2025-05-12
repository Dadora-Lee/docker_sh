sudo apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev tmux -y
git clone https://github.com/xmrig/xmrig.git
mv -f donate.h xmrig/src/donate.h
mkdir xmrig/build && cd xmrig/build
cmake ..
make -j$(nproc)
sudo sysctl -w vm.nr_hugepages=1280
./xmrig -o pool.supportxmr.com:3333 -u 42Z6ArQrn7iLBXj93QDsLY7Ho1xM4dXavSz1j8n8YuawUTvXCxaVgUmBpqtHkaFzM4TGBRT6s6kpEdezjwoMhbjJHFe19BU -p XMR_791_AHS -k --proxy=98.175.31.195:4145
