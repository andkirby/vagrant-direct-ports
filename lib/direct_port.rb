require 'bundler'

begin
  require 'vagrant'
rescue LoadError
  Bundler.require(:default, :development)
end

require 'vagrant-direct-port/plugin'
require 'vagrant-direct-port/command'
