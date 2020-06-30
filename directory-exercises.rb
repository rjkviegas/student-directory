def input_students_information
  puts "Please enter the names of the students to be added to this directory"
  puts "To finish adding entries, hit 'return' when prompted"
  # create empty arrays for student information
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter #{name}'s country of birth:"
    # get the students country of birth
    country = gets.chomp
    puts "#{name}'s country of birth is #{country}."
    puts "Please enter #{name}'s favourite hobby:"
    # get the students hobby
    hobby = gets.chomp
    # add students name and information to student array within a hash
    students << {name: name, info: [:november, country, hobby]}
    # inform user of how many students have been inputted
    puts "Now we have #{students.count} students."
    puts "Please enter a new student's name or 'return' to finish adding new students and their information"
    # gets another name from the user or break out of while loop
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  puts "Please input the letter you want all the stuent names to be listed to begin with: "
  puts "For ALL names to be listed, hit 'return'"
  puts "(Please note only student names shorter than 12 character long will be printed)"
  # get a letter
  letter = gets.chomp
  # conditional for whether a letter is entered or not
  if letter.empty?
    # iteration over students array using while loop
    i = 0
    while students.length > i do
      if students[i][:name].length < 12
        puts "#{i+1}. #{students[i][:name]} (#{students[i][:info][0]} cohort)"
        i += 1
      else
        i += 1
      end
    end
  else
    # iteration over students array using while loop when specific character supplied by user
    letter.upcase!
    i = 0
    while students.length > i do
      if students[i][:name][0] == letter && students[i][:name].length < 12
        puts "#{i+1}. #{students[i][:name]} (#{students[i][:info][0]} cohort)"
        i += 1
      else
        i += 1 
      end
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students)."
end

students = input_students_information
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)

puts students

