class ldap::master inherits ldap {
    File['/etc/ldap/slapd.conf'] {
        source  => [
            'puppet:///files/ldap/ldap/slapd.conf.master',
            'puppet:///ldap/ldap/slapd.conf.master',
        ],
    }
}

# vim: set ts=4 sw=4 et:
