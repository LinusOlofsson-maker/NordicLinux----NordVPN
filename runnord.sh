#!/bin/bash
# Written by tuiVYeqr/nRr1+Qgp5+qyl/KGJmELU9U6f9uv6mSeYE= . 
# a very simple bash interface ment to help streamline testing 
# or the actuall setup of nordvpn in Linux. The nickname feature is not included. 
# Its to kind of keep it simple to new users, to avoid name mixups. 
# 2024-06-03

PS3='Please enter your choice: by number or string. '
options=("Settings 1" "Meshnet 2" "Status 3" "StartVPN 4" "StopVPN 5" "Quit 6")
select opt in "${options[@]}"
do
    case $opt in
        "Settings 1")
            nordvpn login
            echo "Apply the 'set' settings in NordVPN"
            echo -n "set to threatprotectionlite 1 or 0: " 
            read threatprotectionlite
            nordvpn set threatprotectionlite $threatprotectionlite
            
            echo -n "set to firewall 1 or 0: " 
            read firewall
            nordvpn set Firewall $firewall
            
            echo -n "set to fwmark 1 or 0: " 
            read fwmark
            nordvpn set Firewall $fwmark

            echo -n "set to ipv6 1 or 0: " 
            read ipv6
            nordvpn set Firewall $ipv6

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
            nordvpn login
            echo "Set the Meshnet settings"
            echo " First you need to set the hostmachines NordName or nickname"
            echo " Then set the configs to allow/deny"
            echo " peer list: " 
            nordvpn mesh peer list
            echo -n "NordName"
            read NordName
            echo -n "set incoming connections to"
            read incoming
            nordvpn meshnet peer incoming $incoming $$NordName
            echo -n "set routing trought THIS device to"
            read routing
            nordvpn meshnet peer routing $routing $NordName 
            echo -n "set local visability on lan to"
            read local
            nordvpn meshnet peer local $local $NordName 
            echo -n "set fileshareing to THIS device to"
            read fileshareing
            nordvpn meshnet peer fileshare $fileshareing $NordName 
            echo -n "set auto-accept incoming files to THIS device to"
            read auto
            nordvpn meshnet peer auto-accept $auto $NordName 

            echo -n "connect this device TO your chosen peer:"
            read connect
            nordvpn meshnet peer connect $connect $NordName 

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
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
    echo 'Rerun: Press enter or byebye time: Enter 6'
    options=("Settings 1" "Meshnet 2" "Status 3" "StartVPN 4" "StopVPN 5" "Quit 6")
    #echo "$options"
done



