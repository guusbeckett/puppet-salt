# Class: salt::minion::install
#
#
class salt::minion::install {

  if $salt::minion::package_manage {
    if $::osfamily == 'windows' {
      package { $salt::minion::package_name:
        ensure          => $salt::minion::package_ensure,
        source          => "C:/temp/Salt-Minion-${salt::minion::salt_release}-Py3-${facts['os']['architecture']}-Setup.exe",
        install_options => ['/S'],
      }
    }

    else {
      package { $salt::minion::package_name:
        ensure => $salt::minion::package_ensure,
      }
    }

    if $salt::minion::additional_packages {
      ensure_packages($salt::minion::additional_packages)
    }
  }

}
