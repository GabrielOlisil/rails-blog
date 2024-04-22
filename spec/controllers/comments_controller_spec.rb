require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "Routes" do
    it { should route(:post, '/posts/1/comments').to(action: :create, post_id: 1) }
  end
end