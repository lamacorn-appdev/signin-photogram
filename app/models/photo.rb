# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  caption        :text
#  comments_count :integer          default(0)
#  image          :string
#  likes_count    :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#

class Photo < ApplicationRecord
  belongs_to(:owner, { :class_name => "User", :foreign_key => "owner_id" })

  has_many(:comments)

  has_many(:likes)

  has_many(:fans, { :through => :likes })
end
