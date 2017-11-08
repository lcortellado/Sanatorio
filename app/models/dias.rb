class Dias < ApplicationRecord
    has_many :horarios
   searchkick autocomplete: ['nombre']
    def self.search(criteria)
    # do the search here base on the criteria
  end
end
