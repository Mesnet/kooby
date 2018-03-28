class CreateUserCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :user_companies do |t|
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.boolean :admin, default: false
      t.boolean :invitation, default: false

      t.timestamps
    end
  end
end
