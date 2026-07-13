class Question < ApplicationRecord
  # Each question belongs to a single survey campaign
  belongs_to :survey
  
  # Establish the one-to-many relationship with answers
  # If a question is permanently deleted, clean up its answers from the database too
  has_many :answers, dependent: :destroy
end