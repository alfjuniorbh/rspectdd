require 'rails_helper'

feature "Clients", type: :feature do
  scenario 'Have link Register New Client' do
    visit(root_path)
    expect(page).to have_link('List all Clients')
   end
 
   scenario 'Verify link Register New Client' do
    visit(root_path)
    click_on('List all Clients')
    expect(page).to have_content('List Clients')
    expect(page).to have_link('Create new Client')
   end

   scenario 'Verify Page Register New Client' do
    visit(clients_path)
    click_on('Create new Client')
    expect(page).to have_content('New Client')
   end

   scenario 'Verify Form Register New Client' do
    visit(clients_new_path)
    client_name = Faker::Name.name
    
    fill_in('post_name', with: client_name)
    fill_in('post_email', with: Faker::Internet.email)
    fill_in('post_phone', with: Faker::PhoneNumber.phone_number)
    attach_file('post_avatar', "#{Rails.root}/spec/fixtures/avatar.png")
    choose(option: ['Y', 'N'].sample)
    click_on('Save Client')

    expect(page).to have_content('Client registered successful')
    expect(Client.last.name).to eq(client_name)
   end

   scenario 'Does something' do
    visit(clients_new_path)
    click_on('Save Client')
    expect(page).to have_content("Name can't be blank")
   end

   scenario 'Show client' do
    client = Client.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ['Y', 'N'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )
    visit(clients_show_path(client.id))
    expect(page).to have_content(client.name)
   end

   scenario 'List all clients' do
    client_1 = Client.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ['Y', 'N'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )
    client_2 = Client.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ['Y', 'N'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )
    visit(clients_path)
    expect(page).to have_content(client_1.name).and have_content(client_2.name)
   end

   scenario 'Update client' do
    client = Client.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ['Y', 'N'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )
    new_name = Faker::Name.name
    visit(clients_edit_path(client.id))
    fill_in('patch_name', with: new_name)
    click_on('Save Client')

    expect(page).to have_content('Customer updated successfull')
    expect(page).to have_content(new_name)
   end

   scenario 'Click show link' do
    client = Client.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ['Y', 'N'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )
    visit(clients_path)
    find(:xpath, "/html/body/table/tbody/tr[1]/td[2]/a").click
    expect(page).to have_content("Show Client")
   end

   scenario 'Click edit link' do
    client = Client.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ['Y', 'N'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )
    visit(clients_path)
    find(:xpath, "/html/body/table/tbody/tr[1]/td[3]/a").click
    expect(page).to have_content("Edit Client")
   end

   scenario 'Destroy edit link', js: true do
    client = Client.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ['Y', 'N'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )
    visit(clients_path)
    find(:xpath, "/html/body/table/tbody/tr[1]/td[4]/a").click
    1.second
    page.driver.browser.window_handles.last
    expect(page).to have_content("Client deleted successfull")
   end
end
