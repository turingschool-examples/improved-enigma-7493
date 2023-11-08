require "rails_helper"

RSpec.describe Dish, type: :feature do
  before :each do 
    @chef1 = Studio.create(name: "Frenchie")
    @chef2 = Studio.create(name: "Baker Boy")

    @dish1 = @chef1.dishes.create(name: "Soup", description: "Soup")
    @dish2 = @chef1.dishes.create(name: "Goupy Goup", description: "Goupy Soupy Soup Goup")

    # @actor1 = Actor.create(name: "Nathan Turing", age: 31)
    # @actor2 = Actor.create(name: "Thomas Hanks", age: 69)

    # MovieActor.create(movie_id: @movie3.id, actor_id: @actor1.id)
    # MovieActor.create(movie_id: @movie1.id, actor_id: @actor1.id)
    # MovieActor.create(movie_id: @movie2.id, actor_id: @actor1.id)
    
  end
  describe "dish show page" do
    it "shows movie title, year, and genre" do
      # Story 1 of 3
      # As a visitor
      # When I visit a dish's show page
      # I see the dish’s name and description
      # And I see a list of ingredients for that dish
      # and a total calorie count for that dish
      # And I see the chef's name.
      visit "/dishes/#{@dish1.id}"
      expect(page).to have_content(@dish1.name)
      expect(page).to have_content(@dish1.description)
      expect(page).to have_content(@movie3.genre)
    end
  end
end
