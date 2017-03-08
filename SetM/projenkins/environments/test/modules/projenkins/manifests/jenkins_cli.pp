class jenkins_cli (
    $files_path = "/vagrant/environments/test/files") {

    package {'git':
        ensure => present,
    }

    package {'jenkins-2.15-1.1.noarch.rpm':
        provider => 'rpm',
	source   => "${files_path}/jenkins-2.15-1.1.noarch.rpm",
	ensure   => installed,
    }
 service {'jenkins':
        ensure  => running,
	require => Package["jenkins-2.15-1.1.noarch.rpm"],
    }
   
}
