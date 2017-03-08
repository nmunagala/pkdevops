#class install {

class gitlab::install {

$download_location = '/tmp'
$gitlab_url='https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh'

  exec{ 'download gitlab':
    path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin:/usr/local/sbin',
    cwd     => $download_location,
    command => "/usr/bin/wget ${gitlab_url}",
    }

  exec { 'run-gitlab':
    path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin:/usr/local/sbin',
    cwd     => $download_location,
    command => "bash script.rpm.sh"
  }

  exec { 'install-gitlab':
    path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin:/usr/local/sbin',
    cwd     => $download_location,
    command => "yum install gitlab-ee -y",
  }

  exec { 'gitlab-ctl-reconfigure' : 
    path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin:/usr/local/sbin',
    command => "gitlab-ctl reconfigure",
  }
}

