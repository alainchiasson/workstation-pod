Workstation Pod
================

In using kubernetes - or even docker - I constanly have the need in development to
view the cluster from inside a container. In a training situation, it can also be used to view things from inside a container or pod.

Usage
=====

- deploy.kub : deploys the container in a kubernetes workspace.
- destroy.kub : will teardown the infrastructure and shutdown the pod.
- status.kub : will display the infrastructure - deployment, replica set and pod.
- connect.kub : will exec /bin/bash into the container
- bounce.kub : will delete the pod, the replica set will restart it using the "latest" image.

Development
===========

The philosophy is simply to have a CentOS image with some basic tools for probing
a container and the cluster. The basic workflow is toe make changes, build, push
and bounce the pods.

Build will create a new docker image from the Docker file
push - will push it out to the repo ( you must first be logged in )

Design
======

The files used to build the application are all contained below `files-build`. This
is copied into the container, and the script prepare is run to install all packages
listed in the rpmlist file.

The main command is a sleep loop, to keep the container alive without consuming
resources (eg: a `while true` would be bad ). The loop is interupted by the same
signal a docker stop command sends.

Future Design
=============

Currently not too sure what can be done in future design. The following come to
mind but are not essential:

- Add more trouble shooting tools or scripts.
- Make the container priveledged.
- Volume management ? (not sure what this could mean)
- Installable scripts for management
- Using the API instead of kubectl for control
- Figure out how to place MOTD when connecting
- Try automate things using git hooks and merge requests
