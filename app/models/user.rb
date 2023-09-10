class User < ApplicationRecord

  enum gender: { male: 'male', female: 'female' }, _prefix: true
  enum role: { admin: 'admin', gamer: 'gamer' }, _prefix: true
  
  validates_uniqueness_of :full_name, :mobile_number, :email

  validates :gender, inclusion: { in: User.genders.keys }
  validates :role, inclusion: { in: User.roles.keys }, if: Proc.new { self.role.present? }

  validates_presence_of :full_name, :mobile_number, :country_code,
                        :email, :gender, :date_of_birth,
                        :message => "%{value} cannot be blank"
                        
  validates :email, format: URI::MailTo::EMAIL_REGEXP

  validates :mobile_number, :numericality => true, :length => { :minimum => 10, :maximum => 15 }

end
