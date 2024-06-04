#!/bin/bash
# Written by tuiVYeqr/nRr1+Qgp5+qyl/KGJmELU9U6f9uv6mSeYE= . 
# a very simple bash interface ment to help streamline testing 
# or the actuall setup of nordvpn in Linux. The nickname feature is not included. 
# Its to kind of keep it simple to new users, to avoid name mixups. 
# 2024-06-03

echo "Have you installed NordVPN?"
options0=("Yes 1" "No 2")
select op in "${options0[@]}"
  do
    case $op in
        "Yes 1")
            echo " Now would be a good time to make sure that you're logged in :) " 
            echo " Running command: nordvpn login "
            nordvpn login
            echo " but you could also continue without logging in "
            read -sn 1 -p "Press any key to continue..."
            echo " We will also try to connect you now to NordVPN servres! let it finish"
            echo " If you did not login you will continue without being connected  and this will just return a small error, no worries! :)"
            echo " Running command: nordvpn connect"
            nordvpn connect 
            read -sn 1 -p "Press any key to continue..."
            clear
            PS3='Please enter your choice: by number or string. '
            options=("Settings 1" "Meshnet 2" "Status 3" "StartVPN 4" "StopVPN 5" "Quit 6")
            select opt in "${options[@]}"
            do
                case $opt in
                    "Settings 1")
                        
                        echo "Apply the 'set' settings in NordVPN"
                        echo -n "set to threatprotectionlite 1 or 0: " 
                        read threatprotectionlite
                        nordvpn set threatprotectionlite $threatprotectionlite
                        
                        echo -n "set to firewall 1 or 0: " 
                        read firewall
                        nordvpn set firewall $firewall
                        
                        echo -n "set to fwmark 1 or 0: " 
                        read fwmark
                        nordvpn set fwmark $fwmark

                        echo -n "set to ipv6 1 or 0: " 
                        read ipv6
                        nordvpn set ipv6 $ipv6

                        echo -n "set to notify 1 or 0: "
                        read notify
                        nordvpn set notify $notify

                        echo -n "set routing to 1 or 0: "
                        read routing
                        nordvpn set routing $routing

                        echo -n "set to analytics 1 or 0: "
                        read analytics
                        nordvpn set analytics $analytics

                        echo -n "set to autoconnect 1 or 0: "
                        read autoconnect
                        nordvpn set autoconnect $autoconnect

                        echo -n "set to mesh 1 or 0: "
                        read mesh
                        nordvpn set mesh $mesh

                        echo -n "set to killswitch 1 or 0: "
                        read killswitch
                        nordvpn set killswitch $killswitch

                        echo -n "set to lan-discovery 1 or 0: "
                        read lan
                        nordvpn set lan-discovery $lan
                        
                        echo -e "***************************"
                        echo -e "*** YOUR NORDVPN STATUS ***"
                        echo -e "***************************"
                        echo -e '\n'
                        nordvpn status

                        echo -e "*****************************"
                        echo -e "*** YOUR NORDVPN SETTINGS ***"
                        echo -e "*****************************"
                        echo -e '\n'
                        nordvpn settings
                        echo -e "\n"
                     ;;
                    "Meshnet 2")
                        
                        echo "Now we we look at your Meshnet settings"
                        echo " First you need to set the name  or nickname of the targetmachine that you wish to configure"
                        echo " The statments will take either allow/deny or yes/no awnsers depending on the question."
                        echo " Each statment will contain the apporopiate information"
                        echo " You will now be prometed with a list showing the names and information about each peer in your network"
                        read -sn 1 -p "Press any key to continue..."
                        echo -e "***************************"
                        echo -e "******** peer list ********" 
                        echo -e "***************************"
                        echo -e "\n"
                        nordvpn mesh peer list
                        echo -e "Now please fill out the Name of your target machine: "
                        read target
                        echo -n "press Enter to contineue"
                        read ans
                        echo -n "set incoming connections to this current device allow/deny: "
                        read incoming
                        nordvpn meshnet peer incoming $incoming $target
                        echo -n "set routing to be allowed through THIS DEVICE, i.e use this device as an endpoint alLow/deny: "
                        read routing
                        nordvpn meshnet peer routing $routing $target 
                        echo -n "set local this device to be visability on local lan to allow/deny: "
                        read local
                        nordvpn meshnet peer local $local $target 
                        echo -n "set fileshareing to be allowed or denyed to THIS DEVICE, allow/deny: "
                        read fileshareing
                        nordvpn meshnet peer fileshare $fileshareing $target 
                        echo -n "shall AutoAccept incoming files be allowed or denyed on THIS DEVICE, allow/deny: "
                        read $AutoAccept
                        nordvpn meshnet peer auto-accept $AutoAccept $target 

                        echo -n "would you like to connect this device to your TARGETMACHINE and use it as an endpoint? allow/deny: "
                        read connect
                        nordvpn meshnet peer connect $target $connect 

                        echo -e "***************************"
                        echo -e "*** YOUR NORDVPN STATUS ***"
                        echo -e "***************************"
                        echo -echo -e "\n"e '\n'
                        nordvpn status

                        echo -e "*****************************"
                        echo -e "*** YOUR NORDVPN SETTINGS ***"
                        echo -e "*****************************"
                        echo -e '\n'
                        nordvpn settings
                        echo -e "\n"
                     ;;
                    "Status 3")
                        echo "This is your current status and settings:"
                        echo -e '\n'
                        echo -e "***************************"
                        echo -e "*** YOUR NORDVPN STATUS ***"
                        echo -e "***************************"
                        nordvpn version
                        echo -e '\n'
                        nordvpn status

                        echo -e "*****************************"
                        echo -e "*** YOUR NORDVPN SETTINGS ***"
                        echo -e "*****************************"
                        echo -e '\n'
                        nordvpn settings
                        echo -e "\n"
                        echo -e "***************************"
                        echo -e "***  YOUR ACCOUNT INFO  ***"
                        echo -e "***************************"
                        nordvpn version
                        nordvpn account
                        echo -e "*********************************"
                        echo -e "***List of available countries***"
                        echo -e "*********************************"            
                        echo -e "\n"
                        nordvpn countries
                     ;;
                    "StartVPN 4")
                        nordvpn connect
                        echo -e "***************************"
                        echo -e "*** YOUR NORDVPN STATUS ***"
                        echo -e "***************************"
                        echo -e '\n'
                        nordvpn status
                    ;;
                    "StopVPN 5")
                        nordvpn disconnect
                        echo -e "***************************"
                        echo -e "*** YOUR NORDVPN STATUS ***"
                        echo -e "***************************"
                        echo -e '\n'
                        nordvpn status
                        nordvpn logout
                    ;;
                    "Quit 6")
                        exit
                    ;;
                    *) echo "invalid option $REPLY";;
                esac
                echo 'To re-run: Press enter for the menu or is it byebye time: write 6'
                options=("Settings 1" "Meshnet 2" "Status 3" "StartVPN 4" "StopVPN 5" "Quit 6")
                #echo "$options"
            done
        ;;

        "No 2")
            echo -e "Lets install it then??"
            options1=("yes 1" "nah 2")
            select optt in "${options1[@]}"
            do
                case $optt in
                    "yes 1")
                        echo -e "running : sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh) To install "
                        sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)
                        echo -e "Now lets login by running: nordvpn login "
                        nordvpn login
                        echo -e " To connect run the command 'nordvpn connect' " once youre done logging in.
                        echo -e "#nordvpn connect "
                        echo "To see full instaltaion guide, vistit: https://nordvpn.com/download/linux/ "
                    ;;
                    "Nah 2")
                        break
                    ;;
                esac
            done
        ;;
        *) echo "invalid option $REPLY";;
    esac
  done