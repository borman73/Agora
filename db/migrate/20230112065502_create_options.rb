class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.string :value
      t.references :voting

      t.timestamps
    end
  end
end
