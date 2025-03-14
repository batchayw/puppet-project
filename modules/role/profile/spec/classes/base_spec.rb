require '../spec_helper'

describe 'profile::base' do
  let(:facts) do
    {
      osfamily: 'Debian',
      operatingsystem: 'Ubuntu',
      operatingsystemrelease: '20.04',
    }
  end

  it { is_expected.to compile.with_all_deps }  # Vérifie que le manifeste compile
  it { is_expected.to contain_user('deploy') } # Vérifie que l'utilisateur 'deploy' est créé
end