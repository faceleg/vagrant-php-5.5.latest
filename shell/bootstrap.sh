#!/bin/sh
export DEBIAN_FRONTEND=noninteractive

APT_GET=/usr/bin/apt-get

$APT_GET update
$APT_GET -q -y install git puppet

PUPPET_DIR='/vagrant/puppet'
if [ `gem query --local | grep librarian-puppet | wc -l` -eq 0 ]; then
  gem install librarian-puppet
  cd $PUPPET_DIR && librarian-puppet install --clean
else
  gem update
  cd $PUPPET_DIR && librarian-puppet update
fi

sudo -E puppet apply -vv --modulepath=$PUPPET_DIR/modules/ $PUPPET_DIR/manifests/

