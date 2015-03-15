class UpdateVideos < ActiveRecord::Migration
  def change
    rename_column :videos, :desciption, :description
  end
end
