class AddArchivedToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :archived, :boolean, :default => false
  end
end
