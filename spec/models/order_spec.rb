require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Create order' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Create order list' do
    order = create_list(:order, 3, description: "Description Test")
    expect(order.count).to eq(3)
    puts order.inspect
  end
end
