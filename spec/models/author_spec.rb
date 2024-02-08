
require 'rails_helper'

RSpec.describe Author, type: :model do
  context 'with valid attributes' do
    it 'is valid' do
      author = build (:author)
      expect(author).to be_valid
    end
  end

  context 'Validation tests' do
    it 'is not valid without a name' do
      author = build(:author, author_name: nil)
      expect(author).not_to be_valid
    end
  end

end