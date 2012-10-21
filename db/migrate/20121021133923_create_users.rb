class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.timestamp :last_login_time
      t.boolean :invalid

      t.timestamps
    end
  end
end
