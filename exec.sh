#!/bin/sh

sudo chef-solo -c conf.rb -j chef.json -E me

