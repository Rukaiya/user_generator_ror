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

  it "is not valid without a last name" do
    user = User.new(first_name: "Doe", email: "john.doe@example.com")
    expect(user).to_not be_valid
  end

  it "is not valid without an email" do
    user = User.new(first_name: "Doe", last_name: "Doe")
    expect(user).to_not be_valid
  end

  it "is not a valid email format" do
    user = User.new(first_name: "Doe", last_name: "Doe", email: "john.doe.com")
    expect(user).to_not be_valid
  end
end
