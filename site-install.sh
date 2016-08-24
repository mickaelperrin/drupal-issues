#!/usr/bin/env bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIRNAME=$(basename "$DIR")
DIRNAME_SANITISED=${DIRNAME//[-_\ ]}

DRUSH="docker exec -u www-data ${DIRNAME_SANITISED}_drupal_1 /var/www/html/vendor/bin/drush --root=/var/www/html "
DOCKER_EXEC="docker exec ${DIRNAME_SANITISED}_drupal_1 "

cd $DIR
docker-compose build
docker-compose up -d
docker exec -u www-data ${DIRNAME_SANITISED}_drupal_1 composer --working-dir=/var/www/html -vvv update
sleep 5
docker exec ${DIRNAME_SANITISED}_drupal_1 /wait-composer.sh

echo "Trying to install drupal with custom installation_profile"
CMD="$DOCKER_EXEC bash -c 'chmod -R ug+rw /var/www/html/sites'; $DRUSH site-install base --locale=fr -y --site-mail=www@config-installer --db-url=mysql://drupal:drupal@mysql:3306/drupal --site-name=\"drupal_config_installer\" --account-name=\"drupal\" --account-pass=\"drupal\" --account-mail=\"dev@mickaelperrin.fr\""
echo $CMD
eval $CMD
echo ""

echo "Trying to export Drupal configuration"
CMD="$DOCKER_EXEC bash -c 'rm -f /config/*.yml';$DRUSH config-export -y "
echo $CMD
eval $CMD
echo ""

echo "Trying to install drupal with config_installer"
CMD="$DOCKER_EXEC bash -c 'chmod -R ug+rw /var/www/html/sites';$DRUSH site-install config_installer --locale=fr -y --site-mail=www@config-installer --db-url=mysql://drupal:drupal@mysql:3306/drupal --site-name=\"drupal_config_installer\" --account-name=\"drupal\" --account-pass=\"drupal\" --account-mail=\"dev@mickaelperrin.fr\""
echo $CMD
eval $CMD
echo ""

