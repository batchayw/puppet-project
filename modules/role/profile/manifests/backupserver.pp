# backupserver.pp
class profile::backupserver {
  $backup_enabled = lookup('profile::backupserver::enabled', Boolean, 'first', true)

  if $backup_enabled {
    include ::backup::server
  }
}