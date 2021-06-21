#!/bin/bash
C='\033[0;36m'
NC='\033[0m'
fileid=1KF1d_GNtJ1OKVLj7ToX7fXL60laWhigK
filename=rtabmap.tar.xz

echo -e "${C}Downloading...${NC}"
wget --save-cookies cookies.txt 'https://docs.google.com/uc?export=download&id='$fileid -O- |
  sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1/p' > confirm.txt

sleep 1

wget --load-cookies cookies.txt -O $filename \
  'https://docs.google.com/uc?export=download&id='$fileid'&confirm='$(< confirm.txt)

if [[ -f "$filename" ]]; then
  echo -e "${C}Extracting...${NC}"
  tar -xf $filename
  echo -e "${C}Cleaning up...${NC}"
  rm -f confirm.txt cookies.txt $filename
  echo -e "${C}Done!${NC}"
else
  echo -e "${C}Download failed...${NC}" 
fi
