class WebsiteProject::CLI 

  def call 
    puts "\nWelcome! Here are the top 100 companies in the Austin area.\n"
    get_options
    print_options
    get_user_selection
  end 
  
  def get_options
    @user_options = WebsiteProject::Options.all
   end
  
  def print_options
    @user_options.each.with_index(1) do |option, index| 
    puts "#{index}. #{option.name}"
   end
   puts "Please make a selection for more info.."
  end 
  
  def get_user_selection
    input = gets.strip.to_i
    list_selected_companies(input) if valid_input(input, @user_options) #calls on method if valid 
  end 
    
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end 
  
  def list_selected_companies(input) 
    options = @user_options [input - 1]
    puts "Here is info for #{options.name}"
  end 
  
  def info_about_company
    #should take users selection and print basic info for company
  end
end





