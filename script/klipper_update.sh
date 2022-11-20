#!/bin/bash

#sudo service klipper stop

cd ~/klipper

#git pull

# Update mcu Octopus (PE11 setting)
echo "Start update Octopus"
echo ""
make clean
#make menuconfig KCONFIG_CONFIG=/home/pi/klipper_config/script/octopus.config
make KCONFIG_CONFIG=/home/pi/klipper_config/script/octopus.config
read -p "Octopus firmware built, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
python3 ~/CanBoot/scripts/flash_can.py -i can0 -f ./out/klipper.bin -u d45b5b1f51ee
read -p "Octopus firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
echo "Finish update Octopus"
echo ""

# Update mcu EBB
echo "Start update EBB"
echo ""
make clean
#make menuconfig KCONFIG_CONFIG=/home/pi/klipper_config/script/ebb.config
make KCONFIG_CONFIG=/home/pi/klipper_config/script/ebb.config
read -p "Octopus firmware built, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
python3 ~/CanBoot/scripts/flash_can.py -i can0 -f ./out/klipper.bin -u 3f84ce1c4cd8
read -p "EBB firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
echo "Finish update Octopus"
echo ""

#sudo service klipper start
