class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    rails_admin do
    configure :encrypted_password do
      hide
    end
  end
end
