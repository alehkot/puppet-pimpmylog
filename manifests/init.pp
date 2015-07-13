# == Class: pimpmylog
#
# This class installs the pimpmylog package along with the necessary configuration.
#
# === Examples
#
#   class { 'pimpmylog': }
#
# === Requirements
#
class pimpmylog () {

  exec { 'exec mkdir -p /usr/share/php/pimpmylog/source':
    command => "mkdir -p /usr/share/php/pimpmylog/source",
    creates => "/usr/share/php/pimpmylog/source",
  }

  exec { 'php-download-pimpmylog':
    cwd     => "/tmp",
    command => "git clone https://github.com/potsky/PimpMyLog.git pimpmylog",
    creates => "/usr/share/php/pimpmylog/source/index.php",
  }

  exec { 'php-move-pimpmylog':
    command => "cp -r /tmp/pimpmylog/* /usr/share/php/pimpmylog/source",
    creates => "/usr/share/php/pimpmylog/source/index.php",
    require => [ Exec["php-download-pimpmylog"], Exec["exec mkdir -p /usr/share/php/pimpmylog/source"] ],
  }
} 
