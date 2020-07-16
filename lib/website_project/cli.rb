class WebsiteProject::CLI 
  
  @@muted="\e[1;31m"
  @@grn="\e[1;32m"
  @@blu="\e[1;34m"
  @@mag="\e[1;35m"
  @@cyn="\e[1;36m"
  @@white="\e[0m"

  def call 
    puts "\nWelcome! Here are the top 100 companies in the Austin area.\n"
    while @input != 'bye'
      print_options
      get_user_selection
      valid_input ? list_info : show_error
      get_next_step
    end 
    goodbye
  end 
  
  def print_options
    puts "Loading companies.."
    WebsiteProject::Company.prepare_to_list
    WebsiteProject::Company.all.each{|m| puts "#{m.id}: #{m.name}"}
    puts "Please make a selection for more info.."
  end 
  
  def get_user_selection
    @input = gets.strip.to_i
  end 
    
  def valid_input
    WebsiteProject::Company.exists?(@input)
  end 
  
  def show_error
    puts "#{@@muted}Sorry that's not a valid input! Please try again!#{@@white}"
  end

  def list_info
    puts "Loading your chosen company..."
    company = WebsiteProject::Company.find_by_id(@input)
    #company.get_info
    binding.pry
    puts "Here is info for selected company #{company.info}"
  end
 
  
  def get_next_step
    puts "\n#{@@cyn}To see listing again type #{@@blu}'list'#{@@cyn} or say #{@@blu}'bye'#{@@cyn} to exit#{@@white}"
    get_user_selection
  end
  
  def goodbye
    puts "Have a wonderful day!"
  end
end


  





