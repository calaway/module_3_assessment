Fabricator(:user) do
  name  { Faker::Superhero.name }
  email { Faker::Internet.email }
end
