require_relative '../controllers/robot_controller.rb'
require 'colorize'
require 'tty-prompt'

# install gems for tty interface

# screens

class Interface

  def initialize
    @prompt = TTY::Prompt.new
  end

  def start_app
    welcome()
    menu()
  end

# 1. homescreen

  def welcome
    puts "WELCOME TO TOYROBOT".colorize(:blue)
    puts "by Kuan Lee".colorize(:blue)
  end
# 2. menu - play robot game or quit
  def menu
    input = @prompt.select("What would you like to do?", %w(Play Quit))
  end


# 3. submenu - after play selected --> show instructions

  def sub_menu
    
  end

# 4. - place - menu --> enter x, y and direction 

  # a - move

  # b - left

  # c - right

  # d - report

end

