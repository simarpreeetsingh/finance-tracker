class CreateTableFriendship < ActiveRecord::Migration[6.0]
  def change
    create_table :table_friendships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend, references: :users, null: false, foreign_key: { to_table: :users }
    end
  end
end
