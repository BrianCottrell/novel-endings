class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_secure_password
  field :email,             type: String
  field :password_digest,   type: String
  field :first_post_timer,  type: Integer
  field :second_post_timer, type: Integer
  field :third_post_timer,  type: Integer
  field :fourth_post_timer, type: Integer
  field :fifth_post_timer,  type: Integer
  field :delete_timer,      type: Integer
  validates_presence_of     :email
  validates_presence_of     :password_digest
  validates_uniqueness_of   :email
  validates_length_of       :email, maximum: 30
end
