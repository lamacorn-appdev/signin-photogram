# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  comments_count         :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  likes_count            :integer
#  private                :boolean
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many(:own_photos, { :class_name => "Photo", :foreign_key => "owner_id" })

  has_many(:likes, { :class_name => "Like", :foreign_key => "fan_id" })

  has_many(:liked_photos, -> { distinct }, { :through => :likes, :source => :photo })

  has_many(:sent_follow_requests, { :class_name => "FollowRequest", :foreign_key => "sender_id" })

  has_many(:accepted_sent_follow_requests, -> { where({ :status => "accepted" }) }, { :class_name => "FollowRequest", :foreign_key => "sender_id" })

  has_many(:received_follow_requests, { :class_name => "FollowRequest", :foreign_key => "recipient_id" })

  has_many(:accepted_received_follow_requests, -> { where({ :status => "accepted" }) }, { :class_name => "FollowRequest", :foreign_key => "recipient_id" })

  has_many(:followers, { :through => :accepted_received_follow_requests, :source => :sender })

  has_many(:following, { :through => :accepted_sent_follow_requests, :source => :recipient })

  has_many(:feed, { :through => :following, :source => :own_photos })

  has_many(:discover, -> { distinct }, { :through => :following, :source => :liked_photos })
end
