class CreatePollVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :poll_votes do |t|
      t.integer :vote
      t.references :user, null: false, foreign_key: true
      t.references :poll_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
