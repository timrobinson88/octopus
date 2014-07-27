class Recipe < ActiveRecord::Base
  attr_accessible :created_by, :name, :source_environment_id, :source_environment_name
  has_many :recipe_components
  has_many :components, through: :recipe_components
end
