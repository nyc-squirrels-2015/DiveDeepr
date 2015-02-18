class User < ActiveRecord::Base
  has_secure_password
  has_many :dive_logs
  has_many :photos, through: :dive_logs
end
