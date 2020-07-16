class WebsiteProject::Company
  attr_accessor :name,:info
  
  @@all = []
  
  
  def initialize(name)
    @name = name
    @info = info
    save 
  end
  
  def assign_id
    @id = @@all.size + 1
  end
  
  def self.all
    WebsiteProject::Scraper.best_places_to_work if @@all.empty? #if @@all is empty then scrape
  end
  
  def self.exists?(idx)
    (1..all.length).include?(idx.to_i)
  end
  
  def self.find_by_id(input)
    all.find{|m| m.id == input.to_i}
  end

  def get_info 
    WebsiteProject::Scraper.scrape_info(self) if @info.empty? #if info is empty then scrape
  end
  
  def save 
    @@all << self
  end
end