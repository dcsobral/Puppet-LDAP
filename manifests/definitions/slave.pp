define ldap::slave($rid) {
    include ldap
    File <| title == '/etc/ldap/slapd.conf' |> {
        content => template('ldap/slapd.conf.slave.erb'),
    }
}

# vim: set ts=4 sw=4 et:
