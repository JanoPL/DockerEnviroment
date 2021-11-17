FROM centos:7
LABEL Component="nginx" \
      Name="centos/nginx-centos7" \
      version="1.2" \
      release="1" \
      author="JanoPL"

RUN yum -y install --setopt=tsflags=nodocs centos-release-scl-rh epel-release && \
    yum -y update --setopt=tsflags=nodocs && \
    yum -y install --setopt=tsflags=nodocs scl-utils nginx iproute openssl && \
    yum clean all

RUN mkdir -p /usr/share/nginx/html

#ENV CONTAINER_SCRIPTS_PATH=/usr/share/container-scripts/nginx \
#ENABLED_COLLECTIONS=rh-nginx18
#
## Get prefix path and path to scripts rather than hard-code them in scripts
#ENV CONTAINER_SCRIPTS_PATH=/usr/share/container-scripts/nginx \
#ENABLED_COLLECTIONS=rh-nginx18
#
## When bash is started non-interactively, to run a shell script, for example it
## looks for this variable and source the content of this file. This will enable
## the SCL for all scripts without need to do 'scl enable'.
#ENV BASH_ENV=${CONTAINER_SCRIPTS_PATH}/scl_enable \
#    ENV=${CONTAINER_SCRIPTS_PATH}/scl_enable \
#    PROMPT_COMMAND=". ${CONTAINER_SCRIPTS_PATH}/scl_enable"

ADD Services/nginx/root /

# ADD https://git.centos.org/sources/httpd/c7/acf5cccf4afaecf3afeb18c50ae59fd5c6504910 /usr/share/nginx/html/
# RUN sed -i -e 's/Apache/nginx/g' -e '/apache_pb.gif/d' /usr/share/nginx/html/index.html
#RUN echo "nginx on CentOS7" > /usr/share/nginx/html/index.html

EXPOSE 8080

RUN ["chmod", "+x", "/usr/bin/container-entrypoint" , "/usr/bin/nginx_script", "usr/bin/openssl_generate"]

RUN sh /usr/bin/openssl_generate

ENTRYPOINT ["/usr/bin/container-entrypoint"]

CMD [ "/usr/bin/nginx_script" ]
