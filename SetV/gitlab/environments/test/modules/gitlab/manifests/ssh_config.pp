class gitlab::ssh_config {
  require gitlab::users

  $ssh_config = "Host localhost
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
  "

  file { '/home/gitlab/ ':
    ensure  => present,
    owner   => 'gitlab',
    group   => 'gitlab',
    mode    => '0600',
}

  file { '/home/gitlab/.ssh/config':
    ensure  => present,
    owner   => 'gitlab',
    group   => 'gitlab',
    mode    => '0600',
    content => $ssh_config;
  }
}
