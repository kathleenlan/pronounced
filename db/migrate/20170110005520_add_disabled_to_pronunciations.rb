class AddDisabledToPronunciations < ActiveRecord::Migration[5.0]
  def change
    add_column :pronunciations, :disabled, :boolean, default: false
  end
end
