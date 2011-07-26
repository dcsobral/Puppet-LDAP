class ldap {
    package { 'slapd':
        ensure => installed,
    }

    package { 'ldap-utils':
        ensure => installed,
    }

    service { 'slapd':
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => false,
        require    => Package['slapd'],
    }

    file { '/etc/ldap/schema':
        ensure  => directory,
        source  => [
            "puppet:///files/ldap/host/ldap/schema.$fqdn",
            "puppet:///files/ldap/host/ldap/schema.$hostname",
            "puppet:///files/ldap/env/ldap/schema.$environment",
            'puppet:///files/ldap/ldap/schema',
            'puppet:///ldap/ldap/schema',
        ],
        owner   => 'openldap',
        group   => 'openldap',
        mode    => 644,
        recurse => true,
        replace => true,
        purge   => false,
        require => Package['slapd'],
        notify  => Service['slapd'],
    }

    file { '/etc/ldap/sasl2':
        ensure  => directory,
        source  => [
            "puppet:///files/ldap/host/ldap/sasl2.$fqdn",
            "puppet:///files/ldap/host/ldap/sasl2.$hostname",
            "puppet:///files/ldap/env/ldap/sasl2.$environment",
            'puppet:///files/ldap/ldap/sasl2',
            'puppet:///ldap/ldap/sasl2',
        ],
        owner   => 'openldap',
        group   => 'openldap',
        mode    => 600,
        recurse => true,
        replace => true,
        purge   => true,
        require => Package['slapd'],
        notify  => Service['slapd'],
    }

    file { '/etc/default/slapd':
        ensure  => present,
        source  => [
            "puppet:///files/ldap/host/default/slapd.$fqdn",
            "puppet:///files/ldap/host/default/slapd.$hostname",
            "puppet:///files/ldap/env/default/slapd.$environment",
            'puppet:///files/ldap/default/slapd',
            'puppet:///ldap/default/slapd',
        ],
        owner   => 'root',
        group   => 'root',
        mode    => 644,
        require => Package['slapd'],
        notify  => Service['slapd'],
    }

    file { '/etc/ldap/ldap.conf':
        ensure  => present,
        owner   => 'openldap',
        group   => 'openldap',
        mode    => 644,
        require => Package['slapd'],
    }

    file { '/etc/ldap/slapd.conf':
        ensure  => present,
        owner   => 'openldap',
        group   => 'openldap',
        mode    => 600,
        require => Package['slapd'],
        notify  => Service['slapd'],
    }
}

# vim: set ts=4 sw=4 et:
