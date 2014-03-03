class CreateExSets < ActiveRecord::Migration
  def change
    create_table :ex_sets do |t|
      t.integer :sets
      t.integer :reps
      t.float :weight

      t.timestamps
    end
  end
end
