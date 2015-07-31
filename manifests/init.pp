# == Class: motd
#
# module to manage motd
#
class motd (

) {
  #$banner = $::role ? {
  #  'puppetmaster' => 'Puppet Master',
  #  'webserver'    => 'Web Server',
  #  default        => 'Unknown',

  case $::role {
    'puppetmaster': {
      $banner = 'This server is the Puppet Master'
    }
    'webserver': {
      $banner = 'This server is a Web Server'
    }
    default: {
      fail('Unknown type of server')
    }
  }
  #$banner = "Have fun and try not to break anything\n"
    file { '/etc/motd':
      ensure => file,
      #source => 'puppet:///modules/motd/motd',
      content => $banner,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
}
