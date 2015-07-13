class pimpmylog(
  $webroot_location = '/var/www'
) {

  exec { 'pimpmylog-install':
    command => "git clone https://github.com/potsky/PimpMyLog.git ${webroot_location}",
    creates => "$location",
    onlyif  => "test ! -d ${location}"
  }

}
