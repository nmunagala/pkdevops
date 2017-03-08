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

 exec { "Download Apache Maven":
    cwd => "${files_path}/",
    command => 'wget "http://mirror.fibergrid.in/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz"',
    onlyif => "test ! -f ${files_path}/apache-maven-3.3.9-bin.tar.gz",
 }

 exec { "Download SonarQube":
    cwd => "${files_path}/",
    command => 'wget "https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-5.6.3.zip"',
    onlyif => "test ! -f ${files_path}/sonarqube-5.6.3.zip",
 }

 exec { "Download SonarQube Runner":
    cwd => "${files_path}/",
    command => 'wget "http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/2.4/sonar-runner-dist-2.4.zip"',
    onlyif => "test ! -f ${files_path}/sonar-runner-dist-2.4.zip",
 }

  exec { 'Install Jenkins plugins':
      command => '/bin/bash /vagrant/environments/test/shell/plugins.sh ace-editor ansible antisamy-markup-formatter ant bouncycastle-api branch-api build-timeout capitomcat cloudbees-credentials cloudbees-folder config-file-provider credentials-binding credentials deploy display-url-api durable-task ec2-deployment-dashboard email-ext external-monitor-job git-client github-branch-source github github-organization-folder git gitlab-hook gitlab-plugin git-server gradle handlebars icon-shim javadoc job-dsl jquery-detached jquery junit ldap mailer managed-scripts mapdb-api matrix-auth matrix-project maven-plugin momentjs nexus-artifact-uploader node-iterator-api pam-auth pipeline-build-step pipeline-graph-analysis pipeline-input-step pipeline-milestone-step pipeline-rest-api pipeline-stage-step pipeline-stage-view plain-credentials ruby-runtime scm-api script-security sonar ssh-credentials ssh-slaves structs subversion timestamper token-macro vsphere-cloud windows-slaves workflow-aggregator workflow-api workflow-basic-steps workflow-durable-task-step workflow-job workflow-multibranch workflow-scm-step workflow-step-api workflow-support ws-cleanup',
      }
}
