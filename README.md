# Configure ATrpms Repository

# About
This module mimics the atrpms-release rpm. The same repos are
enabled/disabled and the GPG key is imported.  In the end you will end up with
the ATrpms repos configured.  The work is heavily modeled on (read: stolen from) Mike Stahnke's EPEL module.

The following repo will be setup and enabled by default:

  * atrpms

NOTE: This module requires stahnma/epel but does not enable the EPEL module
by default.  It does however use epel::gpg_rpm_key to avoid redefining the
same functionality.

# Proxy
If you have an http proxy required to access the internet, you can use the
$proxy variable in the params.pp file. If it is set to a value other than
'absent' a proxy will be setup with each repository.  Note that otherwise each
of the repos will fall back to settings in the /etc/yum.conf file.

# Futher Information

* [ATrpms Installation Page](http://atrpms.net/documentation/install/)

# Testing

* This was tested using Puppet 2.7.x on Centos5/6
* I assume it will work on any RHEL variant
* Also, I think this should work with earlier versions of Puppet (2.6.x at least)

# License
Apache Software License 2.0
