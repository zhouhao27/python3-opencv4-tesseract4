#!/bin/bash
set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=frankmail007
# image name
IMAGE=python3-opencv4-tesseract4
docker build -t $USERNAME/$IMAGE:latest .