# Gebruik een Ubuntu-image als basis
# FROM ubuntu:22.04
FROM ubuntu:latest

# Update de pakketlijst en installeer Apache2, PHP en de MySQL-extensie
# Add the ondrej/php repository.
RUN apt update
RUN apt install -y software-properties-common
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y
RUN apt update

# Install PHP.
RUN DEBIAN_FRONTEND=noninteractive apt install -y php8.4
COPY ./conf/deltion.ini /etc/php/8.4/apache2/conf.d/30-deltion.ini

# Stel de tijdzone in
ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Kopieer je webbestanden naar de Apache-map
COPY ./html/ /var/www/html/

# Stel de juiste rechten in voor Apache
RUN chown -R www-data:www-data /var/www/html/

# Exposeer poort 80 (de standaard HTTP-poort)
EXPOSE 80

# Start de Apache-service op de voorgrond
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]