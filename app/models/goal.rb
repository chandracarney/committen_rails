class Goal < ActiveRecord::Base
  belongs_to :user
  validates :title, :description, :start_date, :end_date, presence: true
  scope :active, -> { where(completed: false) }
end
