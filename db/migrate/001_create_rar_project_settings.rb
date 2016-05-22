class CreateRarProjectSettings < ActiveRecord::Migration
  def change
    create_table :rar_project_settings do |t|
      t.column :project_id, :integer
      t.column :position, :integer, :default => 0
      t.column :show, :integer, :default => 1
    end
  end
end
