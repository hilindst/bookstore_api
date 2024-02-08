require 'rails_helper'

RSpec.describe 'Authors API', type: :request do
  describe 'POST /authors' do
    let(:valid_attributes) { { author_name: 'Robert Heinlein' } }

    context 'when the request is valid' do\
      before { post '/authors', params: { author: valid_attributes } }

      it 'creates a new author' do
        expect {
          post '/authors', params: { author: valid_attributes }
        }.to change(Author, :count).by(1)
      end  

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
  
      it 'returns the created author' do
        expect(json['author_name']).to eq('Robert Heinlein')
      end
  
      it 'saves the author with the correct attributes' do
        author = Author.last
        expect(author.author_name).to eq('Robert Heinlein')
        
      end
    end
  end
    describe 'GET /authors' do
      let!(:authors) { create_list(:author_with_books, 10) } # creating 10 authors using Factory Bot
  
      before { get '/authors' }
  
      it 'returns authors' do
        expect(response).to have_http_status(200)
        expect(json).not_to be_empty
        expect(json.size).to eq(14)
      end
  
      it 'returns authors with the correct structure' do
        # Assuming each author has 'author_name' 
        json.each do |author|
          expect(author).to include('author_name')
        end
      end
    end
  
  def json
    JSON.parse(response.body)
  end
end