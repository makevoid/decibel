path = File.expand_path "../../", __FILE__
require "#{path}/config/env"

DataMapper.auto_migrate!

ARTICLES = [
{
  date: "31 Ottobre",
  title: "DYRTYPHONICS + CRISTAL DISTORTION & more",
  image: "halloween_2012",
  location: "Viper Theatre - Firenze",
  location_url: "http://viperclub.it",
  fb_event_page: "https://www.facebook.com/events/122623424555285",
  text: "All info announced soon.",
},
]


def load_articles(articles)
  articles.each do |article|
    Article.create article
  end
end



require "#{path}/lib/simple_article_format"

articles = SimpleArticleFormat.load "#{path}/config/eventi.saf"


load_articles articles