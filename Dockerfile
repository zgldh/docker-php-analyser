FROM zgldh/docker-php-fetcher

RUN composer global require --no-plugins --no-scripts zgldh/phpcs-base-ruleset sebastian/phpcpd phpmd/phpmd
RUN composer global update --no-plugins --no-scripts -vvv
RUN cp -r /root/.composer/vendor /.composer/vendor
RUN chmod +rwx /.composer/vendor -R
RUN ln -s /.composer/vendor/bin/* /usr/local/bin
