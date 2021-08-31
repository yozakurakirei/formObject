class AuthorBooks

  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment

  attr_accessor :name, :birth_place, :birth_date, :title, :price, :publish_date

  with_options presence: true do
    validates :name
    validates :birth_place
    validates :birth_date
    validates :title
    validates :price
    validates :publish_date
  end

  validates :price, numericality: { greater_than_or_equal_to: 1, 
                                    less_than_equal_to: 1000000, 
                                    message: "これは設定外になります。" }

  def save
    ActiveRecord::Base.transaction do
      author = Author.create(name: name, birth_place: birth_place, birth_date: birth_date)
      Book.create(title: title, price: price, publish_date: publish_date, author_id: author.id)
    end
  end
end