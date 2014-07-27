# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140727032145) do

  create_table "components", :force => true do |t|
    t.string   "project_name"
    t.string   "project_description"
    t.string   "release_id"
    t.string   "release_version"
    t.string   "project_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "recipe_components", :force => true do |t|
    t.integer  "recipe_id"
    t.integer  "component_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.string   "source_environment_id"
    t.string   "source_environment_name"
    t.string   "created_by"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

end
