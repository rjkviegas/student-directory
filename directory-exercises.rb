def center(string)
  puts string.center(100)
end

def name_spellcheck(name,i=0)
    center "Is the name spelling correct: (#{name})? Enter Yes or No"
    if i > 0
    center "To stop adding names input 'Done'"
    end
    check = gets.chomp.upcase!
    until check == "YES" || check == "DONE" do
      center "Please re-input with desired spelling"
      name = gets.chomp
      center "Is the name spelling correct: (#{name})? Enter Yes or No"
      check = gets.chomp.upcase!
    end
end
 
def spellcheck_default(user_input)
  center "Is your spelling correct: (#{user_input})? Enter Yes or No"
  check = gets.chomp.upcase!
  if check != "YES"
    center "Please re-input with desired spelling"
    user_input = gets.chomp
    if user_input.length == 0
      user_input = "n/a"
    end
  else
    center "Entry confirmed"
  end
end

def input_students_information
  center "Please enter the names of the students to be added to this directory"
  center "To finish adding entries, hit 'return' twice when prompted"
  # create empty arrays for student information
  students = []
  # create array of months of the year for cohorts options
  months = ["JANUARY", "FEBRUARY", "MARCH", "APRIL", "MAY", "JUNE", "JULY", "AUGUST", "SEPTEMBER", "OCTOBER", "NOVEMBER", "DECEMBER"]
  # get the first name
  name = gets.chomp
  # spell check name
  name_spellcheck(name)
  # while the name is not empty, repeat this code
  while !name.empty? do
    center "Please input the cohort month eg. november"
    # get the cohort month
    month = gets.chomp.upcase!
    until months.include?(month) do
      center "User input does not match possible options, please input again:"
      month = gets.chomp.upcase!
    end
    center "Please enter #{name}'s country of birth:"
    # get the students country of birth
    country = gets.chomp
    spellcheck_default(country)
    center "#{name}'s country of birth is #{country}."
    center "Please enter #{name}'s favourite hobby:"
    # get the students hobby
    hobby = gets.chomp
    spellcheck_default(hobby)
    # add students name and information to student array within a hash
    students << {name: name.to_sym, info: [month.to_sym, country.to_sym, hobby.to_sym]}
    # inform user of how many students have been inputted
    center "Now we have #{students.count} students."
    center "Enter a new student's name"
    center "To finish adding names hit 'return'"
    # gets another name from the user or break out of while loop
    name = gets.chomp
    name_spellcheck(name,1)
  end
  # return the array of students
  students
end

def print_header
  center "The students of Villains Academy"
  center "-------------"
end

def print(students)
  center "Please input the letter you want all the stuent names to be listed to begin with: "
  center "For ALL names to be listed, hit 'return'"
  center "(Please note only student names shorter than 12 character long will be printed)"
  # get a letter
  letter = gets.chomp
  # conditional for whether a letter is entered or not
  if letter.empty?
    # iteration over students array using while loop
    i = 0
    while students.length > i do
      if students[i][:name].length < 12
        center "#{i+1}. #{students[i][:name]} (#{students[i][:info][0]} cohort)"
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
        center "#{i+1}. #{students[i][:name]} (#{students[i][:info][0]} cohort)"
        i += 1
      else
        i += 1 
      end
    end
  end
end

def print_footer(students)
  center "Overall, we have #{students.count} great students)."
end

students = input_students_information
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)

puts students

