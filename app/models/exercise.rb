class Exercise < ActiveRecord::Base
  def self.MUSCLE_GROUPS
    ["Abdominals", "Arms", "Back", "Chest", "Legs", "Shoulders"]
  end

  validates :name, :muscle_group, presence: true
end
