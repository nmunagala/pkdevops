class gitlab {

class { '::gitlab::users': }
class { '::gitlab::ssh_config': }
class { '::gitlab::install': }

#require gitlab::install
#require gitlab::users
#require gitlab::ssh_config

contain gitlab::users
contain gitlab::ssh_config
contain gitlab::install
}

