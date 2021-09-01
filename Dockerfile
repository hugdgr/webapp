FROM ubuntu

LABEL maintainer="llef@hcuge.ch"

RUN apt-get update
RUN apt-get install -y nginx
RUN rm -Rf /var/www/html
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y  git
RUN sed -i '23 {s/^/#/}' /etc/nginx/sites-available/default
RUN git clone https://github.com/diranetafen/static-website-example.git /var/www/html

#RUN mv -f static-website-example /var/www/html

EXPOSE 80

#ADD static-website-example /var/www/html
CMD ["nginx", "-g", "daemon off;"]

