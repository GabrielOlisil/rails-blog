require 'rails_helper'

RSpec.describe PasswordsController, type: :controller do
  describe "Routes" do
    it { should route(:post, '/passwords').to(action: :create) }
    it { should route(:get, '/passwords/new').to(action: :new) }
  end
end