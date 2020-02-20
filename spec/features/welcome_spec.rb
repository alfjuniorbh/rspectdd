require 'rails_helper'

feature "Welcome", type: :feature do
  scenario 'Show welcome message' do
   visit(root_path)
   expect(page).to have_content('Welcome')
  end

  scenario 'Verify link Create new Client' do
    visit(root_path)
    expect(find('ul li')).to have_link('Create new Client')
  end
end
