# Define for the SaltStack Repo
# Adds the nessesary package repo to download the SaltStack packages.
#
# @param salt_release
#   latest or any valid release. This variable is used for the repo url.
#   More infos here: [https://repo.saltstack.com/]
#   Example: 2019.2.0 (To pin the repo url to a specific version)
#
# @param release
#   Optional release to use in the apt source string.
#
# @param repo_url
#   Optional full repo URL to use to download the packages.
#
# @param base_repo_url
#   Optional base Repo URL from which to use to download the packages.
#
define salt::repo (
  String $salt_release = $title,
  String $release = '',
  Optional[String] $repo_url = undef,
  Optional[String] $base_repo_url = undef,
) {
  if !$base_repo_url {
    $base_repo_url = 'http://repo.saltstack.com'
  }
  if $facts['os']['family'] != 'Windows' {
    if $release == '' {
      $repo_release = $facts['os']['distro']['codename']
    }
    else {
      $repo_release = $release
    }
  }

  case $facts['os']['family'] {
    'Debian': {
      include apt

      if $repo_url {
        $_url = $repo_url
      } else {
        if $salt_release == 'latest' {
          $_url = "${base_repo_url}/py3/${facts['os']['name'].downcase}/${facts['os']['distro']['release']['major']}/${facts['os']['architecture']}/latest"
        } else {
          $_url = "${base_repo_url}/py3/${facts['os']['name'].downcase}/${facts['os']['distro']['release']['major']}/${facts['os']['architecture']}/archive/${salt_release}"
        }
      }

      apt::source { "repo_saltstack_com_${name}":
        ensure   => 'present',
        location => $_url,
        release  => $repo_release,
        repos    => 'main',
        key      => {
          id     => '754A1A7AE731F165D5E6D4BD0E08A149DE57BFBE',
          source => "${_url}/SALTSTACK-GPG-KEY.pub",
        },
        include  => {
          'deb' => true,
          'src' => false,
        },
      }
    }

    'Windows': {
      if $salt_release == 'latest' {
        $salt_release_name = 'Latest'
      } else {
        $salt_release_name = $salt_release
      }
      if $repo_url {
        $_url = "${repo_url}/Salt-Minion-${salt_release_name}-Py3-AMD64-Setup.exe"
      }
      else {
        $_url = "${base_repo_url}/windows/Salt-Minion-${salt_release_name}-Py3-AMD64-Setup.exe"
      }

      file { "C:/temp/Salt-Minion-${salt_release_name}-Py3-AMD64-Setup.exe":
        source  => $_url,
        replace => 'no'
      }
    }
    default: {
      fail("\"${module_name}\" provides no repository information for OSfamily \"${facts['os']['family']}\"")
    }
  }

}
