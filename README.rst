|Build Status|

infra-bridgehead
==================================================

This project generates the base image for various infrastructures.

It is mainly used for infrastructure testing on CI.
The contents it includes are  as follows.

- Python(>= 2.7.9) (For Ansible)
- Ruby(>= 2.0) (For Serverspec)

Requirements
------------

The dependencies on other softwares/librarys for this project.

- Debian
    - Python (2.7.x)
    - pip (>= 8.0.3)
- OSX
    - Python (2.7.x)
    - pip (>= 8.0.3)
    - Homebrew (>= 0.9.5)

How to
------

1. Setup Packer build environment.

.. code:: bash

    $ pip install -r requirements.txt
    $ ansible-galaxy install -r role_requirements.yml
    $ ansible-playbook playbooks/buildenv.yml -i inventory/default -l buildenv

2. Build base image.

.. code:: bash

    $ packer build platforms/docker.json

3. If you want to upload the image, you need to use the way for each image type.

.. code:: bash

    # Docker
    $ docker login -e="$DOCKER_EMAIL" -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
    $ docker push fgtatsuro/infra-bridgehead:debian-jessie

.. |Build Status| image:: https://travis-ci.org/FGtatsuro/infra-bridgehead.svg?branch=master
   :target: https://travis-ci.org/FGtatsuro/infra-bridgehead
