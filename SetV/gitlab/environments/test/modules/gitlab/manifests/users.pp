class gitlab::users {
    User {
    ensure => present,
    system => true,
    shell  => '/bin/sh',
    managehome => true
  }

  user { 'git':
    home    => '/home/git',
    comment => 'Git Version Control';
  }

  user { 'gitlab':
    home    => '/home/gitlab',
    comment => 'Gitlab',
    groups  => ['git'],
    require => User['git'];
  }

  file { '/home/gitlab/.ssh':
    ensure  => directory,
    owner   => 'gitlab',
    group   => 'gitlab',
    mode    => '0700',
    require => User['gitlab'];
  }
  exec { 'ssh-keygen-gitlab':
    path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin:/usr/local/sbin',
    command => 'sudo -u gitlab -H ssh-keygen -q -t rsa -f /home/gitlab/.ssh/id_rsa',
    creates => '/home/gitlab/.ssh/id_rsa',
    require => File['/home/gitlab/.ssh'];
  }
}
