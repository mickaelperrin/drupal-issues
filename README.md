# issue 2658912 - Error with configurable language

> 

## how to use this docker project

this docker project is intended to give a quick and easy way to reproduce the bug by using a ready to use drupal image
with the settings responsible for the bug.

to run drupal **with the bug**, simply start docker with:



Steps to reproduce using the docker container:

1. Launch the docker container
2. Launch the script `./site-install.sh`

Expected result: install succeed with config files given

Result: install fails with error

```
Error: Class 'Drupal\language\Entity\ConfigurableLanguage' not found in /var/www/html/core/includes/install.core.inc on line 1581
Error: Class &#039;Drupal\language\Entity\ConfigurableLanguage&#039; not found in install_download_additional_translations_operations() (line 1581 of /var/www/html/core/includes/install.core.inc).
Drush command terminated abnormally due to an unrecoverable error.       [error]
``
