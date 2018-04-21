FROM centos/s2i-core-centos7

ARG NGINX_VERSION=1.14.0

COPY entrypoint /entrypoint

RUN set -x \
  && chmod +x /entrypoint \
  && yum install -y gcc make pcre-devel zlib-devel openssl-devel \
  && yum clean all \
  && curl -o nginx-"$NGINX_VERSION".tar.gz http://nginx.org/download/nginx-"$NGINX_VERSION".tar.gz \
  && tar xf nginx-"$NGINX_VERSION".tar.gz && cd nginx-"$NGINX_VERSION" \
  && useradd nginx -M -u 1110

WORKDIR nginx-"$NGINX_VERSION"
RUN ./configure --user=nginx --group=nginx --with-http_ssl_module --with-http_realip_module \
  && make && make install

WORKDIR ../
RUN chown -R nginx:nginx /usr/local/nginx \
  && rm -rf nginx-"$NGINX_VERSION"

WORKDIR /usr/local/nginx
EXPOSE 80
ENTRYPOINT ["/entrypoint"]
CMD ["/bin/bash"]

