def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # gets another name from the user
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
  puts "Please enter the letter you want all the names listed to begin with: "
  puts "For ALL names to be listed, just hit return"
  puts "(Only names shorter than 12 character will be printed)"
  # get a letter
  letter = gets.chomp
  # conditional for whether a letter is entered or not
  if letter.empty?
    students.each_with_index do |student, index|
      if student[:name].length < 12
        puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
      end
    end
  else
    letter.upcase!
    students.each_with_index do |student, index|
      if student[:name][0] == letter && student[:name].length < 12
        puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
      end
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students (whose name is shorter than 12 characters)."
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)


