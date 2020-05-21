

class WebsiteProject::CLI 

  
  def call 
    puts "Welcome!"
    choose_options
    print_options
  end 
  
  def choose_options
   @user_options = ['Top 100 companies','Top 50 small companies','Top 50 midsize companies','Top 50 paying companies','Top 50 companies with benefits']
  end
 
  def print_options
    @user_options.each.with_index(1) do |list, index| 
    puts "#{index}. #{list}"
   end
  end 
  
  
end





