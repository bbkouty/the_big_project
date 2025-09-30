class City < ApplicationRecord
    has_many :users, dependent: :destroy
    # validations
    validates :name, :zip_code, presence: true
end
