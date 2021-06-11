class User < ApplicationRecord
  has_many :flashcards, :dependent => :destroy
    
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: { case_sensitive: false }
    

    before_create :check_params

    
    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
            user.email = auth.info.email
            user.name = auth.info.name
            user.password_digest = SecureRandom.hex
        end
    end

    def check_params
        self.email.downcase!
    end
end
