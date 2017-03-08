class tomcat_ci (
  $files_path     = "/vagrant/environments/test/files",
  $tomcat_home    = "/usr/local/tomcat7",
  $tomcat_archive = "apache-tomcat-7.0.72.tar.gz",
  $tomcat_folder  = "apache-tomcat-7.0.72") {
    
  package { 'java-1.8.0-openjdk': ensure => installed, } ->

  file { "tomcat_archive":
    ensure => present,
    path   => "${files_path}/${tomcat_archive}",
  }

  Exec {
    path => ["/usr/bin", "/bin", "/usr/sbin"], }

  exec { "Extract tomcat":
    command => "tar -xvf ${files_path}/${tomcat_archive}",
    cwd     => "/tmp",
    creates => "${tomcat_home}",
    require => File["tomcat_archive"],
  }

  exec { "Move tomcat":
    command => "mv ${tomcat_folder} ${tomcat_home}",
    creates => "${tomcat_home}",
    cwd     => "/tmp",
    require => Exec["Extract tomcat"],
  }

  file { "/usr/local/tomcat7/conf/tomcat-users.xml":
    ensure  => present,
    content => template('/vagrant/environments/test/modules/tomcat/templates/tomcat-users.xml.erb'),
    require => Exec["Move tomcat"],
  } ->    
  exec { 'tomcat start':
    command => '/usr/local/tomcat7/bin/startup.sh start',
    path    => ['/usr/bin', '/usr/sbin',],
    onlyif  => "[ `ps -aef | grep [s]onarqube|wc -l` == 0 ]",
  }
}
