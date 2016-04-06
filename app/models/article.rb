class Article < ActiveRecord::Base

  #code of simple validation of tables field
  validates :title, presence: true, length: {minimum: 3, maximum: 20}
  validates :description, presence: true, length: {minimum: 10, maximum: 500}

end
