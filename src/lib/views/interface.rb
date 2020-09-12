require_relative '../controllers/robot_controller.rb'
require_relative '../models/table.rb'
require 'colorize'
require 'tty-prompt'
require 'tty-spinner'
require 'tty-font'


class Interface

  def initialize
    @prompt = TTY::Prompt.new
    @font = TTY::Font.new(:starwars)
    @spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :pulse_2)
  end

  # TO START THE APP
  def start_app
    online = true
    # keeps the program running until user aborts
    while online == true
      welcome()
      menu = menu()
      if menu == 'Play'
        name = ask_name()
        create_game(name)
        controller()
        unless play_again?()
          quit()
        end
      else
        quit()
      end
    end
  end

# 1. HOMESCREEN

  def welcome
    spin()
    puts @font.write("TOYROBOT").colorize(:blue)
    puts "by Kuan Lee".colorize(:light_blue)
  end

  def menu
    @prompt.select("What would you like to do?", %w(Play Quit))
  end

  def ask_name
    spin()
    @prompt.ask("What is your name?", default: "Neverfall")
  end

# 2. SHOW INSTRUCTIONS AND CREATE A GAME ONCE USER SELECTS PLAY

  def create_game(name)
    spin()
    puts "\nINSTRUCTIONS".colorize(:yellow)
    sleep(1)
    puts "\nHi #{name.colorize(:yellow)}, to begin the game, you first need to create a robot"
    sleep(2)
    puts "\nTo do that, you are required to enter the coordinates of where you would like to place your robot on a table and the direction it is facing."
    sleep(2)
    puts "\nThe position is represented in this format [x, y] and the directions are NORTH, SOUTH, EAST, WEST."
    sleep(2)

    # create props for game here
    table = Table.new(5, 5)
    @game = RobotController.new(table)

  end

# 3. USER TO CREATE COMMANDS AND RETURN A LIST OF COMMANDS

  def create_commands
    spin()
    finalised = false
    commands = []
    
    while finalised == false

      # show running commands
      puts "\n"
      print "Your running commands: #{commands}" 
      puts "\n"
      puts "\n"

      # user to select commands
      # continue to receive commands until user selects DONE or QUIT
      command = @prompt.select("Now we need to form a sequence of commands to run your robot or BACK to return main menu. Please select commands from below: (select at least 1)\n", %w(PLACE MOVE LEFT RIGHT REPORT DONE QUIT))

      case command
        when 'QUIT' then quit()
        when 'PLACE' then commands << place_input
        when 'DONE' then finalised = confirm_commands(commands)
        else 
          commands << command
      end

    end

    return commands
    
  end

# 4. CONFIRM COMMANDS - RETURN TRUE/FALSE
  def confirm_commands(commands)
    spin()
    print "These are your commands #{commands}\n"

    return decision = @prompt.yes?("Are you sure you would like to execute these commands?", convert: :boolean)

  end

# 5. INTEGRATE WITH CONTROLLER 

  def controller()
    
    # run interface that collects commands from user or allow user to quit at any time
    commands = create_commands()
    spin()
    # sanitise input - which will ignore commands before PLACE
    # save commands into an instance variable
    @commands = @game.sanitise_input(commands)

    # format of PLACE data ['PLACE', x, y, 'DIRECTION']
    # set up arguments to parse into controller place method in order to create a robot
    x = @commands[0][1]
    y = @commands[0][2]
    direction = @commands[0][3]

    # create a robot 
    @game.place(x, y, direction)

    # executes the rest of the commands
    # should try and catch error
    @game.execute(@commands)
    
  end
  
  # PROMPT-RELATED METHODS

  # to obtain input for PLACE command
  def place_input

    # ask for position 
    position = ask_position()

    # ask for direction
    direction = ask_direction()

    # transform position and direction into same data structure in controller
    return place = ['PLACE', position[0], position[1], direction]

  end

  # user prompt for direction
  def ask_direction
    direction = @prompt.select("Choose a direction your robot is facing", %w(NORTH SOUTH EAST WEST))
  end

  # user prompt for position
  def ask_position 

    x = 0
    y = 0
    position = false
    
    input = @prompt.select("Set the initial position for your robot. Enter a number between 0 - 4 for x and y", %w(x y))
    
    while position == false

      x = @prompt.ask("Enter a number between 0 - 4 for x value: ", convert: :int, required: true) { |q| q.in("0-4") }

      y = @prompt.ask("Enter a number between 0 - 4 for y value: ", convert: :int, required: true) { |q| q.in("0-4") }

      position = [x, y]
  
    end

    return position

  end

  def play_again?
    return @prompt.yes?("Do you want to play again?", convert: :boolean)
  end

  def spin
    @spinner.auto_spin
    sleep(1)
    @spinner.stop
  end

  def quit
    spin()
    abort @font.write("see you").colorize(:yellow)
  end


end

