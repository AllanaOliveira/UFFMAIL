namespace :dev do
  DEFAULT_PASSWORD = 123456
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    #só no modo de desenvolvimento
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      show_spinner("Cadastrando o aluno padrão...") { %x(rails dev:add_default_student) }
      show_spinner("Cadastrando alunos extras...") { %x(rails dev:add_extra_student) }

    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Adiciona o aluno padrão"
  task add_default_student: :environment do
    Student.create!(
        matricula: '215031119',
        name: 'Allana',
        email: 'allana@uff.br',
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
    )
  end

  # nova task
  desc "Adiciona outros alunos extras"
  task add_extra_student: :environment do
    10.times do |i|
      nome = Faker::Name.name
      Student.create!(
          matricula: Faker::Number.number(9),
          name: nome,
          email: Faker::Internet.free_email(nome),
          password: DEFAULT_PASSWORD,
          password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin # Automatic animation with default interval
    yield
    spinner.success("(#{msg_end})")
  end
end