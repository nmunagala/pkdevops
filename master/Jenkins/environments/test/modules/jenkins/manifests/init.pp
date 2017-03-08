class jenkins {
   include download,maven,jenkins_cli
   Class['download'] -> Class['maven'] -> Class['jenkins_cli']
}
