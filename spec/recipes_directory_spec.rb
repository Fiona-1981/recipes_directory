# EXAMPLE

# file: spec/recipes_directory_repository_spec.rb

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes' })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do 
    reset_receipes_table
  end

  # (your tests will go here).
end


# 1
# Get all recipes

repo = RecipeRepository.new

recipe = repo.all

recipe.length # =>  2

expect(recipe[0].id).to eq '1'
expect(recipe[0].name).to eq 'Dumplings'
expect(recipe[0].cooking_time).to eq '45'
expect(recipe[0].rating).to eq '4'

expect(recipe[1].id).to eq '2'
expect(recipe[1].name).to eq 'Duck Ragu'
expect(recipe[1].cooking_time).to eq '120'
expect(recipe[1].rating).to eq '5'

# 2
# Get a single recipe

repo = RecipeRepository.new

recipe = repo.find(1)

expect(recipe.id).to eq '1'
expect(recipe.name).to eq 'Dumplings'
expect(recipe.cooking_time).to eq '45'
expect(recipe.rating).to eq '4'

# Add more examples for each method