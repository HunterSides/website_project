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
    info_url = "https://www.builtinaustin.com#{company.ref}"
    benefits_url = "https://www.builtinaustin.com#{company.ref}/benefits"
    info_page = Nokogiri::HTML(open(info_url))
    benefits_page = Nokogiri::HTML(open(benefits_url))
    
    info = info_page.css(".description").text
    company.key_info = info
    
    benefits = benefits_page.css(".block-content .field_perks_list .section")
    
    benefits.each do |b|
      benefit_title = b.css(".category-title").text
    
      company.key_benefits << benefit_title
      
  end
end
  
  def self.scrape_benefits(company)
    site = "https://www.builtinaustin.com#{company.ref}/benefits"
    binding.pry
    page = Nokogiri::HTML(open(site))
    info = page.css(".description").text
  end
end 


