class pimpmylog(
  $webroot_location = '/var/www'
) {

  $location = "$webroot_location/pimpmylog"

  exec { 'pimpmylog-install':
    command => "git clone https://github.com/potsky/PimpMyLog.git ${location}",
    creates => "$location",
    onlyif  => "test ! -d ${location}"
  }

}
