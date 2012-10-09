class Decibel < Sinatra::Base
  get "/" do
    haml :index
  end
end