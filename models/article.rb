class Article
  include DataMapper::Resource

  property :id,         Serial
  property :title,      String, length: 150
  property :text,       Text
  property :created_at, DateTime

  before :create do
    self.created_at = Time.now
  end

end