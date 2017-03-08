class maven (
  $files_path    = "/vagrant/environments/test/files",
  $shell_path    = "/vagrant/environments/test/shell",
  $maven_home    = "/opt/maven",
  $maven_archive = "apache-maven-3.3.9-bin.tar.gz",
  $maven_folder  = "apache-maven-3.3.9") {
  file { "maven_archive":
    ensure => present,
    path   => "${files_path}/apache-maven-3.3.9-bin.tar.gz",
  }

  Exec {
    path => ["/usr/bin", "/bin", "/usr/sbin"], }

  exec { "Extract Maven":
    command => "tar -xvf ${files_path}/${maven_archive}",
    cwd     => "/tmp",
    creates => "${maven_home}",
    require => File["maven_archive"],
  }

  exec { "Move Maven":
    command => "mv ${maven_folder} ${maven_home}",
    creates => "${maven_home}",
    cwd     => "/tmp",
    require => Exec["Extract Maven"],
  }

  file { "/etc/profile.d/maven.sh":
    ensure => present,
    source => "${shell_path}/maven.sh",
  }

  file { "/opt/maven/conf/settings.xml":
    source  => "${files_path}/maven/settings.xml",
    require => Exec['Move Maven'],
  }
}

