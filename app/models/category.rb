class Category < ActiveRecord::Base
  has_and_belongs_to_many :tidings
  # validates :title, uniqueness: true, length: { maximum: 20 }
  validates :title, :text, presence: true
end
