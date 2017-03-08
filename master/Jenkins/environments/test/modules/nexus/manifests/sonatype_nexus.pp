class sonatype_nexus (
    $files_path = "/vagrant/environments/test/files",
    $nexus_folder = "nexus-3.0.2-02",
    $nexus_home = "/opt/nexus-3.0.2" ) {
     
     file {'jdk_rpm':
       ensure => "present",
       path   => "${files_path}/jdk-8u112-linux-x64.rpm",
     }

     package {'jdk-8u112-linux-x64.rpm':
       provider => 'rpm',
       source   => "${files_path}/jdk-8u112-linux-x64.rpm",
       ensure   => installed,
       require  => File["jdk_rpm"],
    }

     file {"nexus_archive":
       ensure => present,
       path   => "${files_path}/nexus-3.0.2-02-unix.tar.gz",
     }

     Exec {
       path => ["/usr/bin", "/bin", "/usr/sbin"],
     }

     exec { "Extract Nexus":
       command => "tar -xvf ${files_path}/nexus-3.0.2-02-unix.tar.gz",
       cwd     => "/tmp",
       creates => "${nexus_home}",
       require => File["nexus_archive"],
     }

     exec { "Move Nexus":
      command => "mv ${nexus_folder} ${nexus_home}",
      creates => "${nexus_home}",
      cwd     => "/tmp",
      require => Exec["Extract Nexus"],
     }

     exec { "Run Installer":
       command => "sudo /bin/bash -c '/opt/nexus-3.0.2/bin/nexus run &'",
     }
}
