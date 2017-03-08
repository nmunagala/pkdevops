node 'jenkins.pkdevops.com' {
  include jenkins
  include sonarqube
}

node 'nexus.pkdevops.com' {
  include nexus
}

node 'tomcat.pkdevops.com' {
  include tomcat
}
