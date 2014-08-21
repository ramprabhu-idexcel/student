class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :name
      t.string :description
      t.belongs_to :subject, index: true

      t.timestamps
    end
  end
end
