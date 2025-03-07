require "faker"

10.times do
  Page.create!(
    title: Faker::Book.title,
    slug: Faker::Internet.slug(glue: '/')
  )
end
