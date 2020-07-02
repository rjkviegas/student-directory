@students = [] # an empty array accessible to all methods

def action_successful
  puts "Action successful"
end

def get_file
  puts "Input file name:"
  gets.chomp
end

def add_students(name, cohort="november")
  @students << { name: name, cohort: cohort.to_sym}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_students(name)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file (Default = students.csv)"
  puts "4. Load the list from file (Default = students.csv)"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students 
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students(get_file)
    when "4"
      load_students(get_file)
    when "9"
      exit # this will cause the program to terminte
    else
      puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students_list
  if @students.count > 0
    @students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  else
    puts "Error! There are no students to list."
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students(user_file="student.csv")
  # open the file for writing 
  File.open(user_file, "w"){|file|
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  }
  action_successful
end

def load_students(user_file = "students.csv")
  File.open(user_file, "r"){|file|
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_students(name, cohort)
  end
  }
  action_successful
  puts "Loaded students from #{user_file}"   
end

def load_students_file
  filename = ARGV.first # first argument from the command line
  if filename.nil? # use default file (students.csv) if a file isn't given
    load_students
  elsif File.exists?(filename) # if it exists
    load_students(filename)
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

load_students_file
interactive_menu
