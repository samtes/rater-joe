require 'spec_helper'

feature "New reviews" do

  scenario "user creates a new review" do
    login_as Fabricate(:user, email: "ruby@example.com", username: "ruby")
    click_link "Create review"
    fill_in "Name", with: "Nashville Software School"
    fill_in "Type", with: "Web Development Bootcamp"
    fill_in "Length", with: "6"
    fill_in "Review as student or instructor", with: "Student"
    fill_in "Website", with: "http://nashvillesoftwareschool.com/"
    fill_in "Quality of Instruction 1 - 5", with: "3"
    fill_in "Length of Instruction 1 - 5", with: "2"
    fill_in "Content of Instruction 1 - 5", with: "4"
    fill_in "Quality of Instruction 1 - 5", with: "3"
    fill_in "Course work 1 - 5", with: "5"
    fill_in "Remark ....", with: "The course is ok!"
    click_button "Create Review"
    page.should have_content "Institution was successfully created"
    # current_path.should == institution_path
    page.should have_content "Nashville Software School"
  end
end