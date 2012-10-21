class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :url
      t.timestamp :time
      t.integer :response_time
      t.integer :code
      t.integer :data_size

      t.timestamps
    end
  end
end
