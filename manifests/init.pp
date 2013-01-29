# == Class: atrpms
#
# Installs and enables ATrpms repository
#
# === Examples
#
# Sample Usage:
#   include atrpms
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

    yumrepo { 'atrpms-testing':
      baseurl  => "http://dl.atrpms.net/el${::os_maj_version}-${::architecture}/atrpms/testing",
      proxy    => $atrpms::params::proxy,
      enabled  => '0',
      gpgcheck => '1',
      gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY.atrpms',
      descr    => "ATrpms testing packages for Enterprise Linux ${::os_maj_version} - ${::architecture}",
    }

    yumrepo { 'atrpms-bleeding':
      baseurl  => "http://dl.atrpms.net/el${::os_maj_version}-${::architecture}/atrpms/bleeding",
      proxy    => $atrpms::params::proxy,
      enabled  => '0',
      gpgcheck => '1',
      gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY.atrpms',
      descr    => "ATrpms bleeding edge packages for Enterprise Linux ${::os_maj_version} - ${::architecture}",
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
