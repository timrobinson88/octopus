class RecipeComponent < ActiveRecord::Base
  attr_accessible :component_id, :recipe_id
  belongs_to :recipe
  belongs_to :component
end
