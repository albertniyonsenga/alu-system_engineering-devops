# Simplified 100-puppet_ssh_config.pp

file { '/etc/ssh/ssh_config':
  ensure  => file,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => @(END),
    # Managed by Puppet
    Host *
        IdentityFile ~/.ssh/school
        PasswordAuthentication no
    END
}
