class Place < ApplicationRecord
  validates :name,:description,:latitude,:longitude,:city,:state,:country, presence: true
  has_many :images, as: :imageable
  # -----------------------------------------------------------------
  # agar hum nay images k attributes ko accept krwana hay parent place may
          # accepts_nested_attributes_for :images    
  # -----------------------------------------------------------------

  # agar ap nay child model per validation lgani hay agr koi elemnt na ho to rok do creation

  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['url'].blank? }

  
end
