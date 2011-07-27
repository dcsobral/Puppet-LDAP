define ldap::slave($rid) {
    include ldap

    File <| title == '/etc/ldap/ldap.conf' |> {
        source  => [
            "puppet:///files/ldap/host/ldap/ldap.conf.$fqdn",
            "puppet:///files/ldap/host/ldap/ldap.conf.$hostname",
            "puppet:///files/ldap/env/ldap/ldap.conf.$environment",
            'puppet:///files/ldap/ldap/ldap.conf.slave',
            'puppet:///ldap/ldap/ldap.conf.slave',
        ],
    }

    File <| title == '/etc/ldap/slapd.conf' |> {
        content => template('ldap/slapd.conf.slave.erb'),
    }
}

# vim: set ts=4 sw=4 et:
