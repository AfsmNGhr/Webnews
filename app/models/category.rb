class Category < ActiveRecord::Base
  belongs_to :tidings

  validates :title, uniqueness: true
  validates :title, :tidings_ids, presence: true
end
