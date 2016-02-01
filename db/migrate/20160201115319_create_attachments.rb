class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.attachment :image
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
