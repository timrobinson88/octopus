class RecipeComponent < ActiveRecord::Base
  attr_accessible :component_id, :recipe_id
  belongs_to :recipe
  belongs_to :component

  validates_uniqueness_of :component_id, :scope => :recipe_id
end
