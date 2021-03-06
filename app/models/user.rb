class User < ApplicationRecord
    has_many :campaigns
    has_many :pledges
    has_many :causes, through: :pledges, class_name: "Campaign"
    has_attached_file :profile_image_file, :styles => {
    :original => "200x200#" },
    :convert_options => {
    :thumb => "-quality 75 -strip"}

    validates :first_name, :last_name, :password, presence: true, :on => :create
    validates :nickname, :email, presence: true, uniqueness: true
    validates_attachment_content_type :profile_image_file, content_type: /\Aimage/

    # Hash password before saving a user
    before_save :encrypt_password

    # Generate a token for auth before creating a User
    before_create :generate_token

    # Adds a virtual password field, which we will use when creating a User
    attribute :password, :string

    def self.authenticate(email, password)
        user = self.find_by_email(email)
        if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
            user
        else
            nil
        end
    end

    def encrypt_password
        if password.present?
            self.password_salt = BCrypt::Engine.generate_salt
            self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
        end
    end

    # Generates token for User
    def generate_token
        token_gen = SecureRandom.hex
        self.token = token_gen
        token_gen
    end
end
