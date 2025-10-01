class City < ApplicationRecord
    has_many :users, dependent: :destroy
    has_many :gossips, through: :users
    # validations
    validates :name, :zip_code, presence: true
end
