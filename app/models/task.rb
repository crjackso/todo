class Task
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  
  field :user_id
  field :description
  field :date_to_be_completed, type: Date
  field :date_completed, type: Date
  
  embedded_in :user, :inverse_of => :tasks
  
  validates :date_to_be_completed, presence: true
  validates :description, presence: true, length: {maximum: 250}
end
