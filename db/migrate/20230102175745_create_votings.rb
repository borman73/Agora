class CreateVotings < ActiveRecord::Migration[7.0]
  def change
    create_table :votings do |t|
      t.string :name
      t.bigint :author_id
      t.text :description
      t.string :type
      t.boolean :active
      t.date :start_date
      t.date :stop_date
      t.integer :quorum

      t.references :group

      t.timestamps
    end
  end
end
