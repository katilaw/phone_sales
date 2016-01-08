require 'rails_helper'

feature 'user adds cell phone', %{
  As a used cellphone salesperson
  I want to record a newly acquired cellphone
  So that I can list it in my store

  Acceptance Criteria:
  - [√] I must specify the cell phone manufacturer, year and battery life (an association between the phone and an existing manufacturer should be created).
  - [√] Only years from 2003 and above can be addedd.
  - [√] I can optionally specify a description of the phone.
  - [√] If I enter all of the required information in the required formats, the phone is recorded and I am presented with a notification of success.
  - [√] If I do not specify all of the required information in the required formats, the phone is not recorded and I am presented with errors.
  - [√] Upon successfully creating a phone, I am redirected back to the index of phones.
} do

  let!(:manufacturer_1) { FactoryGirl.create(:manufacturer) }
  let!(:manufacturer_2) { FactoryGirl.create(:manufacturer) }

  scenario 'user successfully adds cell phone with valid input' do
    visit new_phone_path

    select manufacturer_2.name, from: 'Manufacturer'
    fill_in 'Year', with: '2004'
    fill_in 'Battery Life', with: '1000'
    fill_in 'Description', with: 'My very first phone'
    click_button 'Create Phone'

    expect(page).to have_content('Phone successfully added')
    expect(page).to have_content('My very first phone')
  end

  scenario 'user enters invalid inputs for cell phone and sees errors' do
    visit new_phone_path

    select manufacturer_2.name, from: 'Manufacturer'
    fill_in 'Year', with: '2000'
    fill_in 'Battery Life', with: ''
    fill_in 'Description', with: 'Super old phone'
    click_button 'Create Phone'

    expect(page).to have_content('Add a new phone')

    expect(page).to_not have_content('Phone successfully added')
    expect(page).to_not have_content('My very first phone')

    expect(page).to have_content('Year must be greater than or equal to 2003')
    expect(page).to have_content('Battery life can\'t be blank')
  end
end
