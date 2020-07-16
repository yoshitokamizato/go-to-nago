class CreateInquiries < ActiveRecord::Migration[6.0]
  def change
    create_table :inquiries do |t|
      t.integer :status ,null: false, default: 0
      t.string :name
      t.string :email
      t.string :subject
      t.string :message

      t.timestamps
    end
    add_reference :inquiries, :user, foreign_key: true 
  end
end
