class AddForeignKeyToExSets < ActiveRecord::Migration
  def change
    add_column :ex_sets, :exercise_id, :integer
  end
end
