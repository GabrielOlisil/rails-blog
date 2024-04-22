require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "Routes" do
    it { should route(:get, '/').to(action: :index) }
    it { should route(:get, '/posts/1').to(action: :show, id: 1) }
    it { should route(:get, '/posts/1/edit').to(action: :edit, id: 1) }
    it { should route(:get, '/posts/new').to(action: :new) }
    it { should route(:post, '/posts').to(action: :create) }
    it { should route(:patch, '/posts/1').to(action: :update, id: 1) }
    it { should route(:put, '/posts/1').to(action: :update, id: 1) }
    it { should route(:delete, '/posts/1').to(action: :destroy, id: 1) }
  end
end
