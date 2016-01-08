require 'rails_helper'

feature 'user adds manufacturer', %{
  As a used cellphone salesperson
  I want to record a cellphone manufacturer
  So that I can keep track of the types of cellphones sold in my store

  Acceptance Criteria:
  - [√] I must specify a manufacturer name and country.
  - [√] If I do not specify the required information, I am presented with errors.
  - [√] If I specify the required information, the manufacturer is recorded and I am redirected to the index of manufacturers

} do

  scenario 'user successfully adds manufacturer with valid input' do
    visit new_manufacturer_path
    fill_in 'Name', with: 'Samsung'
    fill_in 'Country', with: 'South Korea'
    click_button 'Create Manufacturer'

    expect(page).to have_content('Manufacturer successfully added')
    expect(page).to have_content('Samsung')
  end

  scenario 'user enters invalid inputs for manufacturer and sees errors' do
    visit new_manufacturer_path

    fill_in 'Name', with: ''
    fill_in 'Country', with: ''
    click_button 'Create Manufacturer'

    expect(page).to have_content('Add a new manufacturer')
    expect(page).to_not have_content('Manufacturer successfully added')

    expect(page).to have_content('Name can\'t be blank')
    expect(page).to have_content('Country can\'t be blank')
  end
end
