# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

ProfessorStudent.create(student_id: harry, professor_id: snape)
ProfessorStudent.create(student_id: harry, professor_id: hagarid)
ProfessorStudent.create(student_id: harry, professor_id: lupin)
ProfessorStudent.create(student_id: malfoy, professor_id: hagarid)
ProfessorStudent.create(student_id: malfoy, professor_id: lupin)
ProfessorStudent.create(student_id: longbottom, professor_id: snape)

# Professor Student connections

# harry = snape.students.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
# harry = snape.students.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
# longbottom = hagarid.students.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
# malfoy = hagarid.students.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
# harry = lupin.students.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
# malfoy = lupin.students.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
