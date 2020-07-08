class WebsiteProject::Options 
  attr_accessor :name, :ref, :info
  
  @@all = []
  
  
  def initialize(name , ref)
    @name = name
    @ref = ref
    @info = []
    save 
  end
  
  def self.all
    WebsiteProject::Scraper.best_places_to_work if @@all.empty? #if @@all is empty then scrape
    @@all
  end

  def get_info 
    WebsiteProject::Scraper.scrape_info(self) if @info.empty? #if info is empty then scrape
  end
  
  def save 
    @@all << self
  end
end



