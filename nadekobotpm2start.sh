#!/bin/sh
echo ""
echo "NadekoBot pm2 Startup. Please ensure you have installed pm2/NodeJS/npm with the installer script first!"

echo ""
root=$(pwd)


choice=5
	echo "1. Run in pm2 with Auto Restart normally without updating NadekoBot."
	echo "2. Run in pm2 with Auto Restart and update NadekoBot."
	echo "3. Run NadekoBot in pm2 normally without Auto Restart."
	echo "4. Exit"
	echo -n "Choose [1] to Run NadekoBot in pm2 with auto restart on "die" command without updating itself, [2] to Run in pm2 with Auto Updating on restart after using "die" command, and [3] to run without any auto-restarts or auto-updates."
while [ $choice -eq 5 ]; do
read choice
if [ $choice -eq 1 ] ; then
	echo ""
	wget -N https://github.com/Kwoth/NadekoBot-BashScript/raw/1.9/NadekoARN.sh 
	cd "$root"
	echo "Starting Nadeko in pm2 with auto-restart without auto-update..."
	sudo pm2 start "$root/NadekoARN.sh" --interpreter=bash --name=Nadeko
	echo ""
	echo "If you did everything correctly, pm2 should have started up Nadeko! Please use sudo pm2 info Nadeko to check. You can view pm2 logs with sudo pm2 logs Nadeko"
else
	if [ $choice -eq 2 ] ; then
		echo ""
		wget -N https://github.com/Kwoth/NadekoBot-BashScript/raw/1.9/NadekoARU_Latest.sh 
		cd "$root"
		sudo pm2 start "$root/NadekoARU_Latest.sh" --interpreter=bash --name=Nadeko	
		echo ""
		echo "If you did everything correctly, pm2 should have started up Nadeko! Please use sudo pm2 info Nadeko to check. You can view pm2 logs with sudo pm2 logs Nadeko"
	else
		if [ $choice -eq 3 ] ; then
		echo ""
		wget -N https://github.com/Kwoth/NadekoBot-BashScript/raw/1.9/nadeko_run.sh
		cd "$root"
		sudo pm2 start "$root/nadeko_run.sh" --interpreter=bash --name=Nadeko	
		echo ""
		echo "If you did everything correctly, pm2 should have started up Nadeko! Please use sudo pm2 info Nadeko to check. You can view pm2 logs with sudo pm2 logs Nadeko"	
		else
			if [ $choice -eq 4 ] ; then
				echo ""
				echo "Exiting..."
				cd "$root"
				exit 0
			else
				clear
				echo "1. Run in pm2 with Auto Restart normally without updating NadekoBot."
				echo "2. Run in pm2 with Auto Restart and update NadekoBot."
				echo "3. Run NadekoBot in pm2 normally without Auto Restart."
				echo "4. Exit"
				echo -n "Choose [1] to Run NadekoBot in pm2 with auto restart on "die" command without updating itself, [2] to Run in pm2 with Auto Updating on restart after using "die" command, and [3] to run without any auto restarts or auto-updates."
				choice=5
			fi
		fi
	fi
fi
done

cd "$root"
rm "$root/nadekobotpm2start.sh"
exit 0
