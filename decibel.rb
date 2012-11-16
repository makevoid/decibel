path = File.expand_path '../', __FILE__

require "#{path}/config/env.rb"

class Decibel < Sinatra::Base

  include Voidtools::Sinatra::ViewHelpers

  @@path = File.expand_path '../', __FILE__

  # partial :comment, { comment: "blah" }
  # partial :comment, comment

  def partial(name, value)
    locals = if value.is_a? Hash
      value
    else
      hash = {}; hash[name] = value
      hash
    end
    haml "_#{name}".to_sym, locals: locals
  end

  # photos

  def photos_from(path)
    photos = Dir.glob("#{@@path}/public/images/#{path}/*.{png,jpg}").map do |photo|
      File.basename photo
    end.sort
    [photos[-2..-1], photos[0..-3]].flatten
    #.shuffle
  end

end

require_all "#{path}/routes"