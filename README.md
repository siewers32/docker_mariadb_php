# Docker setup webapplication
## Installatie Docker voor Windows:
Docker maakt gebruik van Linux. In Windows 11 kun je gebruik maken van [Windows Subsysteem voor Linux](https://learn.microsoft.com/nl-nl/windows/wsl/about). Hiermee kun je naast windows ook gebruik maken van Linux. Docker kan samenwerken met WSL. Om Docker te installeren moet je dus eerst WSL(2) installeren.

* [Installatie windows op docker.com](https://docs.docker.com/desktop/setup/install/windows-install/)
* [Installeer Docker voor WSL2-backend](https://learn.microsoft.com/en-us/windows/wsl/install)

## Installatie Docker voor Mac:
Het macintosh besturingssysteem is gebaseerd op Unix (FreeBSD). Docker kan hierop draaien. Je kunt dus direct aan de slag met het installeren van Docker Desktop.

## Gebruik maken van Docker images en het draaien van containers.
In deze github-respository vind je de installatiescripts voor 3 images.
* Drie images worden gedownload
    * PHPMyAdmin (beheer database server)
    * MariaDB server (database server)
    * Ubuntu Server (web- en applicatieserver)

#### Database server
* PHP kan gegevens uitwisselen met de database-server. De database-server draait in een aparte container.

#### PHPMyAdmin
* PHPMyAdmin is een aparte image en draait in een aparte container. Dit is een PHP-applicatie in een aparte container waarmee je databases kunt beheren op de MySQL server.

#### Ubuntu (Apache/PHP)
* De Ubuntu server is uitgebreid met een webserver (Apache). Naast Apache is ook PHP geinstalleerd en geconfigureerd als extensie van Apache. Apache en PHP werken dus samen om php-bestanden uit te voeren en te publiceren.

#### Docker
Om de containers te bouwen en te configureren met de benodigde componenten worden er 2 bestanden gebruikt:
* Dockerfile
* docker-compose.yml

#### Dockerfile
De dockerfile bevat de instructies die nodig zijn om een bestaand image (ubuntu:latest) uit te breiden en te configureren met een applicatieserver (Apache/PHP).

#### De docker-compose.yml
Dit bestand bevat de instructies om de verschillende containers met elkaar samen te laten werken.
Pas onderstaande regels aan met eigen passwords:

```shell
      MARIADB_ROOT_PASSWORD: root_password
      MARIADB_DATABASE: my_database
      MARIADB_USER: my_user
      MARIADB_PASSWORD: my_password
```

## Installatie images en containers.
* Voer onderstaand commando uit in een terminal (bijv. powershell)
* Hiermee worden de benodigde images gedownload en geconfigureerd en de containers worden opgestart.

`docker compose up`

## Check of alles het doet
* Open een webbrowser en ga naar `http://127.0.0.1`
* Klik op de link om naar `http://127.0.0.1:8080` te gaan. Kijk of je kunt inloggen in PHPMyAdmin met gebruikersnaam en wachtwoord zoals je hebt ingesteld.