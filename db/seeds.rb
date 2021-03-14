# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin_roles_array = ["Restaurant Chef", "Department Head", "Assistant Manager", "Sous-Chef", "Executive Chef"]
menu_array = ["Breakfast", "Restaurant Lunch", "Lounge Lunch", "Restaurant Dinner", "Lounge Dinner", "Banquets Buffet", "Valentine's Day Special", "Cocktail Party"]
kitchen_roles_array = ["Prep Cook", "Line Cook", "Chef de Partie", "Short Order Cook"]
service_roles_array = ["Food Runner", "Server", "Host", "Barback", "Bartender"]
department_array = ["Banquets", "Lounge", "Restaurant"]
User.destroy_all()
Department.destroy_all()
Role.destroy_all()
Quiz.destroy_all()
Question.destroy_all()
Option.destroy_all()
Answer.destroy_all()
Result.destroy_all()
QuizAssignment.destroy_all()
PASSWORD = "123"

department_array.map do |department|
  d = Department.create(
    name: department,
  )
  if d.save!
    admin_roles_array.map do |role|
      admin_role = Role.create(
        name: "#{d.name} #{role}",
        department_id: d.id,
      )
      if admin_role.save!
        first_name = Faker::Name.first_name
        last_name = Faker::Name.last_name
        User.create(
          first_name: first_name,
          last_name: last_name,
          email: "#{first_name}.#{last_name}@gmail.com",
          password: PASSWORD,
          role_id: admin_role.id,
          is_admin: true,
        )
      end
    end
    kitchen_roles_array.map do |role|
      kitchen_role = Role.create(
        name: "#{d.name} #{role}",
        department_id: d.id,
      )

      if kitchen_role.save!
        rand(3..5).times.map do
          first_name = Faker::Name.first_name
          last_name = Faker::Name.last_name
          User.create(
            first_name: first_name,
            last_name: last_name,
            email: "#{first_name}.#{last_name}@gmail.com",
            password: PASSWORD,
            role_id: kitchen_role.id,
          )
        end
      end
    end
    service_roles_array.map do |role|
      service_role = Role.create(
        name: "#{d.name} #{role}",
        department_id: d.id,
      )

      if service_role.save!
        rand(5..8).times.map do
          first_name = Faker::Name.first_name
          last_name = Faker::Name.last_name
          User.create(
            first_name: first_name,
            last_name: last_name,
            email: "#{first_name}.#{last_name}@gmail.com",
            password: PASSWORD,
            role_id: service_role.id,
          )
        end
      end
    end
  end
end

test_user = User.create(
  first_name: "Stas",
  last_name: "Anikin",
  email: "stas@stas.com",
  password: PASSWORD,
  is_admin: false,
  role_id: 1,

)
admin = User.create(
  first_name: "admin",
  last_name: "admin",
  email: "admin@admin.com",
  password: PASSWORD,
  is_admin: true,
  role_id: 1,
)
departments = Department.all
roles = Role.all
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}.#{last_name}@gmail.com",
    password: PASSWORD,
    role_id: roles.sample,
  )
end
users = User.all
number_of_questions = rand(10..15)

menu_array.map do |menu|
  number_of_options = 4

  z = Quiz.create(
    name: menu,
    user_id: users.sample.id,
    number_of_questions: number_of_questions,
    correct_answers_to_pass: rand(7..9),
  )
  if z.save!
    3.times do
      qa = QuizAssignment.create(
        quiz_id: z.id,
        role_id: roles.sample.id,
      )
    end

    z.number_of_questions.times.map do
      answered_questions_array = []
      z.questions.each do |question|
        answered_questions_array << question.id
      end

      r = Result.create(
        user_id: users.sample.id,
        quiz_id: z.id,
        number_of_questions: number_of_questions,
        number_of_correct_answers: rand(6..10),
        attempted_questions: answered_questions_array,

      )
      q = Question.create(
        name: Faker::Food.dish,
        quiz_id: z.id,
        number_of_options: number_of_options,
      )
      if q.save!
        4.times.map do
          o = Option.create(
            name: Faker::Food.ingredient,
            question_id: q.id,
            is_correct: false,
          )
        end
        q.options[rand(0..3)].update(is_correct: true)
      end
    end
  end
end
questions = Question.all
number_of_questions.times do
  q = questions.sample
  option = q.options[rand(0..3)]
  a = Answer.create(
    question_id: q.id,
    option_id: option.id,
    is_correct: option.is_correct,
  )
end
quizzes = Quiz.all

quizzes = Quiz.all
results = Result.all
options = Option.all
quiz_assignments = Quiz.all
answers = Answer.all
puts "Generated #{users.count} users, #{quiz_assignments.count} quiz assignments, #{departments.count} departments, #{roles.count} roles, #{quizzes.count} quizzes, #{options.count} options, #{questions.count} questions, #{answers.count} answers, #{results.count} results"
