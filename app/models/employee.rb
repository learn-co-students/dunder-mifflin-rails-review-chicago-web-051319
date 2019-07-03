class Employee < ApplicationRecord
    belongs_to :dog
    validates :title, uniqueness: {message: "is already taken. Plaease enter another."}
    validates :alias, uniqueness: {message: "is already taken. Plaease enter another."}

    def full_name
      "#{self.first_name} #{self.last_name}"
    end
end
