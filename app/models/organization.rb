class Organization < ActiveRecord::Base
  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :user_members, through: :members, source: :user

  validates :name, :description, :user_id, presence: true
  validates :name, length: {minimum: 5}
  validates :description, length: {minimum: 10}

  def find_member_id(current_user)
    Member.select(:id).where(user:current_user, organization:self)[0].id
  end
end
