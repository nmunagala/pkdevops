node 'jenkins.pkdevops.com' {
    include projenkins
}

node 'nexus.pkdevops.com' {
    include nexus
}
