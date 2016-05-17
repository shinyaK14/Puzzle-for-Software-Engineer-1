class AddSeqToUsers < ActiveRecord::Migration
  def change
    add_column :users, :seq, :integer
  end
end
