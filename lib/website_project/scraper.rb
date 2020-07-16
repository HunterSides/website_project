class WebsiteProject::Scraper 
 
  def self.best_places_to_work
    site = "https://www.builtinaustin.com/companies/best-places-to-work-austin-2020"
    page = Nokogiri::HTML(open(site))
    
    results = page.css(".view-best-places-to-work .view-content .views-row")
    
    results.each do |r| 
      name = r.css(".title").text
    
      WebsiteProject::Company.new(name)
    
    end
  end
  
  def self.scrape_info(option)
    site = "https://www.builtinaustin.com/companies/best-places-to-work-austin-2020"
    page = Nokogiri::HTML(open(site))
    
    results = page.css(".view-best-places-to-work .view-content .views-row")
    results.each do |i|
      info = i.css(".field-about-us").text 
      WebsiteProject::Company.new(info)
    binding.pry
    end
  end
end 


