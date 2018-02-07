require 'rails_helper'

describe "User sees a name" do
  scenario "a user can see a students name" do
    student = Student.create!(name: "Muffin")
    visit student_path(student)

    expect(page).to have_content("Muffin")

  end
end
