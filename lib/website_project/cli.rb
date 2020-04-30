class WebsiteProject::CLI 

  
  def call 
    puts "Welcome!"
    #choose_criteria
    #list_companies
    #choose_company
    #give_info_on_company
  end 
  
  def choose_criteria
   @user_options = ['Top 100 companies','Top 50 small companies','Top 50 midsize companies','Top 50 paying companies','Top 50 companies with benefits']
  end
 
  def print_options
    @user_options.each.with_index(1) do |index, list| 
    puts "#{index}, #{list}"
   end
  end 
end