require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'with valid attributes' do
    it 'is valid' do
      book = build(:book)
      expect(book).to be_valid
    end
  end

  context 'Validation tests' do
    it 'is not valid without a title' do
      book = build(:book, title: nil)
      expect(book).not_to be_valid
    end
  end

    it 'is not valid without an author' do
      book = build(:book, author_id: nil)
      expect(book).not_to be_valid
    end
  end

end