class Tiding < ActiveRecord::Base
  has_and_belongs_to_many :categories

  validates :title, :text, presence: true
end
