class AddViewCountToPronounceables < ActiveRecord::Migration[5.0]
  def change
    add_column :pronounceables, :view_count, :integer, default: 0
  end
end
