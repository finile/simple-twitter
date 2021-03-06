class Followship < ApplicationRecord
  validates :following_id, uniqueness: { scope: :user_id }
  validate :check_self_following
  belongs_to :user, counter_cache: :followings_count 
  belongs_to :following, class_name: "User", counter_cache: :followers_count

  def check_self_following
    if user_id == following_id
      errors[:following_id]<<"can't follow yourself"
    end
  end

end
