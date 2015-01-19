class Rating < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :user

  validates_uniqueness_of :user, scope: :merchant
end
