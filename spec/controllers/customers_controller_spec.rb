# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomersController, type: :controller do

  context 'Not Guest' do
    it 'responds successfully' do
      get :index
      expect(response).to be_success
    end

    it 'returns status 200 response' do
      get :index
      expect(response).to have_http_status(200)
    end
  
    it 'returns status 302 response show' do
      customer = create(:customer)
      get :show, params: { id: customer.id }
      expect(response).to have_http_status(302)
    end
  end

  context 'Logged' do
    it 'do login and return user' do
      member = create(:member)
      customer = create(:customer)
  
      sign_in member
  
      get :show, params: { id: customer.id }
      expect(response).to have_http_status(200)
    end

    it 'do login and show template' do
      member = create(:member)
      customer = create(:customer)
  
      sign_in member
  
      get :show, params: { id: customer.id }
      expect(response).to render_template(:show)
    end
  end
end
