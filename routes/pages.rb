class Decibel < Sinatra::Base
  get "/eventi" do
    haml :index
  end

  get "/storia" do
    haml :storia
  end

  get "/contatti" do
    haml :contatti
  end
end