require 'rails_helper'

RSpec.describe Customer, type: :model do
  
  fixtures :customers

  it 'Create a Customer' do
    customer = customers(:adelino)
    expect(customer.name).to eq("Adelino Masioli")
  end
end
