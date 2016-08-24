# issue 2789321 Event loop till memory_limit when trying to import a config that contains webprofiler module

> Config_installer enters in a endless event onsave loop when trying to import a config that contains webprofiler module.  

## how to use this docker project

> Be sure to have retrieve all the submodules by using `git submodule update --recursive --init` or by cloning directly
> this repo with the `--recursive` clone option.

this docker project is intended to give a quick and easy way to reproduce the bug by using a ready to use drupal image
with the settings responsible for the bug.

to run drupal **with the bug**, simply start docker with `./site-install.sh`


