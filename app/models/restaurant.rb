class Restaurant < ApplicationRecord
  has_many :reviews,  dependent: :destroy
  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]

  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }

  def total_rating
    ratings = reviews.map { |review| review.rating }
    reviews.empty? ? 0 : ratings.sum / ratings.size
  end
end
