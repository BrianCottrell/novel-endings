class FirstStoryText
    include Mongoid::Document
    include ActiveModel::SecurePassword
    field :passage,         type: String
    field :author,          type: String
    validates_presence_of   :passage
end