require File.expand_path('../lib/direct_port/version', __FILE__)

Gem::Specification.new do |s|
  s.name            = 'vagrant-direct-port'
  s.version         = Vagrant::DirectPort::VERSION
  s.date            = '2016-10-31'
  s.summary         = 'Port forwarding for the same port but different IP address for VirtualBox'
  s.description     = 'Vagrant plugin which could help to make port forwarding for the same port but different IP address for VirtualBox.'
  s.files           = `git ls-files`.split($\)
  s.authors         = 'Kirby'
  s.executables     = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.require_paths   = ['lib']
  s.homepage        = 'https://github.com/andkirby/vagrant-direct-ports'
  s.license         = 'GNU'
end
