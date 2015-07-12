class CreateNewOffers < ActiveRecord::Migration
  def change
    create_table :new_offers do |t|
      t.string :name
      t.text :message
      t.integer :account_id
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.string :image_file_name
      t.string :image_file_size
      t.string :image_content_type
      t.datetime :image_updated_at
      t.string :video_content_type
      t.string :video_file_name
      t.integer :video_file_size
      t.datetime :video_updated_at
      ##ACTIVE,INACTIVE,DELAYED
      t.string :status,:default=> "INACTIVE"
      t.datetime :delay_till

      t.timestamps
    end
    add_index :new_offers, :account_id
  end
end
