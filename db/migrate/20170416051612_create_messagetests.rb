class CreateMessagetests < ActiveRecord::Migration[5.0]
  def change
    create_table :messagetests do |t|
      t.string :content

      t.timestamps
    end
  end
end
