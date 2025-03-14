# spec_helper.rb
require 'puppetlabs_spec_helper/module_spec_helper'  # Charge les helpers de Puppet pour rspec
require 'rspec-puppet-facts'  # Charge les facts Puppet pour les tests

# Configuration de base pour rspec-puppet
RSpec.configure do |config|
  # Active la couleur dans les sorties de test
  config.color = true

  # Active les formats de sortie de test (documentation et progress)
  config.formatter = :documentation

  # Configure les facts Puppet pour les tests
  config.default_facts = {
    osfamily: 'Debian',  # Exemple de fact pour un système Debian/Ubuntu
    operatingsystem: 'Ubuntu',
    operatingsystemrelease: '20.04',
    kernel: 'Linux',
    architecture: 'x86_64',
  }

  # Charge les facts spécifiques à Puppet
  include RspecPuppetFacts
end

# Configuration Hiera pour les tests
RSpec.configure do |config|
  config.hiera_config = File.expand_path(File.join(__FILE__, '../fixtures/hiera.yaml'))
end

# Configuration des fixtures pour les tests
RSpec.configure do |config|
  config.module_path = File.expand_path(File.join(__FILE__, '../../modules'))
  config.manifest_dir = File.expand_path(File.join(__FILE__, '../../manifests'))
end