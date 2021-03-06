require 'rails_helper'

RSpec.describe SessionController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #new' do
    before { get :new }

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      before do
        post :create, session: { email: user.email, password: user.password }
      end

      it "logs in user" do
        expect(session[:user_id]).to eq user.id
      end

      it 'assigns a success flash message' do
        expect(flash[:success]).not_to be_nil
      end

      it 'redirects to root path' do
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid attributes' do
      before do
        post :create, session: { email: 'wrong_mail', password: '123' }
      end

      it 'assigns a danger flash message' do
        expect(flash[:danger]).not_to be_nil
      end

      it 'renders new view' do
        expect(response).to render_template :new
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      session[:user_id] = user.id
      delete :destroy, id: user
    end

    it 'deletes session' do
      expect(session[:user_id]).to be_nil
    end

    it 'redirects to root_path' do
      expect(response).to redirect_to root_path
    end
  end
end
