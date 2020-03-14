# Chrinstallers

Es un script ejecutado en lenguaje bash que facilitar un paquete de instalación personalizado con los siguientes programas:

- ### Postgres
Lo instalo con el comando:
>sudo apt-get -y install postgresql postgresql-contrib
- ### Pgadmin
Uso la llave de pgadmin y su repositorio:
> wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
> sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
- ### Openjdk
Hago uso de dos personal package archives (ppa) para instalar Openjdk 11:
>ppa:linuxuprising/java
- ###  R
Hago uso de dos personal package archives (ppa) para instalar R:
>ppa:martter/rrutter3.5
>ppa:marutter/c2d4u3.5
- ### Rstudio
Lo descargo directo de la página de Rstudio
>[Rstudio](https://rstudio.com/products/rstudio/download/ "Rstudio")
