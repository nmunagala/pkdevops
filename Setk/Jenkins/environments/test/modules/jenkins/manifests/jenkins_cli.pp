class jenkins_cli (
    $files_path = "/vagrant/environments/test/files") {

    Exec {
        path => ["/usr/bin", "/bin", "/usr/sbin"],
    }

    file {'/etc/yum.repos.d/jenkins.repo':
        ensure => present,
	      source => "${files_path}/jenkins.repo",
    }

    package {'git':
        ensure => present,
    }

    file {'jdk_rpm':
       ensure => "present",
       path   => "${files_path}/jdk-8u101-linux-x64.rpm",
    } 

    package {'jdk-8u101-linux-x64.rpm':
       provider => 'rpm',
       source   => "${files_path}/jdk-8u101-linux-x64.rpm",
       ensure   => installed,
       require  => File["jdk_rpm"],
    }

    package {'jenkins':
	ensure => present,
	require => [ File['/etc/yum.repos.d/jenkins.repo'], Package['jdk-8u101-linux-x64.rpm'] ],
    }

    service {'jenkins':
        ensure  => running,
	require => Package["jenkins"],
    }
}
