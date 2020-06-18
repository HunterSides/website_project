class WebsiteProject::Options 
  @@all = []
  attr_accessor :name
  
  def initialize(name)
    @name = name
    save 
  end
  
  def self.all
    WebsiteProject::Scraper.best_places_to_work
    @@all
  end
  
  def save 
    @@all << self
  end
end



#'Top 100 companies','Top 50 small companies','Top 50 midsize companies','Top 50 paying companies','Top 50 companies with benefits'