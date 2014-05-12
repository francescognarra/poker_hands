class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.references :suit
      t.string :value
      t.integer :rank

      t.timestamps
    end
    add_index :cards, :suit_id
  end
end
