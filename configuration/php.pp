class php55 {
  file { "/etc/apt/sources.list":
    ensure => file,
    owner => root,
    group => root,
    source => "/configuration/apt/sources.list",
  }

  exec { "import-gpg":
    command => "/usr/bin/wget -q http://www.dotdeb.org/dotdeb.gpg -O -| /usr/bin/apt-key add -"
  }

  exec { "apt-get update":
    command => "/usr/bin/apt-get update",
    require => [
      File["/etc/apt/sources.list"],
      Exec["import-gpg"]
    ],
  }

}

class { "php55": }
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
