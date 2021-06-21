#! /bin/bash
C='\033[0;36m'
NC='\033[0m'
VERSION=$(rosversion -d)

if [[ -x /usr/bin/gcc-9 ]] && [[ -x /usr/bin/g++-9 ]]; then
	echo -e "${C}GCC 9 already installed ${NC}"
else
    echo -e "${C}Installing and export GCC 9...${NC}"
	sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
	sudo apt update -y
	sudo apt install -y gcc-9 g++-9
	export CC=gcc-9
	export CXX=g++-9
fi

source download_data.sh