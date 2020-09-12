# TOYROBOT SOLUTION 

## Tech Stack and Dependencies

The program runs on Ruby version 2.7.1. If you don't have ruby installed, here is a guide for [ruby installation](https://www.ruby-lang.org/en/documentation/installation/)

Gems used for terminal app:

```
gem "rspec"
gem "tty-prompt"
gem "colorize"
gem 'tty-spinner'
gem 'tty-font'
```

## Installation

Before starting, please clone the project into your local server from the following source

```
  git clone git@github.com:codebender16/toy_robot.git
```

Alternatively, you can go to my [Github](https://github.com/codebender16/toy_robot) to clone.

After cloning, please run the following command to install all the dependencies in order to run the program successfully.

If you do not have bundler installed, please have it installed before running `bundle install`

```
  gem install bundler
```

```
  bundle install
```

## Usage 

To run the program:

Ensure you are in the root directory
  
```
  ruby app.rb
```

## Code

The source code lives in the `lib` folder and are categorised by the MVC model.  

## Testing and test data

In the `spec` folder, there are files containing in each sub-folder (models, controllers, views). The files consist of tests written for the project.

To run all tests, `cd src/` and run the below command:

```
  rspec
```

## Example of user flow

After running `ruby app.rb`:

1. Select `play` using arrow keys
2. Enter `your name`
3. Please follow the below commands for each scenario

### Scenario A - to test if robot ignores command before the first PLACE command

1. Select `MOVE`
2. Select `RIGHT`
3. Select `PLACE` and enter the `2 for x` and `2 for y` (x and y are restricted between 0 and 4)
4. Select `NORTH` from the direction list
5. Select `DONE`
6. Confirm commands with `y`
7. Select `REPORT`

The output should be `2, 2, NORTH`


### Scenario B - to test if robot will ignore invalid moves

1. Select `PLACE` and enter the `0 for x` and `0 for y`
2. Select `WEST` from the direction list
3. Select `MOVE` 
4. Select `RIGHT`
5. Select `MOVE` twice
6. Select `DONE`
7. Confirm with `y`
8. Select `REPORT`

The output should be `0, 2, NORTH`


## Software Architecture and Design

1. The design of the architecture follows the MVC (Model, View, Controller) architecture. The decision behind this is to ensure that separation of concerns for the app's functionality is exercised.
2. Test-Driven Development (TDD) is implemented to ensure there is minimal code required to pass unit tests written for each component class.
3. Directory adheres to standard file management system. `src` folder contains the `spec` (tests) and `lib` (functional code) folders.
4. Gems listed above are used for testing and visual effect, in order to, enhance the quality of user interaction with the app.
5. This is work-in-progress and will be continually updated to refactor code and to add new feature such as showing visuals of robot movements on a table.