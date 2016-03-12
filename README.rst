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

2. Build base image. And some platform images are also uploaded.

.. code:: bash

    $ packer build platforms/docker.json

.. |Build Status| image:: https://travis-ci.org/FGtatsuro/infra-bridgehead.svg?branch=master
   :target: https://travis-ci.org/FGtatsuro/infra-bridgehead
