class Address < ApplicationRecord
  belongs_to :student, optional: true
end