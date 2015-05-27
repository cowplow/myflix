Fabricator(:video) do
  description { Faker::Lorem.paragraph }
  title { Faker::Lorem.words(5).join(" ") }
end