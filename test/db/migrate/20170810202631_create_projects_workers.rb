class CreateProjectsWorkers < ActiveRecord::Migration[5.1]
  def change
    create_table :projects_workers do |t|
        
      t.references :project
      t.references :worker
    end
  end
end
