class Exercise < ActiveRecord::Base
  has_many :ex_sets, :dependent => :destroy
  accepts_nested_attributes_for :ex_sets

  def self.MUSCLE_GROUPS
    ["Abdominals", "Arms", "Back", "Chest", "Legs", "Shoulders"]
  end

  validates :name, :muscle_group, presence: true
end
