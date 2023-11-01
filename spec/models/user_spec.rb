require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(first_name: "John", last_name: "Doe", email: "john.doe@example.com")
    expect(user).to be_valid
  end

  it "is not valid without a first name" do
    user = User.new(last_name: "Doe", email: "john.doe@example.com")
    expect(user).to_not be_valid
  end

  # Add more test cases as needed
end