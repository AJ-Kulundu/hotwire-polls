class PollItem < ApplicationRecord
    belongs_to :poll
    has_many :poll_votes, dependent: :destroy
    has_many :users, through: :poll_votes
end
