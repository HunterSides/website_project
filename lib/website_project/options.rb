class WebsiteProject::Options 
  attr_accessor :name,:info,:id
  
  @@all = []
  
  
  def initialize(name)
    @name = name
    @info = info
    assign_id
    save 
  end
  
  def assign_id #this method assigns an ID to each company to be called upon by find_by_id
    @id = @@all.size + 1
  end
  
  
  def self.all
    @@all
  end
  
  def self.list_companies
    WebsiteProject::Scraper.best_places_to_work if @@all.empty? #if @@all is empty then scrape
  end
  
  def self.find_by_id(input) #called in CLI, takes in user input and equates the input to company #ID and finds it in all array(once found it will print the company info)
    all.find{|m| m.id == input.to_i}
  end

  def get_info 
    WebsiteProject::Scraper.scrape_info(self) if @info.empty? #if info is empty then scrape
  end
  
  def save 
    @@all << self
  end
end



