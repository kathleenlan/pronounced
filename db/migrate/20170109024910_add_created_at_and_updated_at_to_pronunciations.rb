class AddCreatedAtAndUpdatedAtToPronunciations < ActiveRecord::Migration[5.0]
  def change
    add_column :pronunciations, :created_at, :datetime
    add_column :pronunciations, :updated_at, :datetime
  end
end
