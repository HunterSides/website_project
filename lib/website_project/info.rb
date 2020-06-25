class WebsiteProject::Info 
  
  attr_accessor :name, :option 
  @@all = []
  
  def initialize(name, option)
    @name = name
    @option = option
    add_to_option
    save 
  end 
  
  def self.all 
    @@all
  end 
  
  def add_to_option #notifies option of info
    @option.info  << self unless @option.info.include?(self) 
  end
  
  
  def save 
    @@all << self
  end
  
end