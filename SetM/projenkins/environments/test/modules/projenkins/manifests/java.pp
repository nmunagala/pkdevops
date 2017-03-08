class java (
    $files_path = "/vagrant/environments/test/files") {

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
}


