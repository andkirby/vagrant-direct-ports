require 'bundler'

begin
  require 'vagrant'
rescue LoadError
  Bundler.require(:default, :development)
end

require 'direct_port/plugin'
require 'direct_port/command'
require 'direct_port/direct_port'
