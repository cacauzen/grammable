require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "comments#create action" do
      it "should allow users to create comments on grams" do
        p = FactoryGirl.create(:gram)

        u = FactoryGirl.create(:user)
        sign_in u

        post :create, gram_id: p.id, comment: { message: 'awesome gram' }
        expect(response).to redirect_to root_path

        expect(p.comments.length).to eq 1
        expect(p.comments.first.message).to eq "awesome gram"
      end

      it "should require a user to be logged in to comment on a gram" do
        p = FactoryGirl.create(:gram)
        post :create, gram_id: p.id, comment: { message: 'awesome gram' }
        expect(response).to redirect_to new_user_session_path
      end

      it "should return http status code of not found if the gram isn't found" do
        u = FactoryGirl.create(:user)
        sign_in u
        post :create, gram_id: 'SPACEDUCK', COMMENT: {message: 'cool gram'}
        expect(response).to have_http_status(:not_found)

      end
    end
end
