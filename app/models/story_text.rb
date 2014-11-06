class StoryText
    include Mongoid::Document
    include ActiveModel::SecurePassword
    field :passage, type: String
    field :author, type: String
end