class jenkins_cli ($files_path = "/vagrant/environments/test/files", $jenkins_home = "/var/lib/jenkins") {
  Exec {
    path => ["/usr/bin", "/bin", "/usr/sbin"],
    timeout => 0,
  }

  file { '/etc/yum.repos.d/jenkins.repo':
    ensure => present,
    source => "${files_path}/jenkins.repo",
  }

  package { 'git': ensure => present, }

  file { 'jdk_rpm':
    ensure => "present",
    path   => "${files_path}/jdk-8u112-linux-x64.rpm",
  }

  package { 'jdk-8u112-linux-x64.rpm':
    provider => 'rpm',
    source   => "${files_path}/jdk-8u112-linux-x64.rpm",
    ensure   => installed,
    require  => File["jdk_rpm"],
  }

  package { 'jenkins':
    ensure  => present,
    require => [File['/etc/yum.repos.d/jenkins.repo'],Package['jdk-8u112-linux-x64.rpm']],
  }

  service { 'jenkins':
    ensure  => running,
    require => [Package["jenkins"], Exec['Copy jenkins configs'], File['/etc/sysconfig/jenkins']],
  }

  exec { 'Copy jenkins configs':
    command => "cp -fr ${files_path}/jenkins_configs/* ${jenkins_home}/;cp -fr ${files_path}/jobs ${jenkins_home}/;cp -fr ${files_path}/users ${jenkins_home}/;chown -R jenkins:jenkins ${jenkins_home}",
    require => Package['jenkins'],
  }

  file { '/etc/sysconfig/jenkins':
    ensure => present,
    source => "${files_path}/sysconfig_jenkins",
  }
}
