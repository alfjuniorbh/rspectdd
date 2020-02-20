require 'rails_helper'

feature "Clients", type: :feature do
  scenario 'Have link Register New Customer' do
    visit(root_path)
    expect(page).to have_link('Create new Customer')
   end
 
   scenario 'Verify link Register New Customer' do
    visit(root_path)
    click_on('Create new Customer')
    expect(page).to have_content('List Customers')
    expect(page).to have_link('Create new Customer')
   end
end
