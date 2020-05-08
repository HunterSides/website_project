

class WebsiteProject::Scraper 
  @best_places_to_work = []
  @best_small_company = []
  @best_midsize_places_to_work = []
  @best_paying_companies = []
  @best_company_with_benefits = []
  
  
  def best_places_to_work
    site = "https://www.builtinaustin.com/companies/best-places-to-work-austin-2020"
    page = Nokogiri::HTML(open(site))
    
    results = page.css(".view-best-places-to-work .view-content .views-row")
    puts results.count
    
    results.each do |r| 
      @best_places_to_work = r.css(".title").text
    end
  end
  
  def best_small_company
    site = "https://www.builtinaustin.com/companies/best-small-places-to-work-austin-2020"
    page = Nokogiri::HTML(open(site))
    
    results = page.css(".view-best-places-to-work .view-content .views-row")
    puts results.count
    
    results.each do |r| 
      @best_small_company = r.css(".title").text
    end
  end
  
  def best_midsize_places_to_work
    site = "https://www.builtinaustin.com/companies/best-midsize-places-to-work-austin-2020"
    page = Nokogiri::HTML(open(site))
    
    results = page.css(".view-best-places-to-work .view-content .views-row")
    puts results.count
    
    results.each do |r| 
      @best_midsize_places_to_work = r.css(".title").text
    end
  end
  
  def best_paying_companies
    site = "https://www.builtinaustin.com/companies/best-paying-companies-austin-2020"
    page = Nokogiri::HTML(open(site))
    
    results = page.css(".view-best-places-to-work .view-content .views-row")
    puts results.count
    
    results.each do |r| 
      @best_paying_companies = r.css(".title").text
    end
  end
  
  def best_company_with_benefits
    site = "https://www.builtinaustin.com/companies/companies-best-benefits-austin-2020"
    page = Nokogiri::HTML(open(site))
    
    results = page.css(".view-best-places-to-work .view-content .views-row")
    puts results.count
    
    results.each do |r| 
      @best_company_with_benefits = r.css(".title").text
    end
  end
end 