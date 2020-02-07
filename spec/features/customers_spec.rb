require 'rails_helper'

RSpec.feature "Customers", type: :feature, js: true do
 it 'Visit customer index page' do
  visit(customers_path)
  page.save_screenshot('screenshot_customer_index.png')
  expect(page).to have_current_path(customers_path)
 end
end
