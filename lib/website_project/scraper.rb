class WebsiteProject::Scraper 
 
  def self.best_places_to_work
    site = "https://www.builtinaustin.com/companies/best-places-to-work-austin-2020"
    page = Nokogiri::HTML(open(site))
    
    results = page.css(".view-best-places-to-work .view-content .views-row")
    
    results.each do |r| 
      name = r.css(".title").text
      ref = r.css("a").attr("href").value
      
      WebsiteProject::Company.new(name, ref)
    
    end
  end
  
  def self.scrape_company_info(company)
    site = "https://www.builtinaustin.com#{company.ref}"
    page = Nokogiri::HTML(open(site))
    info = page.css(".description").text 
    company.key_info = info
    
   end
end 


