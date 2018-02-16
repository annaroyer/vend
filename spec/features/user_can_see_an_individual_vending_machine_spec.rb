require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  before(:each) do
    @owner = Owner.create(name: "Sam's Snacks")
    @dons  = @owner.machines.create(location: "Don's Mixed Drinks")
    @snack = Snack.create(name: 'snickers')
  end
  scenario 'they see the location of that machine' do

    visit machine_path(@dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they see the names of all the snacks associated with that machine and their price' do
    
  end
end
