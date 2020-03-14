# ! /bin/bash
# script para instalar postgres, pgadmin4, java y R
# autor: giocom21

option=0

#Funcion para instalar postgres
install_postgres () {
	echo -e "\nVerifying that Postgres is not installed..."	
	verify_insPost=$(which psql)
	if [ $? -eq 0 ]; then
		echo "Postgres is alredy installed..."
	else
		read -s -p "Enter password (root):" password
		echo -e "\n"
		read -s -p "Enter new password for user postgres:" passwdPostgres
		echo "$password" | sudo -S apt-get update
		echo "$password" | sudo -S apt-get -y install postgresql postgresql-contrib
		sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '{$passwdPostgres}';"
		echo "$password" | sudo -S systemctl enable postgresql.service
		echo "$password" | sudo -S systemctl start postgresql.service
	fi
	read -n 1 -s -r -p "[ENTER] to continue..."
}

#Funcion para instalar Pgadmin4-NO FUNCIONA
install_pgadmin4 () {
	echo -e "\nVerifying that Pgamdin4 is not installed..."	
	verify_instPgadm=$(which pgadmin4)
	if [ $? -eq 0  ]; then
		echo -e "Pgadmin4 is alredy installed..."
	else
		read -s -p "Enter password (root):" password
		echo "$password" | wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
		#llega hasta esta linea
		echo "$password" | sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
		echo "$password" | sudo -S apt-get update
		echo "$password" | sudo -S apt-get -y install pgamdin4 pgamdin4-apache2
	fi
	read -n 1 -s -r -p "[ENTER] to continue..."
}

#Funcion para instalar Openjdk-11
install_openjdk11 () {
	echo -e "\nVerifying that Openjdk11 is not installed..."	
	verify_instPgadm=$(which java)
	if [ $? -eq 0  ]; then
		echo -e "Openjdk11 is alredy installed..."
	else
		read -s -p "Enter password (root):" password
		echo "$password" | sudo -S apt-add-repository ppa:linuxuprising/java 
		echo "$password" | sudo -S apt-get update	
		echo "$password" | sudo -S apt-get -y install openjdk-11-jdk openjdk-11-jre
	fi
	read -n 1 -s -r -p "[ENTER] to continue..."
}

#Funcion para instalar r
install_r () {
	echo -e "\nVerifying that R is not installed..."	
	verify_instPgadm=$(which R)
	if [ $? -eq 0  ]; then
		echo -e "R is alredy installed..."
	else
		read -s -p "Enter password (root):" password
		echo "$password" | sudo -S apt-add-repository ppa:marutter/rrutter3.5 
		echo "$password" | sudo -S apt-add-repository ppa:marutter/c2d4u3.5
		echo "$password" | sudo -S apt-get update
		echo "$password" | sudo -S apt-get -y install r-base
	fi
	read -n 1 -s -r -p "[ENTER] to continue..."
}

#Funcion para instalar rstudio
install_rstudio () {
	echo -e "\nVerifying that rstudio is not installed..."	
	verify_instPgadm=$(which rstudio)
	if [ $? -eq 0  ]; then
		echo -e "Rstudio is alredy installed..."
	else
		read -s -p "Enter password (root):" password
		echo "$password" | sudo -S apt-get -y install libclang-dev
		cd ~/Downloads/
		wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.2.5033-amd64.deb 
		echo "$password" | sudo -S dpkg -i rstudio-1.2.5033-amd64.deb
		rm rstudio-1.2.5033-amd64.deb
	fi
	read -n 1 -s -r -p "[ENTER] to continue..."
}

r_menu () {
	opt = 0
	while :
	do
		clear
    	#Desplegar el menú de opciones
    	echo "_________________________________________"
	    echo "               Utility Installers        "
	    echo "_________________________________________"
	    echo "                   MENU                  "
	    echo "_________________________________________"
	    echo " 1. Install r"
	    echo " 2. Install rstudio"
	    echo " 3. Install r and rstudio"
	    echo " 4. Back"
		
		read -n 1 -p "Enter a option [1-4]:" opt

		case $opt in
			
			1)
				install_r
				sleep 3
				;;
			2)
				install_rstudio
				sleep 3
				;;
			3)
				install_r
				install_rstudio
				sleep 3
				;;
			4) 
				menu
				;;
		esac	
	done
}

menu() {
	while :
	do
	    clear
    	#Desplegar el menú de opciones
	    echo "_________________________________________"
    	echo "               Utility Installers        "
	    echo "_________________________________________"
    	echo "                   MENU                  "
	    echo "_________________________________________"
	    echo " 1. Install Postgres"
    	echo " 2. Install Pgadmin4"
	    echo " 3. Install Opendjdk-11"
    	echo " 4. Install r and rstudio"
	    echo " 5. Exit"
	
		read -n 1 -p "Enter a option [1-5]:" option
	
		case $option in
			1)
				install_postgres
				sleep 3
				;;
			2)
				install_pgadmin4
				sleep 3
				;;
			3)
				install_openjdk11
				sleep 3
				;;
			4)
				r_menu
				sleep 3
				;;
			5)
				echo -e "\nExit Utility Postgres"
				exit 0
				;;
		esac
	done
}
cd ~/
menu
