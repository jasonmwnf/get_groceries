class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, :description
      t.timestamps
    end
  end
end
