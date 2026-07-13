class Survey < ApplicationRecord
  # Establish the one-to-many relationship with questions
  # If a survey is deleted, all its associated questions will be destroyed too
  has_many :questions, dependent: :destroy
end