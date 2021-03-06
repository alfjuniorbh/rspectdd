require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Create order belongs to' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Create order list' do
    order = create_list(:order, 3, description: "Description Test")
    expect(order.count).to eq(3)
  end

  it 'Create order pair' do
    order = create_pair(:order)
    expect(order.count).to eq(2)
  end

  it 'Create order has many' do
    customer = create(:customer, :with_orders)
    expect(customer.orders.count).to eq(3)
  end
  
end
