class User
  include Mongoid::Document
  field :email
  field :display_name
  field :remember_token
  field :password_digest
  
  embeds_many :tasks
  accepts_nested_attributes_for :tasks
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, 
    presence: true, 
    uniqueness: {case_sensitive: false},
    format: {with: VALID_EMAIL_REGEX}
  
  validates :display_name, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
