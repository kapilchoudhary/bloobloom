class Frame < ApplicationRecord
    has_many :glasses
    enum status: {
        active: 0,
        inactive: 1
    }
end
