class WebsiteProject::CLI 
  
  @@muted="\e[1;31m"
  @@grn="\e[1;32m"
  @@blu="\e[1;34m"
  @@mag="\e[1;35m"
  @@cyn="\e[1;36m"
  @@white="\e[0m"

  def call 
    puts "\n#{@@cyn}Welcome! Here are the top 100 companies in the Austin area.#{@@white}"
    
    while @input != "exit"
      print_options
      get_user_selection
      valid_input ? list_info : show_error
      get_next_step
    end 
    goodbye
  end 
  
  def print_options
    puts "\nLoading companies.."
    sleep (2)
    WebsiteProject::Company.prepare_to_list
    WebsiteProject::Company.all.each{|m| puts "#{m.id}: #{m.name}"}
    puts "\nPlease select a company for more info.."
  end 
  
  def get_user_selection #assigns @input to a number
    @input = gets.strip.to_i
  end 
    
  def valid_input
    WebsiteProject::Company.exists?(@input)
  end 
  
  def show_error
    puts "#{@@muted}Sorry that's not a valid input! Please try again!"
  end
  
  
  def list_info #list company info then prompts user to see benefits if they choose
    puts "\nLoading your chosen company..."
    sleep (1)
    company = WebsiteProject::Company.find_by_id(@input) 
    company.get_info                                    
    puts "\n#{@@grn}#{company.name}#{@@white}"
    puts "\n#{company.key_info}"
    
    puts "\n#{@@mag}Would you like to see what benefits this company offers?(#{@@grn}y#{@@mag}/#{@@muted}n#{@@mag})#{@@white}?"
    @input = gets.strip
    if @input == "y"
      puts "\n#{company.key_benefits}"
    end
  end

  def get_next_step
    puts "\n#{@@mag}To see list again type #{@@white}'list'#{@@mag} or say #{@@white}'exit'#{@@mag} to exit#{@@white}"
    @input = gets.strip
  end
  
  def goodbye
    puts "Have a wonderful day!"
  end
end


  





