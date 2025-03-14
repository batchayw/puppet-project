# backupserver.pp
class role::backupserver {
  include profile::base
  include profile::server::physical
  include profile::backupserver
}