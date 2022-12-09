class AddUserRefToComments < ActiveRecord::Migration[7.0]
  def change
    default_user_id = Class.new(ApplicationRecord)
                            .tap { |u| u.table_name = :users }
                            .find_or_create_by(user_name: 'Default user') #neviem ci je ok vytvarat nieco ako default user
                            .id
    add_reference :comments, :user, null: false, foreign_key: true, default: default_user_id     #je spravne tuto dat null true?
    change_column_default :comments, :user_id, nil
  end
end
