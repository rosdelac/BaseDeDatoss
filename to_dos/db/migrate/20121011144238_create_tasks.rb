class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task
      t.integer :index
      t.boolean :status
      # Completa con las columnas que necesites
    end
  end
end
