class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :matricula
      t.string :email
      t.string :password
      t.string :password_confirmation

      t.timestamps
    end
  end
end
