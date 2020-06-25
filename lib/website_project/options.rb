class WebsiteProject::Options 
  @@all = []
  attr_accessor :name
  attr_writer :info
  
  def initialize(name)
    @name = name
    @info = []
    save 
  end
  
  def self.all
    WebsiteProject::Scraper.best_places_to_work if @@all.empty? #if @@all is empty then scrape
    @@all
  end

  def info 
    WebsiteProject::Scraper.company_info if @info.empty? #if info is empty then scrape
  end
  
  def save 
    @@all << self
  end
end



