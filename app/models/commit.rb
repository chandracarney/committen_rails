class Commit < ActiveRecord::Base
  belongs_to :user
  validates :date, :url, presence: true

end
