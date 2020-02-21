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
    client_name = Faker::Name.name
    
    fill_in('client_name', with: client_name)
    fill_in('client_email', with: Faker::Internet.email)
    fill_in('client_phone', with: Faker::PhoneNumber.phone_number)
    attach_file('client_avatar', "#{Rails.root}/spec/fixtures/avatar.png")
    choose(option: ['Y', 'N'].sample)
    click_on('Save Client')

    expect(page).to have_content('Client registered successful')
    expect(Client.last.name).to eq(client_name)
   end

   scenario 'Does something' do
    visit(new_clients_path)
    click_on('Save Client')
    expect(page).to have_content("Name can't be blank")
   end
end
