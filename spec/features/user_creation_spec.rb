require 'rails_helper'

RSpec.feature "User Creation", type: :feature do
  scenario "User creates a new user" do
    visit root_path
    fixture_file_upload('TaskSampleSheet.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
    click_button 'Upload'

    expect(page).to have_content("Please upload an Excel file.")
  end
end
