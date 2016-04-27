class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # add column to table
      t.string :username
      t.string :email
      t.timestamps
    end
  end
end
