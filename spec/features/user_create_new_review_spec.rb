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
    click_button "Create Review"
    page.should have_content "Institution was successfully created"
    # current_path.should == institution_path
    page.should have_content "Nashville Software School"
  end
end