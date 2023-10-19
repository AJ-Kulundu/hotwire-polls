class RemoveVoteFromPollVote < ActiveRecord::Migration[7.0]
  def change
    remove_column :poll_votes, :vote, :integer
  end
end
