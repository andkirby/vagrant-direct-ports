module Vagrant
  module DirectPort
    class Plugin < Vagrant.plugin('2')
      # name 'direct-port'

      description <<-DESC
          This make direct port forwarding due reason the is not ability to have the same port different IP address.
          Issue #7905
      DESC

      command 'direct-port' do
        require_relative 'command'
        Command
      end

    end
  end
end
