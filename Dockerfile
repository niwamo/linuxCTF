FROM debian:latest

ENV container docker
ENV DEBIAN_FRONTEND noninteractive

# prep
RUN adduser -u 1000 kevin; \
    adduser -u 1020 tfc; \
    addgroup sus && usermod -aG sus kevin; \
    apt-get update ; \
    apt-get install -y systemd systemd-sysv netcat curl wget file unzip nginx sudo binutils procps; \
    apt-get clean ; \
    usermod -aG sudo tfc; \
    sed -i '/^%sudo/ s/ALL$/ NOPASSWD:ALL/' /etc/sudoers; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ; \
    rm -rf /lib/systemd/system/multi-user.target.wants/* ; \
    rm -rf /etc/systemd/system/*.wants/* ; \
    rm -rf /lib/systemd/system/local-fs.target.wants/* ; \
    rm -rf /lib/systemd/system/sockets.target.wants/*udev* ; \
    rm -rf /lib/systemd/system/sockets.target.wants/*initctl* ; \
    rm -rf /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* ; \
    rm -rf /lib/systemd/system/systemd-update-utmp*

VOLUME [ "/sys/fs/cgroup" ]

# 01
RUN mkdir -p /home/.hidden_flag_dir/ && echo FLAG1_42448 > /home/.hidden_flag_dir/.data

# 02
RUN echo FLAG2_63992 | base64 > /tmp/flag2

# 03
RUN cat /dev/random | head -1000 > /var/log/flaglog && echo 'FLAG3_55352' >> /var/log/flaglog && cat /dev/random | head -1000 >> /var/log/flaglog

# 04 - see service

# 05
RUN sed -i 's/^user www-data/user kevin/' /etc/nginx/nginx.conf;
RUN sed -i '/^sus:/ s/$/,FLAG5_41442/' /etc/group

# 06 - see service
RUN sed -i '/root \/var\/www\/html;/a add_header Set-Cookie "flag6_28257";' /etc/nginx/sites-enabled/default

# 07 
COPY oddfile /etc/cron.d/

# 08  
RUN echo FLAG8_67923 >> /etc/timezone

# 09 
RUN echo FLAG9_49457 >> /lib/systemd/system/nginx.service

# start our service
COPY flag_http /var/www/html/index.nginx-debian.html
COPY boot.target /etc/systemd/system/
CMD ["/lib/systemd/systemd", "--unit=boot.target"]