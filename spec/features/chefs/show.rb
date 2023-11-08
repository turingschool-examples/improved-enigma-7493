require "rails_helper"

RSpec.describe "Chef's Show Page" do 
  it "has a link to view all the ingredients the chef uses" do 
    @mario = Chef.create!({name: "Mario"})
    
    @lasagna = Dish.create!({name: "Lasagna", description: "Chef's favorite", chef_id: @mario.id })
    
    @salt = Ingredient.create!({name: "Salt", calories: 200})
    @pepper = Ingredient.create!({name: "Pepper", calories: 25})
    @oregano = Ingredient.create!({name: "Oregano", calories: 75})

    expect(page).to have_content("Pepper")
    expect(page).to have_content("Salt")
    expect(page).to have_content("Oregano")
  end
  
end 