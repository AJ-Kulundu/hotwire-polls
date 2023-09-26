class Poll < ApplicationRecord
  belongs_to :user
  has_many :poll_items, dependent: :destroy
  accepts_nested_attributes_for :poll_items, allow_destroy: true, reject_if: :all_blank

  validates :name, presence: true, uniqueness: true,length: {minimum:3, maximum: 50}
  validates :user, presence: true

end
