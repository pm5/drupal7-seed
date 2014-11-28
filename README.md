
A Docker image for Drupal development using PHP-FPM and nginx.

This image is built for development, not deployment, so it does not contain the app directory `public`.  Changes to the content of `public` are reflected immediately in the container.

Usages
------

        # Put your Drupal site under `public`
        $ make build run
        # check http://localhost:8080/

Bugs
----

If you use [boot2docker][] on OS X and install Drupal 7 with a SQLite database, the installer will complain "Drupal already installed".  This seems to be caused by some [OS X volume permission issue][].  For now changing file permission of the SQLite database file in the *host machine* can fix this:

        $ chmod a+w public/sites/default/files/.ht.sqlite

[boot2docker]: https://github.com/boot2docker/boot2docker/
[OS X volume permission issue]: https://github.com/boot2docker/boot2docker/issues/581
