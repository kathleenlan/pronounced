class CreateLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      t.string :name, null: false
    end

    add_index :languages, :name, unique: true
  end
end
