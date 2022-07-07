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
        sleep 2

        read -p "Enter cloned folder direction ( Example: /home/YOURUSERNAME/LCS-LinuxShell/ ) : " dir

        read -p "Enter your username : " username

        read -p "What shell for the terminal do you use? ( zsh, bash, etc ) : " shell

        # If user use zsh shell then we need to change the shell to zsh
        if [ $shell == "zsh" ]; 
        then
            echo "function shellLCS(){" >> /home/naddur/.zshrc
            echo " cd /home/$username/Projects/shell-kernel/" >> /home/$username/.zshrc
            echo " ./a.out" >> /home/$username/.zshrc
            echo "}" >> /home/$username/.zshrc
            echo "shellLCS" >> /home/$username/.zshrc
        fi

        # If user use Bash shell then we need to change the shell to bash
        if [ $shell == "bash" ]; 
        then
            echo "function shellLCS(){" >> /home/naddur/.bashrc
            echo " cd /home/naddur/Projects/shell-kernel/" >> /home/naddur/.bashrc
            echo " ./a.out" >> /home/naddur/.bashrc
            echo "}" >> /home/naddur/.bashrc
            echo "shellLCS" >> /home/naddur/.bashrc
        fi


        echo ""
        echo -e "${ORANGE}${bold}Done! Now write ./a.out into your terminal!${normal}${NC}"
        echo -e "${ORANGE}${bold}And you need to know that this is Alpha version of LCS!${normal}${NC}"
        echo ""
            ;;
esac
