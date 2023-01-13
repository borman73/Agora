class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.references :user, null: false
      t.references :option, null: false
      t.integer :score

      t.timestamps
    end
  end
end
