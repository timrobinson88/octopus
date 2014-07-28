require 'json'
require 'pp'

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
      if Component.find_by_release_id(component["ReleaseId"])
        existing_component = Component.find_by_release_id(component["ReleaseId"])
        RecipeComponent.create({recipe_id: ($counter), component_id: (existing_component.id)})

      else

      new_component = Component.new
      new_component.project_id = component["ProjectId"]
      new_component.project_name = component["ProjectName"]
      new_component.project_description = component["ProjectDescription"]
      new_component.release_id = component["ReleaseId"]
      new_component.release_version = component["ReleaseVersion"]
      new_component.save

       RecipeComponent.create({recipe_id: ($counter), component_id: (new_component.id)})
     end
    }
end
$counter = 1
Dir.foreach('db/json_seeds') do |item|
  next if item == '.' or item == '..'
  create_seeds('db/json_seeds/'+item)
  $counter += 1
end

# recipe_1_components = *(1..18)
# recipe_2_components = *(19..42)
# recipe_3_components = *(43..66)
# recipe_4_components = *(67..86)
# recipe_5_components = *(87..110)
# recipe_6_components = *(111..112)
# recipe_7_components = *(113..132)
# recipe_8_components = *(133..156)

# recipe_components_mapping =[recipe_1_components,recipe_2_components,recipe_3_components,recipe_4_components,recipe_5_components,recipe_6_components,recipe_7_components,recipe_8_components]


# recipe_components_mapping.each_with_index {|item, index|

#   item.each {|id|
#     RecipeComponent.create({recipe_id: (index+1), component_id: id})
#   }
# }










