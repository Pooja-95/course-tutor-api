require 'rails_helper'

RSpec.describe Tutor, type: :model do
  it { should belong_to(:course) }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(255) }
  it { should validate_presence_of(:bio) }
end