class AdminUser < ApplicationRecord

    # self.table_name = "admin_users"
    has_secure_password

    has_and_belongs_to_many :pages

    has_many :section_edits
    has_many :sections, :through => :section_edits

    scope :visible, lambda { where :visible => true}
    scope :invisible, lambda {where :visible => false}
    scope :sorted, lambda {order("position ASC")}
    scope :newest_first, lambda { order("created_at DESC")} #newest first
    scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

    EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    FORBIDDEN_USERNAMES = ['littlebopeep', 'humptydumpty', 'marymary']
    #long form validations
    #validates_presence_of :first_name
    #validates_length_of :first_name, :maximum => 25
    #validates_presence_of :last_name
    #validates_length_of :last_name, :maximum => 50
    #validates_presence_of :username
    #validates_uniqueness_of :username
    #validates_length_of :username, :within => 8..25
    #validates_presence_of :email
    #validates_length_of :email, :maximum => 100
    #validates_format_of :email, :with => EMAIL_REGEX
    #validates_confirmation_of :email

    #short form validations

    validates :first_name, :presence => true,
                           :length => {:maximum => 25}
    validates :last_name, :presence => true,
                          :length => {:maximum => 50}
    validates :username,  :presence => true,
                          :uniqueness => true,
                          :length => {:maximum => 8..25}
    validates :email,     :presence => true,
                          :length => {:maximum => 100},
                          :format => {:with => EMAIL_REGEX},
                          :confirmation => true

   validate :username_is_allowed

   private

   def username_is_allowed
     if FORBIDDEN_USERNAMES.include?(username)
       errors.add(:username, " not allowed.")

   end
end

end
