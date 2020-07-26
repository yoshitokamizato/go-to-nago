class AddColumnInquiries < ActiveRecord::Migration[6.0]
  def change
    add_column :inquiries, :type, :integer
    add_column :inquiries, :admin_comment, :string
    add_reference :inquiries, :facility, foreign_key: true
    add_index :inquiries, :type
    add_index :inquiries, :status
  end
end
