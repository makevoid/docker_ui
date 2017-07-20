require 'bundler'
Bundler.require
PATH = File.expand_path "../../", __FILE__

require_relative "../lib/dok"

# temp
require 'yaml'


# check docker
# status = Dok.images
# TODO: fix
# raise status.inspect
# raise "Error, cannot initialize docker - status: #{status}" unless status.code == :ok
