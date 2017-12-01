class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.date :signature_date
      t.string :signature
      t.integer :home_id

      t.timestamps

    end
  end
end
