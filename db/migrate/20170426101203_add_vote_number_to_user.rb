class AddVoteNumberToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :vote_number, :integer, default: 0
  end
end
