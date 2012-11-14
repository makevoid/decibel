class Decibel < Sinatra::Base
  helpers do
    def articles
      Article.next
    end
  end

  get "/eventi" do
    haml :eventi
  end

  get "/storia" do
    @articles = Article.past
    haml :storia
  end

  get "/contatti" do
    haml :contatti
  end
end