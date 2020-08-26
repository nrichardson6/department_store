class Department < ApplicationRecord
  has_many :items, dependents: :destroy
end
