# issue 2754273 - Image styles fails with absolute path in $settings['file_public_path']

> Drupal path routing fails to address the imageStyle generator when using an absolute path in $settings['file_public_path'].

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

My concern is to use the ability provided by $settings['file_public_path'] and $settings['file_public_base_url'] to 
provide a separate webserver dedicated to serve static files and user content. For security, this web server has 
deliberately no PHP support.

To facilitate the debug of this issue, I created a simple docker-project hosted on Github: 
https://github.com/mickaelperrin/drupal-issues/tree/2754273-image_styles_with_file_absolute_public_path

Steps to reproduce using the docker container:

1. Launch the docker container with docker-compose up -d`
2. Go to http://your.docker.machine.ip:8888
3. Authenticate with drupal / drupal
4. Go to http://your.docker.machine.ip:8888/node/add/article
5. Click on the "Add image" button
6. Select a file

Exepected result: The thumbnail of the selected image is properly displayed

Result: The thumbnail show a missing image (error 404)`
   
## proposed resolution

The problem seems to be related with the `PathProcessor`of the module `image`. It appends at the beggining of the 
public setting path a slash wether the path is absolute or relative. 

In case of absolute path, two slashs begin the path and the method to detect if the path is public or private fails, and
so on the url processing.

The attached add a simple test to check if a slash is needed or not.

You can test the issue with the path by launching the docker containers with the command: `docker-compose -f docker-compose.yml -f docker-compose.patched.yml up -d`
   
## remaining tasks

As it is my first patch and I am new to Drupal, a review is obviously needed.
   
## user interface changes

N/A
   
## api changes

N/A

## data model changes

N/A

