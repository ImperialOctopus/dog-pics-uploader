class RemoveEmailFromSubmissions < ActiveRecord::Migration[6.1]
  def change
    remove_column :submissions, :email, :string
  end
end
