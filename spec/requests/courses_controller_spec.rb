require 'rails_helper'
require 'spec_helper'

RSpec.describe CoursesController, type: :request do
  before(:all) do
    @course = FactoryBot.create(:course)
    @tutors = FactoryBot.create(:tutor, course: @course)
  end

  describe 'GET /courses (Fetch courses with tutors)' do
    it 'returns a list of courses with their tutors' do
      get '/courses'
      expect(response).to have_http_status(200)
      json_response = JSON.parse(response.body)
    end
  end

  describe 'POST /courses (Create course with tutors)' do
    let(:valid_course_params) do
      {
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
    end

    it 'creates a course with tutors with correct params' do 
      post_invalid_course(valid_course_params)
      expect(response).to have_http_status(201)
    end

    context 'when params are invalid' do
      it 'does not create a course if course name is not present' do 
        invalid_params = valid_course_params.deep_merge("course": { "name": "" })
        post_invalid_course(invalid_params)
        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)['course']['name'][0]).to eq("can't be blank")
      end

      it 'does not create a course if tutor name is not present' do 
        invalid_params = valid_course_params.deep_merge("course": { "tutors_attributes": [{ "name": "" }] })
        post_invalid_course(invalid_params)
        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)['course']['tutors.name'][0]).to eq("can't be blank")
      end

      it 'does not create a course if tutor bio is not present' do 
        invalid_params = valid_course_params.deep_merge("course": { "tutors_attributes": [{ "bio": "" }] })
        post_invalid_course(invalid_params)
        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)['course']['tutors.bio'][0]).to eq("can't be blank")
      end
    end
  end

  private

  def post_invalid_course(params)
    post '/courses', params: params
  end

end
