FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author
  end

  factory :author do
    author_name {Faker::Book.author}

    factory :author_with_books do
      books { [association(:book)] }
    end
  end
end

