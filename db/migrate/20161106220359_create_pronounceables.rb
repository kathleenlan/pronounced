class CreatePronounceables < ActiveRecord::Migration[5.0]
  def change
    create_table :pronounceables do |t|
      t.string :name, null: false
      t.references :language, foreign_key: true, null: false
    end

    add_index :pronounceables, [:name, :language_id], unique: true
  end
end
