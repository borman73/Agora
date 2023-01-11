class CreateUserGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :user_groups do |t|
      t.references :user
      t.references :group

      t.boolean :owner

      t.timestamps
    end
  end
end
