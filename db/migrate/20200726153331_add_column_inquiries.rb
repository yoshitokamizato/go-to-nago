class AddColumnInquiries < ActiveRecord::Migration[6.0]
  def change
    add_column :inquiries, :kind, :integer
    add_column :inquiries, :admin_comment, :string
    add_reference :inquiries, :facility, foreign_key: true
    add_index :inquiries, :kind
    add_index :inquiries, :status
  end
end
