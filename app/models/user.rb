class User < ApplicationRecord
    has_secure_password
    has_many :todos  #Corresponding association with todos table
end
