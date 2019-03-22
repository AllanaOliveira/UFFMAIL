class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :matricula
      t.string :password
      t.string :password_confirmation
    end
  end
end
