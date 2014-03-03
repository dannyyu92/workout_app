class ExSet < ActiveRecord::Base
  belongs_to :exercise

  validates :sets, :reps, :weight, presence: true
end
