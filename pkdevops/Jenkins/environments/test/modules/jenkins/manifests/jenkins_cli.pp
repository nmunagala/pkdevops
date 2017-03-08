class jenkins_cli ($files_path = "/vagrant/environments/test/files", $jenkins_home = "/var/lib/jenkins") {
  Exec {
    path => ["/usr/bin", "/bin", "/usr/sbin"],
    timeout => 0,
  }


  package { 'git': ensure => present, }

  file { 'jdk_rpm':
    ensure => "present",
    path   => "${files_path}/jdk-8u112-linux-x64.rpm",
  } ->

  exec { 'jdk-8u112-linux-x64.rpm':
    command => "rpm -ivh ${files_path}/jdk-8u112-linux-x64.rpm",
    onlyif => "[ `rpm -qa |grep jdk1.8.0_112-1.8.0_112-fcs.x86_64 |wc -l ` == 0 ]",
  } ->

  file { '/etc/yum.repos.d/jenkins.repo':
    ensure => present,
    source => "${files_path}/jenkins.repo",
  } ->

  package { 'jenkins':
    ensure  => present,
  } ->

  exec { 'Copy jenkins configs':
    command => "cp -fr ${files_path}/jenkins_configs/* ${jenkins_home}/;cp -fr ${files_path}/jobs ${jenkins_home}/;cp -fr ${files_path}/users ${jenkins_home}/;chown -R jenkins:jenkins ${jenkins_home}",
  } ->

  file { '/etc/sysconfig/jenkins':
    ensure => present,
    source => "${files_path}/sysconfig_jenkins",
  } ->

  service { 'jenkins':
    ensure  => running,
  }
}
