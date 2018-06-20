require_relative 'input.rb'

#MAIN MENU

#splash screen
puts "               WELCOME TO                  "
puts "=========================================== "
puts "██████╗  ██████╗        ██████╗ ██╗     ██╗"
puts "██╔════╝ ██╔═══██╗      ██╔════╝██║     ██║"
puts "██║  ███╗██║   ██║█████╗██║     ██║     ██║"
puts "██║   ██║██║   ██║╚════╝██║     ██║     ██║"
puts "╚██████╔╝╚██████╔╝      ╚██████╗███████╗██║"
puts "╚═════╝  ╚═════╝        ╚═════╝╚══════╝╚═╝"
puts "=========================================== "
#art by: http://patorjk.com/software/taag/#p=display&h=0&v=2&f=ANSI%20Shadow&t=GO-CLI 

#help screen
puts "\n                         GO-CLI's guide for user"
puts "\nshow map -- shows user's and drivers' location"
puts "order go ride -- allocates nearest driver to give user a lift"
puts "view history -- shows all trip user had made"
puts "\n----------------------------------------------------------------------------"

#user's input of command line
command_box()
               
