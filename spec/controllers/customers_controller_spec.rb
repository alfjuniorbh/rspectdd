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
    before do
      @member = create(:member)
      @customer = create(:customer)
    end

    it 'Content type' do
      customer_params = attributes_for(:customer)
      sign_in @member
      post :create, format: :json, params: { customer: customer_params }
      expect(response.content_type).to eq('application/json')
    end

    it 'Flash notice' do
      customer_params = attributes_for(:customer)
      sign_in @member
      post :create, params: { customer: customer_params }
      expect(flash[:notice]).to match(/successfully created/)
    end

    it 'valid attributes' do
      customer_params = attributes_for(:customer)
      sign_in @member
      expect {
        post :create, params: { customer: customer_params }
      }.to change(Customer, :count).by(1)
    end

    it 'invalid attributes' do
      customer_params = attributes_for(:customer, address: nil)
      sign_in @member
      expect {
        post :create, params: { customer: customer_params }
      }.not_to change(Customer, :count)
    end

    it 'do login and return user' do
      sign_in @member
  
      get :show, params: { id: @customer.id }
      expect(response).to have_http_status(200)
    end

    it 'do login and show template' do
      sign_in @member
  
      get :show, params: { id: @customer.id }
      expect(response).to render_template(:show)
    end
  end
end
