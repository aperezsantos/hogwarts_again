require "rails_helper"

RSpec.describe "Pressor Show Page" do
  describe "when I visit a professor's show page" do
    before(:each) do
      @hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
      @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor")
      @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin")
      @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor")

      ProfessorStudent.create(student: @harry, professor: @hagarid)
      ProfessorStudent.create(student: @malfoy, professor: @hagarid)

      visit "/professors/#{@hagarid.id}"
    end

    it "I see a list of their stuents" do
      expect(page).to have_content(@hagarid.name)
      expect(page).to_not have_content(@lupin.name)

      within("#student-#{@harry.id}") do
        expect(page).to have_content(@harry.name)
        expect(page).to have_content(@harry.age)
      end

      within("#student-#{@malfoy.id}") do
        expect(page).to have_content(@malfoy.name)
        expect(page).to have_content(@malfoy.age)
      end

      expect(page).to_not have_content(@longbottom.name)
    end

    it "I see the average age of all students for that professor" do
      expect(page).to have_content("Average Age of Students: 11.5")
    end
  end
end

# User Story 4 of 4
# As a visitor,
# When I visit '/professors/:id'
# I see the average age of all students for that professor.
# (e.g. "Average Age: 14.5")


# User Story 2 of 4
# As a visitor,
# When I visit '/professors/:id'
# I see a list of the names of the students the professors have.
# (e.g. "Neville Longbottom"
#       "Hermione Granger"
#       "Luna Lovegood")
