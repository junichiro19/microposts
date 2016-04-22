class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :cotent, presence: true, length: { maximum: 140 }
end
