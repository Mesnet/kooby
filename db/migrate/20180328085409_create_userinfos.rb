class CreateUserinfos < ActiveRecord::Migration[5.1]
  def change
    create_table :userinfos do |t|
      t.string :name
      t.string :surname
      t.string :pseudo
      t.string :phone
      
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
