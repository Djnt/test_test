class Movie < ApplicationRecord
  has_many :rates, primary_key: 'id', foreign_key: 'movie_id'
  belongs_to :category, primary_key: 'id', foreign_key: 'category_id'

  validates :title, presence:true
  validates :text, presence:true

  def raiting
    rates_raw = rates
    return "0/0" if rates_raw.count == 0
    "#{rates_raw.pluck(:value).sum/rates_raw.count}/#{rates_raw.count}"
  end

  def rated_by_me
    return true unless User.current
    Rate.where(movie_id: id, user_id: User.current.id).count > 0
  end

  scope :by_category, -> (cat_id) { cat_id ? where(category_id: cat_id) : all }
end
