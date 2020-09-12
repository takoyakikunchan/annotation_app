class Song < ApplicationRecord
  validates :name, :text, :image, :genre_id, presence: true
  validates :genre_id, numericality: { other_than: 1 } 
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
end
