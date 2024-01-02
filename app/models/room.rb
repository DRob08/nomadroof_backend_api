class Room < ApplicationRecord
    # Associations
    belongs_to :property
  
    # Validations (add as needed)
    validates :property_id, presence: true
    validates :bedroom_number, presence: true
    # Add other validations as needed
  
    # Enum for bed_type
    enum bed_type: {
        queen: 1,
        king: 2,
        twin: 3,
        double: 4,
        single: 5,
        bunk_bed: 6,
        sofa_bed: 7,
        futon: 8,
        day_bed: 9,
        murphy_bed: 10,
        air_mattress: 11
    }
  
    # Other model logic
  end
  