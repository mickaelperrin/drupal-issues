# issue XXX -

> 

## how to use this docker project

this docker project is intended to give a quick and easy way to reproduce the bug by using a ready to use drupal image
with the settings responsible for the bug.

to run drupal **with the bug**, simply start docker with:

    docker-compose up -d

to run drupal **with the patch**, override the docker configuration with:

    docker-compose -f docker-compose.yml -f docker-compose.patched.yml up -d
    
then, open your browser at: `http://your.docker.machine.ip:8888`

the admin user login **and** password is simply: `drupal`

## problem/motivation

Steps to reproduce using the docker container:

1. Launch the docker container
2. Go to http://your.docker.machine.ip:8888
3. Authenticate with drupal / drupal
   
## proposed resolution

(description of the proposed solution, the rationale behind it, and workarounds for people who cannot use the patch.)
   
## remaining tasks

(reviews needed, tests to be written or run, documentation to be written, etc.)
   
## user interface changes

(new or changed features/functionality in the user interface, modules added or removed, changes to url paths, changes to user interface text.)
   
## api changes

(api changes/additions that would affect module, install profile, and theme developers, including examples of before/after code if appropriate.)

## data model changes

(database or configuration data changes that would make stored data on an existing site incompatible with the site's updated codebase, including changes to hook_schema(), configuration schema or keys, or the expected format of stored data, etc.)

## original report by [username]

(text of the original report, for legacy issues whose initial post was not the issue summary. use rarely.)
