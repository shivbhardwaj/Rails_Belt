class Member < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization

  validates :user_id, :organization_id, presence: true
  # def find_member_id(current_user)
  #   Member.select(:id).where(user:current_user, organization:self)[0].id
  # end
end
