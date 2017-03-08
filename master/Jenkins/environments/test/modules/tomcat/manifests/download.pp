class download ($files_path = "/vagrant/environments/test/files") {
  Exec {
    path => ["/usr/bin", "/bin", "/usr/sbin"],
    timeout => 0,
  }

 exec { "Download Tomcat":
    cwd => "${files_path}/",
    command => 'wget "http://mirror.fibergrid.in/apache/tomcat/tomcat-7/v7.0.72/bin/apache-tomcat-7.0.72.tar.gz"',
    onlyif => "test ! -f ${files_path}/apache-tomcat-7.0.72.tar.gz",
 }
}
