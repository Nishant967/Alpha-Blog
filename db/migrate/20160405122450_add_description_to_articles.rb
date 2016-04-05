class AddDescriptionToArticles < ActiveRecord::Migration
  def change
    #add more columns to the articles database
    add_column :articles, :description, :text
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
