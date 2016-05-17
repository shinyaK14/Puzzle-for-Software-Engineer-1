class CreateMailers < ActiveRecord::Migration
  def change
    create_table :mailers do |t|
      t.string :address

      t.timestamps null: false
    end
  end
end
