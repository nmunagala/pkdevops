class sonarqube_ci (
  $files_path     = "/vagrant/environments/test/files",
  $templates_path = "/vagrant/environments/test/modules/jenkins/templates") {
    
  file { '/opt/sonarqube/':
    ensure => directory,
    mode   => '777'
  }
  
  file { '/opt/sonarrunner/':
    ensure => directory,
    mode   => '777'
  }

  package { 'unzip': ensure => latest, }

  #package { 'java-1.8.0-openjdk': ensure => installed, }

  exec { 'unzip sonarqube':
    command     => 'unzip  /vagrant/environments/test/files/sonarqube-5.6.3.zip',
    cwd         => '/opt/sonarqube/',
    path    => ['/usr/bin', '/usr/sbin',],    
    creates     => '/opt/sonarqube/sonarqube-5.6.3/bin/linux-x86-64/sonar.sh',
    require     => [Package["unzip"], File["/opt/sonarqube/"]],
  }
  
  exec { 'unzip sonarrunner':
    command     => 'unzip  /vagrant/environments/test/files/sonar-runner-dist-2.4.zip',
    cwd         => '/opt/sonarrunner/',
    path    => ['/usr/bin', '/usr/sbin',],
    creates     => '/opt/sonarrunner/sonar-runner-2.4/bin/sonar-runner.bat',
    require     => [Package["unzip"], File["/opt/sonarrunner/"]],    
  }
  
  file { 'bash_script':
    ensure  => 'present',
    path    => '/etc/profile.d/sonar_env.sh',
    mode    => '0755',
    content => template('/vagrant/environments/test/modules/jenkins/templates/sonar_env.sh.erb'),
    require     => [Exec["unzip sonarqube"], Exec["unzip sonarrunner"]],
  } ->    
  exec { 'sonarqube start':
    command => '/opt/sonarqube/sonarqube-5.6.3/bin/linux-x86-64/sonar.sh start',
    path    => ['/usr/bin', '/usr/sbin',],
    onlyif  => "[ `ps -aef | grep [s]onarqube|wc -l` == 0 ]",
  }

}
