#!/bin/bash

apk update
apk upgrade
grep -v '^#' /extra-packages | xargs apk add && \
