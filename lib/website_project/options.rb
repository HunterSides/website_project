class WebsiteProject::Options 
  @@all = []
  attr_accessor :name :company_info
  
  def initialize(name)
    @name = name
    save 
  end
  
  def self.all
    WebsiteProject::Scraper.best_places_to_work
    @@all
  end
  
  def info 
    WebsiteProject::Scraper.
  
  def save 
    @@all << self
   
  end
end



