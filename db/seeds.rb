require 'open-uri'

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

  10.times do
    image_name = Faker::GreekPhilosophers.name
    image = Image.new(name: image_name, orientation: rand(2))
    downloaded_image = open(Faker::LoremFlickr.image)
    image.file.attach(io: downloaded_image, filename: "#{image_name}.jpg")
    image.save!
  end

  3.times do
    article = Article.new(
      title: Faker::Movie.title,
      published_at: rand(10).days.from_now,
      description: '',
      content: Faker::Lorem.paragraph_by_chars(number: 512)
    )
    downloaded_image = open(Faker::LoremFlickr.image)
    image_name = Faker::GreekPhilosophers.name
    article.thumbnail.attach(io: downloaded_image, filename: "#{image_name}.jpg")
    article.save!
  end

  3.times do
    project = Project.new(
      name: Faker::Movie.title,
      description: Faker::Quote.matz,
      url: Faker::Internet.url
    )
    downloaded_image = open(Faker::LoremFlickr.image)
    image_name = Faker::GreekPhilosophers.name
    project.thumbnail.attach(io: downloaded_image, filename: "#{image_name}.jpg")
    project.save!
  end
end
