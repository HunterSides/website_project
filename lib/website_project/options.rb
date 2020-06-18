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



