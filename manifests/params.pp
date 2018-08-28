class opendkim::params {
  $user = 'opendkim'
  $group = 'opendkim'
  $uid = -1
  $gid = -1

  $pidfile = '/var/run/opendkim/opendkim.pid'
  $homedir = '/var/run/opendkim'
  $mode = 'sv'

  $package_name = 'opendkim'

  $log_why = 'no'
  $canonicalization = 'relaxed/simple'
  $subdomains = 'yes'
  $socket = 'inet:8891@127.0.0.1'
  $umask = '0022'
  $trusted_hosts = ['::1', '127.0.0.1', 'localhost']

  $keys = []
  $nameservers       = undef

  $removeoldsignatures = 'no'

  $service_enable    = true
  $service_ensure    = 'running'

  case $::osfamily {
    'Debian': {
      $configfile       = '/etc/opendkim.conf'
      $sysconfigfile    = '/etc/default/opendkim'
      $configdir        = '/etc/opendkim'
      $service_name     = 'opendkim'
    }
    'Redhat': {
      $configfile       = '/etc/opendkim.conf'
      $sysconfigfile    = '/etc/sysconfig/opendkim'
      $configdir        = '/etc/opendkim'
      $service_name     = 'opendkim'
    }
    'FreeBSD': {
      $configfile       = '/usr/local/etc/mail/opendkim.conf'
      $sysconfigfile    = false
      $configdir        = '/usr/local/etc/mail/'
      $service_name     = 'milter-opendkim'
    }
    default: {
      fail("${::operatingsystem} is not supported by this module.")
    }
  }
}
