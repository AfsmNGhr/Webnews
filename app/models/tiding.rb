class Tiding < ActiveRecord::Base
  attachment :image, content_type: ["image/jpeg", "image/png", "image/gif"]
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :tags
  validates :title, :text, :preview, presence: true
end
