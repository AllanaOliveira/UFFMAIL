module StudentsHelper
  def translate_attribute(object = nil,method = nil)
    if object && method
      object.model.human_attribute_name(method)
    else
      "Informe os parâmetros corretamente"
    end
  end

  def choose_email(student)
    byebug
    emails = []
    nome = student.name
    5.times do |i|
      email = Faker::Internet.free_email(nome)
      email.split("@")[0] +"@uff.br"
      emails << email
    end
    return emails
  end
end
