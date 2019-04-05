json.extract! student, :id, :name, :matricula, :email, :password, :password_confirmation, :created_at, :updated_at
json.url student_url(student, format: :json)
