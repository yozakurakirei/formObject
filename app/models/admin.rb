class Admin < ApplicationRecord
  belongs_to :company, dependent: :destroy
  belongs_to :staff, dependent: :destroy
end
