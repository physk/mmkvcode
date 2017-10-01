# MakeMKV Beta Code Updater

## Overview
This script works hand in hand with [ARM](https://github.com/ahnooie/automatic-ripping-machine)

It will grab the lastest beta key from the MakeMKV forums and update the MakeMKV Settings file for you if there is no MakeMKV Settings file presant it will create one for you :+1:

* You can run a basic install using ```./updatemmkvcode.sh -w```. This will grab the code from my webserver
* You can run a more advanced install using ```./updatemmkvcode -p```. This requires you install and extra package (See Advanced Install) But it will grap the App Key from your local machine rather than my server

## Requirements
* MakeMKV
* Working Internet Connection

## Easy use
### Basic Install:
```
sudo su
apt-get install git wget -y
git clone https://github.com/physk/mmkvcode.git
cd mmkvcode
chmod +x updatemmkvcode.sh
chmod +x scripts/get-web.sh
```

### Basic Usage (When you want to update the app_key):
```
sudo su
cd ~/mmkvcode
./updatemmkvcode.sh -w
```

## Advanced Use

### Advanced Install
```
sudo su
apt-get install git wget php-cli -y
git clone https://github.com/physk/mmkvcode.git
cd mmkvcode
chmod +x updatemmkvcode.sh
chmod +x scripts/get-web.sh
```
(You don't need to ```chmod +x scripts/get-web.sh``` if you are running this way, but if you do it has a fallback)

### Advanced Usage (When you want to update the app_key)
```
sudo su
cd ~/mmkvcode
./updatemmkvcode.sh 
```

## Crontab Usage
```
sudo su
crontab -e
```

(If using remote grab)
```
0 1 */5 * * /root/mmkvcode/updatemmkvcode.sh -w > /root/mmkvcode/cron.log
```
(if using local grab)
```
0 1 */5 * * /root/mmkvcode/updatemmkvcode.sh -p > /root/mmkvcode/cron.log
```
(Runs Every 5 Days at 1AM)
