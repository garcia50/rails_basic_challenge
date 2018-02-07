require 'rails_helper'

describe "Students" do
  describe "User sees a name" do
    scenario "a user can see a students name" do
      student = Student.create!(name: "Muffin")
      visit student_path(student)

      expect(page).to have_content("Muffin")

    end
  end

  describe "User sees a list of students" do 
    scenario "a user sees a list of students" do
      student = Student.create!(name: "Muffin")
      student = Student.create!(name: "Blue")
      student = Student.create!(name: "Jeff")

      visit students_path

      expect(page).to have_content("Muffin")
      expect(page).to have_content("Blue")
      expect(page).to have_content("Jeff")
    end
  end

  describe "User creates a student" do 
    scenario "a user can create a student" do

      visit new_student_path

      fill_in "student[name]", with: "Muffin" 

      click_on "Create Student"

      expect(current_path).to eq(student_path(Student.last))
      expect(page).to have_content("Muffin")
    end
  end

  describe "User edits a student" do 
    scenario "a user can edit a student" do
      student = Student.create!(name: "Muffin")

      visit edit_student_path(student)

      fill_in "student[name]", with: "Blue"

      click_on "Update Student"

      expect(current_path).to eq(student_path(Student.last))
      expect(page).to have_content("Blue")
    end



end





















