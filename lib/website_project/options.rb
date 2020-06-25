class WebsiteProject::Options 
  attr_accessor :name, :info
  
  @@all = []
  
  
  def initialize(name)
    @name = name
    @info = []
    save 
  end
  
  def self.all
    WebsiteProject::Scraper.best_places_to_work if @@all.empty? #if @@all is empty then scrape
    @@all
  end

  def get_info 
    WebsiteProject::Scraper.scrape_info(self) if @info.empty? #if info is empty then scrape
    @info
  end
  
  def save 
    @@all << self
  end
end



