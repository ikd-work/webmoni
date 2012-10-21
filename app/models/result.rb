class Result < ActiveRecord::Base
  attr_accessible :code, :data_size, :response_time, :time, :url
end
