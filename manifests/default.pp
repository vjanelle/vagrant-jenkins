exec { "apt-update":
      command => "/usr/bin/apt-get update"
}

Exec["apt-update"] -> Package <| |>

include apt
include jenkins

$plugins = [
  'git',
  'github',
  'matrix-auth',
  'openid',
  'role-strategy',
]

jenkins::plugin { $plugins:
  ensure => installed,
}