require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:stock) }
  it { should validate_uniqueness_of(:title) }
  it do
    should validate_numericality_of(:price).
      is_greater_than_or_equal_to(0.01)
  end

  it { should belong_to(:author) }
  it { should belong_to(:category) }
  it { should have_many(:ratings).dependent(:destroy) }
end
