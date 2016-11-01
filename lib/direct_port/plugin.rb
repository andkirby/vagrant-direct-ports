module Vagrant
  module DirectPort
    ##
    # Direct port plugin
    #
    class Plugin < Vagrant.plugin('2')
      name 'DirectPort'

      description(
        'Plugin allows to set port forwarding by YAML configuration file.'
      )

      command 'direct-port' do
        require_relative 'command'
        Command
      end
    end
  end
end
