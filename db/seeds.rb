# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all()
Department.destroy_all()
Role.destroy_all()
Quiz.destroy_all()
Question.destroy_all()
Answer.destroy_all()
PASSWORD = "123"

10.times do
  d = Department.create(
    name: Faker::Job.field,
  )
  if d.save!
    rand(1..3).times.map do
      r = Role.create(
        name: Faker::Job.position,
        department_id: d.id,
      )
      if r.save!
        rand(3..5).times.map do
          first_name = Faker::Name.first_name
          last_name = Faker::Name.last_name
          User.create(
            first_name: first_name,
            last_name: last_name,
            email: "#{first_name}.#{last_name}@gmail.com",
            password: PASSWORD,
            role_id: r.id,
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
5.times do
  z = Quiz.create(
    name: Faker::Restaurant.type,
    user_id: rand(1..10),
  )
  if z.save!
    rand(10..15).times.map do
      q = Question.create(
        name: Faker::Food.dish,
        quiz_id: z.id,
      )

      if q.save!
        rand(3..5).times.map do
          Answer.create(
            name: Faker::Food.ingredient,
            question_id: q.id,

          )
        end
      end
    end
  end
end
quizzes = Quiz.all
questions = Question.all
answers = Answer.all
puts "Generated #{users.count} users, #{departments.count} departments, #{roles.count} roles, #{quizzes.count} quizzes, #{questions.count} questions, #{answers.count} answers"
