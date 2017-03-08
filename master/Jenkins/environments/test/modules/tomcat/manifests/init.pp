class tomcat {
   include download,tomcat_ci
   Class['download'] -> Class['tomcat_ci']
}
