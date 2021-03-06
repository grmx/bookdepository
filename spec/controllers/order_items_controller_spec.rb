require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
  let(:user) { create(:user) }
  let(:book) { create(:book) }

  it { should use_before_filter(:not_signed_user) }

  describe 'POST #create' do
    before { sign_in(user, no_capybara: true) }

    context 'with valid attributes' do
      it 'saves an order_item in the database' do
        expect { post :create, book_id: book.id }.
          to change(OrderItem, :count).by(1)
      end

      it 'assigns a success flash message' do
        post :create, book_id: book.id
        expect(flash[:success]).not_to be_nil
      end

      it 'redirects to show view' do
        post :create, book_id: book.id
        expect(response).to redirect_to cart_path
      end
    end

    context 'with invalid attributes' do
      it 'generates RecordNotFound error without post params' do
        expect { post :create, book_id: 'abcd' }
        .to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
