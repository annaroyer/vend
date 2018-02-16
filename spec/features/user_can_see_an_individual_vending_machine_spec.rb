require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    dons.snacks.create(name: 'snickers', price: 2.50)
    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they see the names of all the snacks associated with that machine and their price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    dons.snacks.create(name: 'snickers', price: 2.50)
    visit machine_path(dons)

    expect(page).to have_content('snickers')
    expect(page).to have_content('$2.50')
  end

  scenario 'they see the average price for all snacks in the machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    dons.snacks.create(name: 'snickers', price: 2.50)
    dons.snacks.create!(name: 'chips', price: 1.50)
    dons.snacks.create!(name: 'candy', price: 1.00)
    visit machine_path(dons)

    expect(page).to have_content('Average Snack Price: $1.67')
  end
end
