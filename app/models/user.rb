class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: { in: 8..20}
  validates :password_confirmation, presence: true
  before_validation :remove_whitespace, :only => [:email]
  
  
  def remove_whitespace
    
    self.email = self.email.strip unless self.email.nil?
    
  end

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    p user 
    p password
   if user && user.authenticate(password)
    user
   else
   nil
   end
  end
end
