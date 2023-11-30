class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.text :event_title
      t.text :event_description
      t.text :comment
      t.timestamps
    end
  end
end
