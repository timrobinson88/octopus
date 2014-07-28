class Component < ActiveRecord::Base
  attr_accessible :project_description, :project_name, :release_id, :release_version
  has_many :recipe_components
  has_many :recipes, through: :recipe_components
  validates_uniqueness_of :release_version, :scope => :project_name
end
