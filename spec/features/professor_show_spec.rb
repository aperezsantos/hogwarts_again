require "rails_helper"

RSpec.describe "Pressor Show Page" do
  describe "when I visit a professor's show page" do
    it "I see a list of their stuents" do
      hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
      lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      harry = hagarid.students.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      malfoy = hagarid.students.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      longbottom = lupin.students.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      ProfessorStudent.create(student_id: harry, professor_id: hagarid)
      ProfessorStudent.create(student_id: malfoy, professor_id: hagarid)

      visit "/professors/#{hagarid.id}"

      expect(page).to have_content(hagarid.name)
      expect(page).to_not have_content(lupin.name)

      within("#student-#{harry.id}") do
        expect(page).to have_content(harry.name)
        expect(page).to have_content(harry.age)
      end
      
      within("#student-#{malfoy.id}") do
        expect(page).to have_content(malfoy.name)
        expect(page).to have_content(malfoy.age)
      end

      expect(page).to_not have_content(longbottom.name)
    end
  end
end
# User Story 2 of 4
# As a visitor,
# When I visit '/professors/:id'
# I see a list of the names of the students the professors have.
# (e.g. "Neville Longbottom"
#       "Hermione Granger"
#       "Luna Lovegood")
