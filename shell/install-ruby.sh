#!/bin/sh

# Adapted from http://leonard.io/blog/2012/05/installing-ruby-1-9-3-on-ubuntu-12-04-precise-pengolin/

export DEBIAN_FRONTEND=noninteractive

APT_GET=/usr/bin/apt-get

$APT_GET update
$APT_GET install -q -y ruby1.9.1 ruby1.9.1-dev \
  rubygems1.9.1 irb1.9.1 ri1.9.1 rdoc1.9.1 \
  build-essential libopenssl-ruby1.9.1 libssl-dev zlib1g-dev

sudo update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby1.9.1 400 \
  --slave   /usr/share/man/man1/ruby.1.gz ruby.1.gz \
  /usr/share/man/man1/ruby1.9.1.1.gz \
  --slave   /usr/bin/ri ri /usr/bin/ri1.9.1 \
  --slave   /usr/bin/irb irb /usr/bin/irb1.9.1 \
  --slave   /usr/bin/rdoc rdoc /usr/bin/rdoc1.9.1

sudo update-alternatives --set ruby /usr/bin/ruby1.9.1
sudo update-alternatives --set gem /usr/bin/gem1.9.1

sudo gem install puppet

