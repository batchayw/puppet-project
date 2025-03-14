# site.pp
node default {
  # Appliquer le rôle par défaut (ex: role::base)
  include role::base
}

node 'vm_preprod1' {
  # Appliquer un rôle spécifique pour ce nœud
  include role::backupserver
}