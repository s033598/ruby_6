class Article < ApplicationRecord
  has_many :comments, dependent: :destroy #rysys - straipsnis gali turet daug komentaru
  validates :title, presence: true,
                    length: { minimum: 5 } #validacija - straipsnio pavadinimas turi egzistuot ir but bent 5 char ilgumo
end