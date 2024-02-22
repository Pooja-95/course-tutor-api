# db/seeds.rb

course_data = [
  { name: 'Introduction to Ruby Programming', description: 'Learn the basics of Ruby programming language.' },
  { name: 'Web Development with Ruby on Rails', description: 'Master web development using Ruby on Rails framework.' },
  { name: 'Full Stack Developer', description: 'Participating in the design and creation of scalable software.' }
]

course_data.each do |course_info|
  # Create the course
  course = Course.new(name: course_info[:name], description: course_info[:description])

  # Create tutors for the course
  tutors = []
  2.times do
    tutors << { name: Faker::Name.name, bio: Faker::Lorem.paragraph(sentence_count: 2) }
  end

  course.transaction do
    course.save!
    course.tutors.create!(tutors)
  end
end
