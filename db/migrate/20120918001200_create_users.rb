class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email
      t.string :name
      t.date :born
      t.string :password

      t.timestamps
    end
  end
end
