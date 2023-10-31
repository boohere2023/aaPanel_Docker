FROM aapanel/aapanel:lib
ENV DEBIAN_FRONTEND=noninteractive
ENV MAINTAINER=Boo

RUN yum -y update

RUN wget https://raw.githubusercontent.com/boohere2023/InstallPrometheus/main/scripts/install-sql-exporter.sh -O /var/install-sql-exporter.sh && chmod +x /var/install-sql-exporter.sh
RUN wget https://raw.githubusercontent.com/boohere2023/InstallPrometheus/main/scripts/install-node-exporter.sh -O /var/install-node-exporter.sh && chmod +x /var/install-node-exporter.sh

EXPOSE 80 443 22 9100 9104 888 7800

#Entrypoint
ENTRYPOINT /var/install-sql-exporter.sh
ENTRYPOINT /var/install-node-exporter.sh
