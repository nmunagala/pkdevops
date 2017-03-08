class jenkins {
   include download,maven,jenkins_cli,sonarqube_ci
   Class['download'] -> Class['maven'] -> Class['jenkins_cli'] -> Class['sonarqube_ci']
}
