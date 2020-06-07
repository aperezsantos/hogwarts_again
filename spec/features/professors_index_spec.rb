require 'rails_helper'

RSpec.describe "Professors Index Page" do
  describe "when I visit /professors" do
    it "I see a list of professors with details for each" do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
      lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      visit "/professors"

      expect(page).to have_content("Name: #{snape.name}")
      expect(page).to have_content("Age: #{snape.age}")
      expect(page).to have_content("Specialty: #{snape.specialty}")
      expect(page).to have_content(hagarid.age)
      expect(page).to have_content(lupin.specialty)
    end
  end
end
# User Story 1 of 4
# As a visitor,
# When I visit '/professors',
# I see a list of professors with the following information:
# -Name
# -Age
# -Specialty
# (e.g. "Name: Minerva McGonagall, Age: 204, Specialty: Transfiguration")
