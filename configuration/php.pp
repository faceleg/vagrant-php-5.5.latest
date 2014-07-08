include apt

apt::ppa { 'ppa:ondrej/php54': }

class { "php":
  source_dir => '/configuration/php/',
  source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
}

php::module { "mysql": }
php::module { "mcrypt": }
php::module { "gd": }
php::module { "curl": }

php::pecl::module { 'xdebug':
  use_package => "no",
}
