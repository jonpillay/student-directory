students = [
{name: "Dr. Hannibal Lecter", cohort: :november},
{name: "Darth Vader", cohort: :november},
{name: "Nurse Ratched", cohort: :november},
{name: "Michael Corleone", cohort: :november},
{name: "Alex DeLarge", cohort: :november},
{name: "The Wicked Witch of the West", cohort: :november},
{name: "Terminator", cohort: :november},
{name: "Feddy Kruger", cohort: :november},
{name: "The Joker", cohort: :november},
{name: "Joffrey Baratheon", cohort: :november},
{name: "Norman Bates", cohort: :november}
]

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_names(students)
  students.each do |student|
    puts "#{student[:name]} from the #{student[:cohort]} cohort"
  end
end

def print_footer(students)
  puts "In total, we have #{students.count} exceptional students"
end

def input_students
  puts "Please enter the name of the student you would like to enroll. "
  puts "To finish entering names, hit return twice"

  students = []

  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "The total number of student is now #{students.count}"
    name = gets.chomp
  end

  return students

end


students = input_students
print_header
print_names(students)
print_footer(students)

=begin
#print out the total number of students
print "In total, we have "
#use the print() function to put/print to avoid seperating lines
print 11
puts " great students"
=end