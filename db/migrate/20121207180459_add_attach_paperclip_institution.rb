class AddAttachPaperclipInstitution < ActiveRecord::Migration
  def self.up
    add_column :document_by_institutions, :attach_file_name,    :string
    add_column :document_by_institutions, :attach_content_type, :string
    add_column :document_by_institutions, :attach_file_size,    :integer
    add_column :document_by_institutions, :attach_updated_at,   :datetime
  end
  def self.down
    remove_column :document_by_institutions, :attach_file_name
    remove_column :document_by_institutions, :attach_content_type
    remove_column :document_by_institutions, :attach_file_size
    remove_column :document_by_institutions, :attach_updated_at
  end
end
