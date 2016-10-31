module Vagrant
  module DirectPort
    class Command < Vagrant.plugin('2', :command)
      def execute
        Vagrant::VBoxDirectPorts::show_forwarded_ports
        0
      end
    end
  end
end
