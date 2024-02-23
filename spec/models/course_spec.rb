require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should have_many(:tutors).dependent(:destroy) }
  it { should accept_nested_attributes_for(:tutors) }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(255) }
  it { should validate_uniqueness_of(:name) }
end