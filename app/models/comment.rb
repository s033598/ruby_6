class Comment < ApplicationRecord
  belongs_to :article #rysys - kiekvienas komentaras priklauso straipsniui
end
