require 'rails_helper'

describe 'User sees a snack page' do
  before(:each) { @snickers = Snack.create!(name: 'snickers', price: 3.00)}
  scenario 'they see the name of the snack' do
    visit snack_path(@snickers)

    expect(page).to have_content(@snickers.name)
  end

  scenario 'they see the price of the snack' do
    visit snack_path(@snickers)

    expect(page).to have_content(@snickers.formatted_price)
  end

  scenario 'they see a list of locations for that snack' do
    don = Owner.create!(name: 'don')
    @snickers.machines.create!(owner: don, location: 'Denver')
    @snickers.machines.create!(owner: don, location: 'Atlanta')
    @snickers.machines.create!(owner: don, location: 'New York')

    visit snack_path(@snickers)

    expect(page).to have_content('Denver')
    expect(page).to have_content('Atlanta')
    expect(page).to have_content('New York')
  end
end
