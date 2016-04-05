class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      #add column to the table
      t.string :title

    end
  end
end
