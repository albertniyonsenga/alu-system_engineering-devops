# Puppet manifest to configure SSH client to use private key ~/.ssh/school
# and disable password authentication by editing ~/.ssh/config

# Define the SSH config file path
$file_path = '/home/vagrant/.ssh/config'

# Ensure the .ssh directory exists with correct permissions
file { '/home/vagrant/.ssh':
  ensure => directory,
  owner  => 'vagrant',
  group  => 'vagrant',
  mode   => '0700',
}

# Ensure the SSH config file exists with correct owner and permissions
file { $file_path:
  ensure => file,
  owner  => 'vagrant',
  group  => 'vagrant',
  mode   => '0600',
}

# Insert or ensure IdentityFile line in SSH config
file_line { 'Declare identity file':
  path  => $file_path,
  line  => '    IdentityFile ~/.ssh/school',
  match => '^\s*IdentityFile\s+~\/\.ssh\/school',
  require => File[$file_path],
}

# Insert or ensure PasswordAuthentication no line in SSH config
file_line { 'Turn off passwd auth':
  path  => $file_path,
  line  => '    PasswordAuthentication no',
  match => '^\s*PasswordAuthentication\s+no',
  require => File[$file_path],
}
