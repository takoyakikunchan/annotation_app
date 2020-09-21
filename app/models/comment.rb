class Comment < ApplicationRecord
  belongs_to :song
  belongs_to :user 
  has_many :favorites, dependent: :destroy
  validates :text, presence: true
end
