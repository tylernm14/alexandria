# spec/models/book_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should belong_to(:author) }
  it { should belong_to(:publisher).without_validating_presence }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:released_on) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:isbn_10) }
  it { should validate_presence_of(:isbn_13) }

  it { should validate_length_of(:isbn_10).is_equal_to(10) }
  it { should validate_length_of(:isbn_13).is_equal_to(13) }

  it { should validate_uniqueness_of(:isbn_10) }
  it { should validate_uniqueness_of(:isbn_13) }

  it 'has a valid factory' do
    expect(build(:book)).to be_valid
  end
end
