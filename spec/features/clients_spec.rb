require 'rails_helper'

feature "Clients", type: :feature do
  scenario 'Have link Register New Client' do
    visit(root_path)
    expect(page).to have_link('Create new Client')
   end
 
   scenario 'Verify link Register New Client' do
    visit(root_path)
    click_on('Create new Client')
    expect(page).to have_content('List Clients')
    expect(page).to have_link('Create new Client')
   end

   scenario 'Verify Page Register New Client' do
    visit(clients_path)
    click_on('Create new Client')
    expect(page).to have_content('New Client')
   end

   scenario 'Verify Form Register New Client' do
    visit(new_clients_path)
    click_on('Create new Client')
    expect(page).to have_content('New Client')
   end
end
