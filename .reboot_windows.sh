#!/bin/bash
sudo efibootmgr --bootnext 0000 && sudo systemctl reboot
