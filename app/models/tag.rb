class Tag < ActiveRecord::Base
  has_and_belongs_to_many :tidings
  validates :title, presence: true#, uniqueness: true, length: { maximum: 20 }
end
