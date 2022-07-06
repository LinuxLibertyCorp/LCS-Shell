#!/bin/bash

# Color

ORANGE='\033[0;33m'

NC='\033[0m'

# Text types

bold=$(tput bold)
normal=$(tput sgr0)

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="LCS SHELL INSTALLATION"
TITLE="Hello $USER"

OPTIONS=(1 "Install this Shell?")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
        while true; do
                echo "LCS SHELL Installation"
            echo " "
            read -p "Do you wish to install LCS SHELL??(yes or no) " yn
            case $yn in
                [Yy]* ) gcc main.c -lreadline; break;; 
                [Nn]* ) exit;;
                * ) echo "Please answer yes or no.";;
            esac
        done

        echo ""
        echo -e "${ORANGE}Wait...${NC}"
        echo ""
        {
            for ((i = 0 ; i <= 100 ; i+=20)); do
                sleep 1
                echo $i
                gcc main.c -lreadline
            done
        } | whiptail --gauge "Please wait while installing" 6 60 0

        echo ""
        echo -e "${ORANGE}${bold}Done! Now write ./a.out into your terminal!${normal}${NC}"
        echo -e "${ORANGE}${bold}And you need to know that this is Alpha version of LCS!${normal}${NC}"
        echo ""
            ;;
esac
