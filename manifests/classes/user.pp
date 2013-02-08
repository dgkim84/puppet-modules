define adduser($uid, $group = $title, $gid = $uid) {
    $username = $title

    user { $username:
        home => "/home/$username",
        shell => "/bin/bash",
        uid => $uid
    }

    group { $group:
        gid => $gid
    }

    file { "/home/$username":
        ensure => directory,
        owner => $username,
        group => $group,
        mode => 750,
        require => [ User[$username], Group[$group] ]
    }

    file { "/home/$username/.ssh":
        ensure => directory,
        owner => $username,
        group => $group,
        mode => 700,
        require => [ File["/home/$username"] ]
    }

    file { "/home/$username/.ssh/authorized_keys":
        ensure => file,
        owner => $username,
        group => $group,
        mode => 600,
        require => [ File["/home/$username/.ssh"] ]
    }
}

define addpubkey ($key, $comment, $type = "ssh-rsa") {
    $username = $title
    ssh_authorized_key{ "${username}_${comment}"
        ensure => present,
        key => $key,
        type => $type,
        user => $username,
        require => File["/home/$username/.ssh/authorized_keys"]
    }
}
