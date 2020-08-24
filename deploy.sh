#!/bin/bash

set -e
set -x

git push
ssh deployer@madrubyscience.com "PATH=/home/deployer/.rbenv/bin:/home/deployer/.rbenv/shims:$PATH; cd checkouts/jtub_site && git pull && bundle && bundle exec middleman build"
