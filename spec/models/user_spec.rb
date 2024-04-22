require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(
    username: "user",
    email: "email@email.email",
    password: "pass",
    password_confirmation: "pass"
  ) }

  describe "Associations" do

    it { should have_many(:comments) }
    it { should have_many(:posts) }
  end

  describe "validations" do

    it { should have_secure_password }

    it { should validate_uniqueness_of(:email) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid with password mismatch" do
      subject.password_confirmation = "p"
      expect(subject).to_not be_valid
    end

    it "is not valid without email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without password_confirmation" do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid

    end

    it "is not valid without username" do
      subject.username = nil
      expect(subject).to_not be_valid

    end
  end
end
