class Article
  include DataMapper::Resource

  property :id,             Serial
  property :title,          String, length: 150
  property :text,           Text
  property :date,           Date
  property :time,           String
  property :location,       String
  property :location_url,   String
  property :fb_event_page,  String
  property :image,          String

  MONTHS = %w(_ gennaio febbraio marzo aprile maggio giugno luglio agosto settembre ottobre novembre dicembre)

  def date_formatted
    month = MONTHS[date.month].capitalize
    date.strftime("%d #{month} <span class='year'>%Y</span>")
  end

  def self.next
    all :date.gte => Date.today
  end

  def self.past
    all :date.lt => Date.today
  end

end