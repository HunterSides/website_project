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
    sleep (1)
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
    benefit_info(company)
  end
  
  def benefit_info(company) #passes in the chosen company from (list_info)
    company.get_info
    puts "\n#{@@mag}Would you like to see what benefits this company has to offer?(#{@@grn}y#{@@mag}/#{@@muted}n#{@@mag})#{@@white}?"
    input = gets.strip
    if input == "y" 
      puts "\n#{@@grn}Benefits#{@@white}"
      puts ""
      company.key_benefits.each.with_index(1) do |key_benefits, index|  #assigns index to benefits
        puts "#{index}. #{key_benefits}"
    end
    select_benefit(company)
  end
end

 
  def select_benefit(company) #method selects a benefit and reveals more information about that benefit
    
    puts "\nPlease select a benefit from the list for more information.."
    input = gets.strip.to_i
    chosen_benefit = company.specific_benefits[input - 1]
    binding.pry
    puts "\n#{chosen_benefit}"
    binding.pry
    benefits = chosen_benefit.value
    binding.pry
    puts "#{benefit}"
    
  end 
  
  def get_next_step
    puts "\n#{@@mag}To see list again type #{@@white}'list'#{@@mag} or say #{@@white}'exit'#{@@mag} to exit#{@@white}"
    @input = gets.strip
  end
  
  def goodbye
    puts "Have a wonderful day!"
  end
end



  





