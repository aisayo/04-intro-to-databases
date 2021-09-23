STARSHIPS = []

def init
  puts "Welcome to the Starships App"
  puts "Tell us your name: "
  name = gets.strip
  puts "Awesome, #{name.capitalize}, What would you like to do?"
  menu
  menu_option
  goodbye
end 

def menu
  puts "Enter the number of your selection, or 'exit' to leave the app"
end 

def menu_option 
  puts " 1. Create a new starship!"
  puts " 2. View all starships"
  puts " 3. Change your mind? Type 'exit' to leave the app!"
  menu_selection
end 

def menu_selection
  selection = gets.strip
  while selection != "exit"
    if selection == "1"
      starship = create_starship
      STARSHIPS << starship 
      starship_details(starship)
    elsif selection == "2"
      starship_list
    else 
      puts "I'm not sure what you mean. Try again:"
    end 
    menu_option
    selection = gets.strip
  end 
end 

def create_starship
  puts "Name of starship, get creative!"
  name = gets.strip 
  puts "Whats the model?"
  model = gets.strip 
  starship = Starship.new(name, model)
end 


def starship_details(starship)
  puts ""
  puts "Name: #{starship[:name]}"
  puts "Model: #{starship[:model]}"
  puts ""
end 

def starship_list 
  STARSHIPS.each do |starship|
    starship_details(starship)
end 

def goodbye
  puts "Come back again!"
end 

end 
