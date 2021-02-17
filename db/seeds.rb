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
PASSWORD = "123"
test_user = User.create(
  first_name: "Stas",
  last_name: "Anikin",
  email: "stas@stas.com",
  password: PASSWORD,
  is_admin: false,
)
admin = User.create(
  first_name: "admin",
  last_name: "admin",
  email: "admin@admin.com",
  password: PASSWORD,
  is_admin: true,
)
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}.#{last_name}@gmail.com",
    password: PASSWORD,
  )
end
users = User.all

10.times do
  d = Department.create(
    name: Faker::Job.field,
  )
  if d.save!
    rand(1..3).times.map do
      r = Role.create(
        name: Faker::Job.position,
      )
      DepartmentRolesAssignment.create(
        role_id: r.id,
        department_id: d.id,
      )
      if r.save!
        UserRolesAssignment.create(
          user_id: users.sample,
          role_id: r.id,
        )
      end
    end
  end
end
departments = Department.all
roles = Role.all
puts "Generated #{users.count} users, #{departments.count} departments, #{roles.count} roles"
