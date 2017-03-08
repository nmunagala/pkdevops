class download ($files_path = "/vagrant/environments/test/files") {
  Exec {
    path => ["/usr/bin", "/bin", "/usr/sbin"],
    timeout => 0,
  }

 exec { "Download Java":
    cwd => "${files_path}/",
    command => 'wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.rpm"',
    onlyif => "test ! -f ${files_path}/jdk-8u112-linux-x64.rpm",
 }

 exec { "Download Nexus":
    cwd => "${files_path}/",
    command => 'wget "https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.0.2-02-unix.tar.gz"',
    onlyif => "test ! -f ${files_path}/nexus-3.0.2-02-unix.tar.gz",
 }
}
