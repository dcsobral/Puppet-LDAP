class ldap::master inherits ldap {
    File['/etc/ldap/ldap.conf'] {
        source  => [
            "puppet:///files/ldap/host/ldap/ldap.conf.$fqdn",
            "puppet:///files/ldap/host/ldap/ldap.conf.$hostname",
            "puppet:///files/ldap/env/ldap/ldap.conf.$environment",
            'puppet:///files/ldap/ldap/ldap.conf.master',
            'puppet:///ldap/ldap/ldap.conf.master',
        ],
    }

    File['/etc/ldap/slapd.conf'] {
        source  => [
            "puppet:///files/ldap/host/ldap/slapd.conf.$fqdn",
            "puppet:///files/ldap/host/ldap/slapd.conf.$hostname",
            "puppet:///files/ldap/env/ldap/slapd.conf.$environment",
            'puppet:///files/ldap/ldap/slapd.conf.master',
            'puppet:///ldap/ldap/slapd.conf.master',
        ],
    }
}

# vim: set ts=4 sw=4 et:
