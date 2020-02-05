require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'New order' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end
end
