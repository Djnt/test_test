class Rate < ApplicationRecord
  belongs_to :movie, primary_key: 'id', foreign_key: 'movie_id'
  belongs_to :user, primary_key: 'id', foreign_key: 'user_id'

  validates :value, presence:true, numericality: true
end
