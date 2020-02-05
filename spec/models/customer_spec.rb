require 'rails_helper'

RSpec.describe Customer, type: :model do
  
  fixtures :customers

  it 'Create a Customer' do
    customer = customers(:adelino)
    expect(customer.name).to eq("Adelino Masioli")
  end
  
  it 'Create a Customer Herança' do
    customer = create(:customer_vip)
    expect(customer.vip).to eq(true)
  end

  it 'Create a Customer Attributes_for' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    expect(customer.name).to start_with('Sr. ')
  end
end
