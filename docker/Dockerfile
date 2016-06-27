FROM drupal:8

# Git for patch
RUN apt-get update \
 && apt-get install -y git

# Composer to get up-to-date vendor libraries
ENV COMPOSER_HOME /composer
ENV PATH /composer/vendor/bin:$PATH
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN php -r "readfile('https://getcomposer.org/installer');" > /tmp/composer-setup.php \
&& php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot && rm -rf /tmp/composer-setup.php

RUN /usr/local/bin/composer global require 'hirak/prestissimo' && mkdir -p /composer/cache && chown -R www-data:www-data /composer && chmod -R ug+rwX /composer

# Entrypoint to get script shells and patchs run on laucnch
RUN mkdir -p /docker-entrypoint.d \
 && mkdir -p /patches
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["apache2-foreground"]