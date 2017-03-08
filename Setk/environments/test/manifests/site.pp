node 'jenkins.pkdevops.com' {
  include jenkins
}

node 'nexus.pkdevops.com' {
  include nexus
}

node 'tomcat.pkdevops.com' {
  include tomcat
}

node 'sonarqube.pkdevops.com' {
  include sonarqube
}
