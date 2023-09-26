class CreatePollItems < ActiveRecord::Migration[7.0]
  def change
    create_table :poll_items do |t|
      t.string :item_name, null: false
      t.references :poll, null: false, foreign_key: true
      t.timestamps
    end
  end
end
