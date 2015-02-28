class User < ActiveRecord::Base
  has_many :goals, :commits

end
