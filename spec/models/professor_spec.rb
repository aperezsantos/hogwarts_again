require 'rails_helper'

RSpec.describe Professor, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :specialty}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:students).through(:professor_students)}
  end

  describe 'instance methods' do
    it ".average_student_age" do
      professor = Professor.create(name: "Professor", age: 30, specialty: "Waterbending")
      student_1 = professor.students.create(name: "Appa", age: 100, house: "Temple")
      student_2 = professor.students.create(name: "Momo", age: 101, house: "Temple")

      expect(professor.average_student_age).to eq(100.5)
    end
  end
end
