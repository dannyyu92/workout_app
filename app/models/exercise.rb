class Exercise < ActiveRecord::Base
  has_many :ex_sets, :dependent => :destroy
  belongs_to :user

  accepts_nested_attributes_for :ex_sets
  validates :name, :muscle_group, presence: true

  def self.MUSCLE_GROUPS
    ["Abdominals", "Arms", "Back", "Chest", "Legs", "Shoulders"]
  end
end
