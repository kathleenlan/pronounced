class AddUniquenessConstraintForPronunciationsOnUserIdAndPronounceableId < ActiveRecord::Migration[5.0]
  def change
    add_index :pronunciations, [:user_id, :pronounceable_id], unique: true
  end
end
