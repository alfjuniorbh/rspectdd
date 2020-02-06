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
    expect(customer.full_name).to start_with('Sr. ')
  end

  it 'Create a Customer Attributes_transient' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it 'Create a Customer Gender' do
    customer = create(:customer_male)
    expect(customer.gender).to eq('M')
  end

  it 'Travel to' do
    travel_to Time.zone.local(2004, 11, 24, 01, 04, 44) do
      @customer = create(:customer_vip)
    end
    puts @customer.created_at
    puts Time.now
    expect(@customer.created_at).to eq(Time.new(2004, 11, 24, 01, 04, 44))
  end

end
