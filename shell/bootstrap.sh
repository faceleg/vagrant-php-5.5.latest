#!/bin/sh
export DEBIAN_FRONTEND=noninteractive

APT_GET=/usr/bin/apt-get
$APT_GET -q -y install git puppet librarian-puppet

PUPPET_DIR='/vagrant/puppet'
if [ `gem query --local | grep librarian-puppet | wc -l` -eq 0 ]; then
  cd $PUPPET_DIR && librarian-puppet install --clean
else
  cd $PUPPET_DIR && librarian-puppet update
fi

librarian-puppet config tmp /tmp --global

sudo -E puppet apply -vv --modulepath=$PUPPET_DIR/modules/ $PUPPET_DIR/manifests/main.pp

