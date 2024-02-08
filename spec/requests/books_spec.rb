require 'rails_helper'

RSpec.describe 'Books API', type: :request do
  describe 'POST /books' do
    let(:valid_attributes) { { title: 'Farnham\'s Freehold', author_id:56} }

    context 'when the request is valid' do
      before { post '/books', params: { book: valid_attributes } }

      it 'creates a new book' do
        expect {
          post '/books', params: { book: valid_attributes }
        }.to change(Book, :count).by(1)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
  
      it 'returns the created book' do
        expect(json['title']).to eq('Farnham\'s Freehold')
        expect(json['author_id']).to eq(56)
      end
  
      it 'saves the book with the correct attributes' do
        book = Book.last
        expect(book.title).to eq('Farnham\'s Freehold')
        expect(book.author_id).to eq(56)
      end
    end
  end
    describe 'GET /books' do
      let!(:books) { create_list(:author_with_books, 10) } # creating 10 books using Factory Bot
      
      before { get '/books' }
      
      it 'returns books' do
        expect(response).to have_http_status(200)
        expect(json).not_to be_empty
        expect(json.size).to eq(14)
      end
      
        it 'returns books with the correct structure' do
         # Assuming each book has 'title' and 'author id'
          json.each do |book|
          expect(book).to include('title', 'author_id')
          end
        end
      end

  def json
    JSON.parse(response.body)
  end
end