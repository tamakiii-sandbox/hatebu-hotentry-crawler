#!/bin/bash

END=$(gdate -d "$2" +%s);
DATE=$(gdate -d "$1" +%s); 

while [[ "$DATE" -le "$END" ]]; do
  gdate -d "@$DATE" +%Y%m%d; let DATE+=86400;
done
