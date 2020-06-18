class WebsiteProject::Scraper 
  @@best_places_to_work = []

  def self.best_places_to_work
    site = "https://www.builtinaustin.com/companies/best-places-to-work-austin-2020"
    page = Nokogiri::HTML(open(site))
    
    results = page.css(".view-best-places-to-work .view-content .views-row")
    
    
    results.each do |r| 
      @best_places_to_work = r.css(".title").text
      
    end
  end
  

end 