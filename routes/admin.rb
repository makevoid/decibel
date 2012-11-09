class Decibel < Sinatra::Base
  get "/login" do
    haml :login
  end

  post "/login" do
    session[:logged] = true
  end

  get "/logout" do
    session[:logged] = false
    redirect "/"
  end
end