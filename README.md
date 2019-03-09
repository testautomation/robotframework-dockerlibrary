# robotframework-dockerlibrary

## What?
A [Robot Framework](https://robotframework.org/) library to control [Docker](https://www.docker.com/) containers

It will mostly be a wrapper around [docker.py](https://github.com/docker/docker-py) - the Python library for the Docker Engine API [1][2]


## Why?
because


## How to get started?
```
cd tests/
pip install -r requirements.txt
robot -d results -L TRACE robot/

# check logs.html in results folder (auto-created after test run)
# look at the code of the lib and the tests
# You got the idea!
```
> NOTE: The initial run will take a while because MongoDB Docker image (aprox. 400 MB) will be pulled in the background. ... may be I should use a smaller image for demo :-)


FEATURES
---

  - Docker Containers
    - run, stop, remove, inspect

  - Docker Services
    - ...

Status
---
PRE-ALPHA :-)


Contributiion
---
Clone/fork, create a pull-request, create an issue ... what ever

Any contribution is welcome! 




[1] https://github.com/docker/docker-py

[2] https://docker-py.readthedocs.io/en/stable/
