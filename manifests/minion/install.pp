# Class: salt::minion::install
#
#
class salt::minion::install {

  if $salt::minion::package_manage {
    if $::osfamily == 'windows' {

      if $salt::minion::salt_release == 'latest' or !$salt::minion::salt_release{
        $salt_release_name = 'Latest'
      }
      else {
        $salt_release_name = $salt::minion::salt_release
      }

      package { $salt::minion::package_name:
        ensure          => $salt::minion::package_ensure,
        source          => "C:/temp/Salt-Minion-${salt_release_name}-Py3-AMD64-Setup.exe",
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
