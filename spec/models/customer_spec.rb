require 'rails_helper'

RSpec.describe Customer, type: :model do
  
  fixtures :customers

  it 'Create a Customer' do
    customer = customers(:adelino)
    expect(customer.name).to eq("Adelino Masioli")
  end
  
  it 'Create a Customer' do
    customer = create(:customer_vip)
    expect(customer.vip).to eq(true)
  end
end
