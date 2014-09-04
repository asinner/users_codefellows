class User < ActiveRecord::Base
  
  # Validations
  validates :first_name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  
  def fullname
    "#{self.first_name} #{self.last_name}".strip
  end
end
