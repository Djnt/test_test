class Category < ApplicationRecord
  has_many :movies, primary_key: 'id', foreign_key: 'category_id'

  validates :name, presence:true
end
