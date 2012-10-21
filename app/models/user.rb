class User < ActiveRecord::Base
  attr_accessible :invalid, :last_login_time, :name, :password
end
