class protobuf {
  $defaultUrl = "http://protobuf.googlecode.com/files/protobuf-2.4.1.tar.gz"
  $cachedir = extlookup("cache.dir", "/root/cache.dir")
  $url = extlookup("protobuf.url", $defaultUrl)
  $archive = extlookup("protobuf.archive", "protobuf-2.4.1.tar.gz")
  $sname = extlookup("protobuf.name", "protobuf-2.4.1")

  file { $cachedir:
    ensure => directory
  }

  Exec {
    path => "/bin:/sbin:/usr/sbin:/usr/bin:/usr/local/bin"
  }

  exec { "download from source":
    command => "wget $url -O $archive",
    cwd => $cachedir,
    creates => "${cachedir}/${archive}"
  }

  exec { "extract":
    command => "tar xfz $archive",
    cwd => $cachedir,
    creates => "${cachedir}/${sname}"
  }

  exec { "make":
    command => "sh ./configure && make && make install",
    cwd => "${cachedir}/${sname}"
  }
}
