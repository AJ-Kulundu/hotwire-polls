class Poll < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: true,length: {minimum:3, maximum: 50}
  validates :user, presence: true

end
