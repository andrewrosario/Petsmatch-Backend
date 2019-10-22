class User < ApplicationRecord
    has_many :pets
    has_many :matches
    has_many :chats, through: :matches
    has_many :messages
    has_one :preference
    has_one_attached :image
    has_secure_password
    validates :email, presence: true

    def self.from_token_request(request)
        username = request.params["auth"] && request.params["auth"]["username"]
        self.find_by(username: username)
    end

    def index
        @users = 
        render json: User.all.with_attached_images
    end

    def image_url
        this_url = url_for(self.image)
        return this_url
    end
end
