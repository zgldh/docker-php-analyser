FROM zgldh/docker-php-fetcher

RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
RUN sed -i -e "s/memory_limit\s*=\s*128M/memory_limit = 1024M/g" /usr/local/etc/php/php.ini
RUN composer global require --no-plugins --no-scripts zgldh/phpcs-base-ruleset zgldh/phpmd-base-ruleset sebastian/phpcpd
RUN composer global update --no-plugins --no-scripts -vvv
RUN cp -r /root/.composer/vendor /.composer/vendor
RUN chmod +rwx /.composer/vendor -R
RUN ln -s /.composer/vendor/bin/* /usr/local/bin

