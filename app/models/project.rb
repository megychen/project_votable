class Project < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :project_relationships
end
