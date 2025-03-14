# physical.pp
class profile::server::physical {
  include ::monitoring::agent
  include ::inventory::service
}