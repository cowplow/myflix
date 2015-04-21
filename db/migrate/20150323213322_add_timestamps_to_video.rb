class AddTimestampsToVideo < ActiveRecord::Migration
  def change
    change_table(:videos) { |t| t.timestamps }
  end
end
