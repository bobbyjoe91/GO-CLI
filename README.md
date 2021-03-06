# GO-CLI
##### by Bobby Jonathan

Developed as the second stage final assignment of SEA Compfest X

GO-CLI is an transportation application that conects drivers and users through command-line interface program. For your daily transportation need, GO-CLI make the process of "ride-hailing" easy for every user.  This program also provides user the experience of using GO-CLI command line with intuitive syntaxes.

### Requirements and Installation
GO-CLI.zip and Ruby 2.5.0 are required to run GO-CLI application. The most reccommended operating system for GO-CLI app is Linux and OSX because of the Terminal it has. GO-CLI requires Terminal or Bash Shell because its syntaxes can only be recognized by Terminal.

For Windows, the alternative to Terminal are Linux Bash Shell (Windows 10 and 8) or VirtualBox (Windows 7 and older Windows) with Linux OS installed.

First, download GO-CLI app to start the installation. GO-CLI.zip can be downloaded by clicking the following link (https://github.com/syncopation101/GO-CLI). After that, extract the .zip file somewhere in your PC. Then, install Ruby 2.5.0 if it hasn't been installed by typing Terminal command line written in this link (https://www.ruby-lang.org/id/documentation/installation/).

### Instruction
##### Starting GO-CLI
You can start using GO-CLI by opening GO-CLI folder in the Terminal or Bash. After opening the folder, type this command line to start GO-CLI
```
ruby GO-CLI.rb
```
This command line will start GO-CLI with a 20x20 map with a random user and five random drivers position.

GO-CLI map is designed in nxn square to maximize user's line of sight to all directions.

The other way to use GO-CLI is by determining the n size of the map and x,y position of user with command below
```
ruby GO-CLI.rb n x y
```
where n is the size of map (nxn), x is row position of user, and y is column position of user. x and y is in range of 1 to n to make the usage intuitive for non-programer user. Five drivers will be generated with random position. 

Another yet powerful way to use GO-CLI is by typing the filename in the command line
```
ruby GO-CLI.rb filename.extension
```
GO-CLI is able to open any document file extensions. There is a format of file input that you have to follow so GO-CLI can recognize your input.
```
n user_row user_column m
driver_row_1 driver_column_1
driver_row_2 driver_column_2
.            .
.            .
.            .
driver_row_m driver_column_m
```
n is the size of the map. user_row and user_column denotes user position in column and row. m is the number of drivers available. 

This first line of input is ended with "Enter" or newline and each input is separated with space. The next m line is drivers' row and column position separated with space. First driver position to m-th driver position is ended with newline. You can open testcase1.txt as an example.

This way of inputing will make each number distinguishable and make another users, drivers, and developers easy to read your input. It is necessary to remember that the input file and GO-CLI.rb must be in the same directory.

#### GO-CLI Main Menu
```
                                  WELCOME TO                  
                  =========================================== 
                  ██████╗  ██████╗        ██████╗ ██╗     ██╗
                  ██╔════╝ ██╔═══██╗      ██╔════╝██║     ██║
                  ██║  ███╗██║   ██║█████╗██║     ██║     ██║
                  ██║   ██║██║   ██║╚════╝██║     ██║     ██║
                  ╚██████╔╝╚██████╔╝      ╚██████╗███████╗██║
                   ╚═════╝  ╚═════╝        ╚═════╝╚══════╝╚═╝
                  =========================================== 

                       type 'help' if you need more info

Please enter the command: _
```
This is the interface of GO-CLI main menu. For new user, it's recommended to type help in the CLI. Here are some command line user can input in GO-CLI
```
show map: shows map indicating user's (V) and drivers'(O) location
order go ride: allocates nearest driver to give user a lift
view history: shows all trip user had made
clear history: clean history
exit \ quit: close GO-CLI
about: about developer & support
```
For driver, GO-CLI provides `reset unit cost` so driver can easily change cost of a trip. The unit cost per block/ move refers to Code of Indonesia in Public Transportation (Rp 3500 - Rp 6700 in 2017).

#### The Map
To show the map, simply type `show map` in the CLI. The random map will look like this
```
....................
....................
....................
....................
.........O..O.......
....................
....................
..........O.........
.........O..........
....................
....................
....................
....................
....................
....................
....................
..V.........O.......
....................
....................
....................
```
Once the map is printed, there are dots, a V and some Os. Dots (.) represent empty road in the area, V represents user's location, and O represents the drivers' location.

Map can also be updated/ reloaded by typing `reload map` in the CLI. It will randomize new position of drivers and show the new map.

#### Ordering Go-Ride
The main service give to user is Go-Ride. This app will connect you with at least five Go-Ride drivers around you. Simply type `order go ride`, and you'll have to input row and column of your destination
```
Set your destination 
insert row: 4
insert column: 5
```
For better error-handling, row and column value is separated so error on row value will not affect column value, vice versa.

Wait for a while until GO-CLI print the route of the trip
```
Searching nearest driver...
======================================
Your driver is Mr. #20
Route to your destination:
 - start at [17, 1]
 - go to [16, 1]
 - go to [15, 1]
 - go to [14, 1]
 - go to [13, 1]
 - go to [12, 1]
 - go to [11, 1]
 - go to [10, 1]
 - go to [9, 1]
 - go to [8, 1]
 - go to [7, 1]
 - go to [6, 1]
 - go to [5, 1]
 - go to [4, 1]
 - turn right
 - go to [4, 2]
 - go to [4, 3]
 - go to [4, 4]
 - finish at [4, 5]
Trip price: Rp59500
======================================
Confirm trip [Y/n]: 
```
If you cancel the trip, you'll be brought back to "Please enter the command: " menu. Else, your driver will go to your position and your trip will be recorded in history. Happy riding!
```
Confirm trip [Y/n]: Y

Please wait...
Yeay, you have arrived! Thank you
```

Once you've arrived at your current position, your map will update user and driver coordinates. This also make the history writes a new "from" location if you make another new trip.

#### Viewing History
Type `view history` to view history. The history will pass your past order time, your location before the trip/ order, your destination, driver's name, the route from your past location to your past desination, and the price of the trip.
```
Please enter the command: view history

Order time: Thursday, 21 Jun 2018, 22:19:37
From: [17, 1]
Destination: [4, 5]
Driver: Mr. #20
Route: 
 - start at [17, 1]
 - go to [16, 1]
 - go to [15, 1]
 - go to [14, 1]
 - go to [13, 1]
 - go to [12, 1]
 - go to [11, 1]
 - go to [10, 1]
 - go to [9, 1]
 - go to [8, 1]
 - go to [7, 1]
 - go to [6, 1]
 - go to [5, 1]
 - go to [4, 1]
 - turn right
 - go to [4, 2]
 - go to [4, 3]
 - go to [4, 4]
 - finish at [4, 5]
Price: Rp 59500
```

History can also be cleared completely by typing `clear history`.

#### Quitting Program
There are two ways to quit from the program. You can type `quit` if you're familiar with it. Another way is by typing `exit`.

### For Developer: Program Control and Design Rationale

In GO-CLI.zip, main menu file (GO-CLI.rb) and a "classes and modules" folder are included. GO-CLI.rb itself serves as the main menu or front-end of GO-CLI. It also receive command line input by user. All of this are possible because of path loading of program\_flow.rb which controls input, output, and program flow mechanisms. "Classes and modules" folder includes driver.rb, generator.rb, go_ride.rb, history.rb, program_flow.rb, map.rb, command.rb and user.rb. These files manage different objects.

Driver.rb is used for initializing driver object by passing array of coordinate of five or user-specified number of drivers.

User.rb is used for initializing user object by its location. User class also has destination class to set and store its destination.
If user specifies the number of drivers in input file, program\_flow.rb will parse the file and pass an array of drivers' coordinate as much as user specifies.

Generator.rb is file with Generate module which used by program\_flow.rb to generate random coordinate. Command.rb also contains module called Command which has series of syntaxes in each function. Each funtion of module does specific tasks. For achieving simplicity and modularity, generator.rb and command.rb are separated from program\_flow.rb.

Map.rb is used for initializing map with size, user and drivers location as parameters; and also displaying the map to the screen. It may be possible that driver is in the same coordinate as user, but this program will print user's location after printing driver's location so user can still determine his/ her position.

Go\_ride.rb is a class which models Go-Ride order, show trip route & price, and send Exchage modules to history.rb.

History.rb is an object for writing and showing all trip history. History.rb receives modules from go\_ride.rb as the source to write history. History 

Program\_flow.rb manages three input mechanisms mentioned before, and it passes variables to some classes and call all functions from all files in this program.

All method in this program is set to public because there are a lot of data in the method which return a value, but not all variable are given accessor. It is done to keep some variables secret to users.

Actually, this program has two dynamic feature: it will always update user and drivers position after a trip is confirmed, it can reload map to update drivers' coordinate. Those two features has one goal: to make GO-CLI resemble recent transportation applications.
