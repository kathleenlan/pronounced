class CreatePronunciations < ActiveRecord::Migration[5.0]
  def up
    create_table :pronunciations do |t|
      t.references :user, foreign_key: true, null: false
      t.references :pronounceable, foreign_key: true, null: false
    end

    add_attachment :pronunciations, :audio_file
  end

  def down
    remove_attachment :pronunciations, :audio_file

    drop_table :pronunciations
  end
end
