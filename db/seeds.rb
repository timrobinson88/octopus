require 'json'
require 'pp'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def create_seeds(file)
  string = File.read(file)
  recipe = JSON.parse(string)

  new_recipe = Recipe.new
  new_recipe.name = recipe["Name"]
  new_recipe.source_environment_name = recipe["SourceEnvironmentName"]
  new_recipe.source_environment_id = recipe["SourceEnvironmentId"]
  new_recipe.created_by = recipe["CreatedBy"]
  new_recipe.save



  ingredients = recipe["Ingredients"]

  ingredients.each {|component|
      new_component = Component.new
      new_component.project_id = component["ProjectId"]
      new_component.project_name = component["ProjectName"]
      new_component.project_description = component["ProjectDescription"]
      new_component.release_id = component["ReleaseId"]
      new_component.release_version = component["ReleaseVersion"]
      new_component.save
    }
end

Dir.foreach('db/json_seeds') do |item|
  next if item == '.' or item == '..'
  create_seeds('db/json_seeds/'+item)
end

recipe_1_components = *(1..18)
recipe_2_components = *(19..42)
recipe_3_components = *(43..66)
recipe_4_components = *(67..86)
recipe_5_components = *(87..110)
recipe_6_components = *(111..112)
recipe_7_components = *(113..132)
recipe_8_components = *(133..156)

recipe_components_mapping =[recipe_1_components,recipe_2_components,recipe_3_components,recipe_4_components,recipe_5_components,recipe_6_components,recipe_7_components,recipe_8_components]

# recipe_1_components.each {|id|
#   RecipeComponent.create({recipe_id: 1, component_id: id})
# }

recipe_components_mapping.each_with_index {|item, index|
  # puts item
  # puts index
  # puts "--------"
  item.each {|id|
    RecipeComponent.create({recipe_id: (index+1), component_id: id})
  }
}










