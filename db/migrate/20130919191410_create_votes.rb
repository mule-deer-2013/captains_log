class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :up_down
      t.integer :votable_id
      t.string :votable_type
      t.belongs_to :user

      t.timestamps
    end
  end
end
