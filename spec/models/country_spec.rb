require 'rails_helper'

RSpec.describe Country, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it { should have_many(:addresses).dependent(:destroy) }
end
