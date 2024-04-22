require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "Routes" do
    it { should route(:post, '/sign_up').to(action: :create) }
    it { should route(:get, '/sign_up').to(action: :new) }
    it { should route(:get, '/profile').to(action: :show) }
    it { should route(:get, '/profile/edit').to(action: :edit) }
    it { should route(:patch, '/profile/edit').to(action: :update) }
    it { should route(:get, '/password/edit').to(action: :edit_password) }
    it { should route(:patch, '/password/update').to(action: :update_password) }
  end
end
