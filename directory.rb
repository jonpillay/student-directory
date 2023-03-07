students = [
"Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Feddy Kruger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates",
]

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_names(names)
  names.each do |student|
    puts student
  end
end

def print_footer(names)
  puts "In total, we have #{names.count} exceptional students"
end

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