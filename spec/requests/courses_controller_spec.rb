require 'rails_helper'
require 'spec_helper'

RSpec.describe CoursesController, type: :request do
  before(:all) do
    course = FactoryBot.create(:course)
    tutor_1 =  FactoryBot.create(:tutor, course_id: course.id)
    tutor_2 =  FactoryBot.create(:tutor, course_id: course.id)
  end

  describe 'GET(Fetch courses with tutors)' do
    it 'get List of  courses with their tutors type' do
      get '/courses'
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(200)
    end
  end

  describe 'Create( course with tutors)' do
    it 'create course with  tutors' do 
      post '/courses', params: {
        "course": {
          "name": "Mathematics",
          "description": "An introductory course to mathematics",
          "tutors_attributes": [
            {
              "name": "John Doe",
              "bio": "Experienced tutor with a passion for teaching mathematics"
            },
            {
              "name": "Jane Smith",
              "bio": "Math enthusiast and dedicated educator"
            }
          ]
        }
      }
      expect(response).to have_http_status(201)
    end
  end
end
