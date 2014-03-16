class Exercise < ActiveRecord::Base
  has_many :ex_sets, :dependent => :destroy
  accepts_nested_attributes_for :ex_sets
  validates :name, :muscle_group, presence: true

  def self.MUSCLE_GROUPS
    ["Abdominals", "Arms", "Back", "Chest", "Legs", "Shoulders"]
  end

  def self.build_exercise(params)
    exercise = Exerise.new(params)
  end
end
