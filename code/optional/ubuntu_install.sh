#1/bin/bash

# link: http://patorjk.com/software/taag/#p=display&c=bash&f=ANSI%20Shadow&t=Ubuntu%20Install
show_header(){
cat << "HEADER"
   __  ____                __           ____           __        ____
  / / / / /_  __  ______  / /___  __   /  _/___  _____/ /_____ _/ / /
 / / / / __ \/ / / / __ \/ __/ / / /   / // __ \/ ___/ __/ __ `/ / /
/ /_/ / /_/ / /_/ / / / / /_/ /_/ /  _/ // / / (__  ) /_/ /_/ / / /
\____/_.___/\__,_/_/ /_/\__/\__,_/  /___/_/ /_/____/\__/\__,_/_/_/
                                        Developed by Frank Junior
HEADER
}

function menu(){
  show_header
  echo
  echo "========================================================="
  echo -e "\t\tPACKAGE MENU"
  echo "========================================================="
  echo " [1] Telegram"
  echo " [2] Transmission"
  echo " [3] Postman"
  echo " [4] VirtualBox 6.1"
  echo " [5] Docker"
  echo "========================================================="
  read -p "[Choose a package you want to install]: " opcao
}

clear
menu

case "$opcao" in
  1)
    echo "Installing Telegram..."
    ansible-playbook $(dirname $0)/telegram/telegram_install.yaml
  ;;
  2)
    echo "Installing Transmission..."
    ansible-playbook --ask-become-pass $(dirname $0)/transmission_install.yaml
  ;;
  3)
    echo "Installing Postman..."
    ansible-playbook $(dirname $0)/postman/postman_install.yaml
  ;;
  4)
    echo "Installing VirtualBox 6.1..."
    bash $(dirname $0)/install_virtualbox.sh
  ;;
  *)
  5)
    echo "Installing Docker..."
    bash $(dirname $0)/docker_install.sh
  ;;
  *)
    echo "Invalid Option"
  ;;
esac