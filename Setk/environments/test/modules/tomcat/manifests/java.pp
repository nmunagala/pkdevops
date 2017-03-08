class java ($files_path = "/vagrant/environments/test/files",
$java_rpm = "jdk-8u112-linux-x64.rpm") 
{
  file { 'jdk_rpm':
    ensure => "present",
    path   => "${files_path}/${java_rpm}",
  }

  package { '${java_rpm}':
    provider => 'rpm',
    source   => "${files_path}/${java_rpm}",
    ensure   => installed,
    require  => File["jdk_rpm"],
  }
}

