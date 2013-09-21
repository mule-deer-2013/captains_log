class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :up, default: false
      t.boolean :down, default: false
      t.integer :votable_id
      t.string :votable_type
      t.belongs_to :user

      t.timestamps
    end
    add_index :votes, [:votable_type, :votable_id]
  end
end
