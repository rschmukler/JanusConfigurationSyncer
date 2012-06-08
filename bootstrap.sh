#!/bin/bash

if [ ! -d $HOME/.janus ]; then
  mkdir $HOME/.janus;
fi

curl -Lo- "http://bit.ly/jcs-rakefile" > $HOME/.janus/Rakefile;
cd $HOME/.janus;
echo "Janus Config Syncer Install Complete\nRun:\n\trake install_create - if you'd like to base your config off of the locally installed configs\n\trake install_copy - if you'd like to use the configs on your git"
