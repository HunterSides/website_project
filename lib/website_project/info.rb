class WebsiteProject::Info 
  
  attr_accessor :info, :option
  @@all = []
  
  def initialize(info, option)
    @info = info
    @option = option
    add_to_options
    save 
  end 
  
  def self.all 
    @@all
  end 
  
  def add_to_options #notifies options of info
    @option.info  << self unless @option.info.include?(self) 
  end
  
  
  def save 
    @@all << self
  end
  
end
