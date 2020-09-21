class Favorite < ApplicationRecord
  belongs_to :user 
  belongs_to :comment

  #一人のユーザーは一回のイイネまで
  validates_uniquness_of :comment_id, scope: :user_id
end
