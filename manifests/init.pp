# == Class: atrpms
#
# Installs and enables ATrpms repository
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Examples
#
# Sample Usage:
#   include epel
#
# === Authors
#
# Eric Shamow <eric@puppetlabs.com>
#
class atrpms {
  if $::osfamily == 'RedHat' and $::operatingsystem != 'Fedora' {
    yumrepo { 'atrpms':
      baseurl  => "http://dl.atrpms.net/el${::os_maj_version}-${::architecture}/atrpms/stable",
      proxy    => $atrpms::params::proxy,
      enabled  => '1',
      gpgcheck => '1',
      gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY.atrpms',
      descr    => "ATrpms packages for Enterprise Linux ${::os_maj_version} - ${::architecture}",
    }

    file { '/etc/pki/rpm-gpg/RPM-GPG-KEY.atrpms':
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/atrpms/RPM-GPG-KEY.atrpms',
    }

    epel::rpm_gpg_key{ 'atrpms':
      path => '/etc/pki/rpm-gpg/RPM-GPG-KEY.atrpms',
    }
  } else {
      notice ("Your operating system ${::operatingsystem} will not have the EPEL repository applied")
  }

}
