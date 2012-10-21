class ModelClass <  ActiveRecord::Base
  SLEEP = 5
  class << self
    def method
      loop do
        time = Time.now.strftime("%H:%M %S")
        self.core time
        sleep SLEEP
      end
    end

    def core(time)
      open("#{RAILS_ROOT}/log/test_log.txt", "a") do |f|
        f.write(time + "\n")
      end
    end

  end
end
