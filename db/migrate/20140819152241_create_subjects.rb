class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :description
      t.string :author

      t.timestamps
    end
  end
end
