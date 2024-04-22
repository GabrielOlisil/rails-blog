require 'rails_helper'

RSpec.describe Post, type: :model do



  describe "validations" do

    it { should validate_presence_of(:title) }

    it { should validate_presence_of(:subtitle) }

    it { should validate_presence_of(:body) }

    it { should validate_length_of(:body) }


  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:tag) }
    it { should have_many(:comments) }
  end
end
