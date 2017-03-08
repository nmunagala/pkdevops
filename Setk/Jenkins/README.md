The setup will automatically brings up a VM and run necessary vagrant provision's (Shell and Puppet). 

Hardware specifications:

	RAM : 4GB (recommended) 
	cpu : 1 per VM

Pre-requisites:

1. Download and Install VirtualBox  from VirtualBox-5.0.26-108824-Win.exe
2. Download and Install Vagrant from vagrant_1.8.4.msi
                 >> I have used centos/7 build 1609 as an operating system.

3.  Update A records in C:\Windows\System32\drivers\etc\hosts file
                >> 192.168.251.40 jenkins.pkdevops.com
                >> 192.168.251.41 nexus.pkdevops.com

4.  Goto C:\Users\kkhamruddin\.vagrant.d\boxes\centos-VAGRANTSLASH-7\1609.01\virtualbox 
     and update type to virtualbox in user specific Vagrantfile.
            >> config.vm.synced_folder ".", "/vagrant", type: "virtualbox"

5. Install vagrant-vbguest  to share directories to remote machine.
           >> vagrant plugin install vagrant-vbguest

6. [Optional] Install git bash for linux like terminal for windows. from Git-2.10.1-64-bit.exe

ToDO:

1. please find the attached project file.

2. Download below versions of Oracle JDK, Apache Maven and Sonatype Nexus Artifactory packages.
     a. Oracle JDK  : http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.rpm
     b. Maven       : http://mirror.fibergrid.in/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
     c. Nexus       : http://download.sonatype.com/nexus/3/latest-unix.tar.gz
	 d. Tomcat      : http://mirror.fibergrid.in/apache/tomcat/tomcat-7/v7.0.72/bin/apache-tomcat-7.0.72.tar.gz
	 e. SonarQube   : https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-5.6.3.zip
	 f. SonarRunner : http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/2.4/sonar-runner-dist-2.4.zip

3. Place the above downloads in {YOUR_PROJECT_FOLDER}/environments/test/files folder.

Demo:

1. Goto project directory and run the below.
            $vagrant up jenkins
            $vagrant up nexus

Note: In order to up all the VMs at a time update "autostart" to "true" in {YOUR_PROJECT_FOLDER}/environments/test/Vagrantfile.

URLs:

1. Jenkins URL : http://jenkins.pkdevops.com:8080/
2. Nexus URL   : http://nexus.pkdevops.com:8081/
3. Tomcat url  : tomcat.pkdevops.com:8080/
4. Sonarqube url : sonarqube.pkdevops.com:9000/

Credentials:

Tomcat username : tomcat
Tomcat password : tomcat