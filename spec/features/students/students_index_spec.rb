require 'rails_helper'

RSpec.describe "Students Index Page" do
  describe "when I visit /students" do
    before(:each) do
      @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      @hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
      @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      ProfessorStudent.create(student: @harry, professor: @snape)
      ProfessorStudent.create(student: @harry, professor: @hagarid)
      ProfessorStudent.create(student: @harry, professor: @lupin)
      ProfessorStudent.create(student: @malfoy, professor: @hagarid)
      ProfessorStudent.create(student: @malfoy, professor: @lupin)
      ProfessorStudent.create(student: @longbottom, professor: @snape)

      visit "/students"
    end

    it "I see a list of students and the number of professors each student has" do
      expect(page).to have_content("Harry Potter has 3 professor(s).")
      expect(page).to have_content("Draco Malfoy has 2 professor(s).")
      expect(page).to have_content("Neville Longbottom has 1 professor(s).")
    end

    it "I see students listed alphabetically" do
      expect(@harry.name).to appear_before(@malfoy.name)
      expect(@malfoy.name).to appear_before(@longbottom.name)
    end
  end
end

# User Story Extension
# On all index pages, all information is listed alphabetically.
# Collapse

# User Story 3 of 4
# As a visitor,
# When I visit '/students'
# I see a list of students and the number of professors each student has.
# (e.g. "Draco Malfoy: 5"
#       "Nymphadora Tonks: 10")
