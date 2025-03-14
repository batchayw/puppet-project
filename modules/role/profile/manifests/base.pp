# base.pp
class profile::base {
  # Gestion des utilisateurs
  $users = lookup('profile::base::users', Array, 'unique', [])
  $users.each |$user| {
    user { $user['name']:
      ensure   => present,
      shell    => $user['shell'],
      groups   => $user['groups'],
      password => lookup('profile::base::root_password'),
    }
  }

  # Configuration SSH
  file { '/etc/ssh/sshd_config':
    ensure  => file,
    content => template('profile/sshd_config.erb'),
    notify  => Service['ssh'],
  }

  service { 'ssh':
    ensure => running,
    enable => true,
  }
}