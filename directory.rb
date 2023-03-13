$students = [
{name: "Dr. Hannibal Lecter", cohort: :November},
{name: "Darth Vader", cohort: :November},
{name: "Nurse Ratched", cohort: :November},
{name: "Michael Corleone", cohort: :November},
{name: "Alex DeLarge", cohort: :November},
{name: "The Wicked Witch of the West", cohort: :November},
{name: "Terminator", cohort: :November},
{name: "Feddy Kruger", cohort: :November},
{name: "The Joker", cohort: :November},
{name: "Joffrey Baratheon", cohort: :November},
{name: "Norman Bates", cohort: :November}
]

def print_header
  puts ""
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print_footer()
  puts "In total, we have #{$students.count} exceptional students".center(50)
  puts "-------------".center(50)
  puts ""
end

def print_details(student, index)
  if index == 1
    print_header
  end
  puts "#{index}. #{student[:name]} from the #{student[:cohort]} cohort".center(50)
end

def print_names()
  $students.each_with_index do |student, index|
    print_details(student, index)
  end
  print_footer
end

def print_names_begining(letter)
  $students.each_with_index do |student, index|
    if student[:name].split('')[0] == letter
      print_details(student, index)
    end
  end
  print_footer
end

def print_names_shorter(length)
  $students.each_with_index do |student, index|
    if student[:name].length < length
      print_details(student, index)
    end
  end
  print_footer
end

def category_prompt(student)
  puts "Would you like to add a category for #{student[:name]}"
  puts "To finish entering categories, hit return twice"

  category = gets.chomp

  while !category.empty? do
    puts "What is the value assotiated with this category?"
    value = gets.chomp
    student[category] = value
    category = gets.chomp
  end
  return "Thank you!"
end

def input_students
  
  puts "Please enter the name of the student you would like to enroll. "
  puts "To finish entering names, hit return twice"

  name = gets.chomp

  students = []
  
  while !name.empty? do
    students << {name: name, cohort: :November}
    if students.count == 1
      puts "Now we have 1 student"
    else
      puts "The total number of student is now #{students.count}".center(50)
    end
    category_prompt(students[-1])
    name = gets.chomp
  end
  return students
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students"
  puts "4. Load student list from students.csv"
  puts "9. Exit"

  selection = gets.chomp
end

def show_students
  print_names()
  print_footer()
end

def save_students
  file = File.open("students.csv", "w")

  $students.each.do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each.do |line|
    name, cohort = line.chomp.split(',')
    $students << (name: name, cohort: cohort.to_sym)
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{$students.count} from #{filename}"
  else
    puts "Sorry #{filename} does not exist."
    exit
  end
end

def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again, please."
  end
end

def interactive_menu
  students = []
  loop do
    selection = print_menu
    process(selection)
  end
end

interactive_menu

#name = "Joffrey Baratheon"

#print name.split('')[0...-1]

#input_students
#print_names()
#print_names_begining('D')
#print_names_shorter(12)

=begin
#print out the total number of students
print "In total, we have "
#use the print() function to put/print to avoid seperating lines
print 11
puts " great students"
=end