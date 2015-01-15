class Tiding < ActiveRecord::Base
  has_many :categories

  validates :title, :text, :preview, presence: true
end
