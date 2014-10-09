include apt

/* apt::ppa { 'ppa:ondrej/php5': } */

class { "php":
  /* require => Apt::Ppa['ppa:ondrej/php5'], */
  source_dir => '/configuration/php/',
  source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
  /* version => '5.5.14+dfsg-2+deb.sury.org~precise+1' */
}

php::module { "mysql": }
php::module { "mcrypt": }
php::module { "gd": }
php::module { "curl": }
php::module { "sqlite": }

php::pecl::module { 'xdebug':
  use_package => "no",
}
