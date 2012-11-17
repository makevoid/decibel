path = File.expand_path '../../', __FILE__
APP = "decibel"

require "bundler/setup"
Bundler.require :default
module Utils
  def require_all(path)
    Dir.glob("#{path}/**/*.rb") do |model|
      require model
    end
  end
end
include Utils

require 'date'

password = File.read(File.expand_path "~/.password").strip

env = ENV["RACK_ENV"] || "development"
user = "root:#{password}@" if env == "production"
DataMapper.setup :default, "mysql://#{user}localhost/decibel_#{env}"
require_all "#{path}/models"
DataMapper.finalize

MONTHS = %w(gennaio febbraio marzo aprile maggio giugno luglio agosto settembre ottobre novembre dicembre).map &:capitalize