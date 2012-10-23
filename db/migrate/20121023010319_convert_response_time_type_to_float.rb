class ConvertResponseTimeTypeToFloat < ActiveRecord::Migration
  def up
    rename_column :results, :response_time, :response_time_old
    add_column :results, :response_time, :float
  end

  def down
    rename_column :results, :response_time, :response_time_old
    add_column :results, :response_time, :integer
  end
end
