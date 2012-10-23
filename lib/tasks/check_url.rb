require 'curb'

class Tasks::CheckUrl
    SLEEP_TIME = 10
    def self.execute
        loop do
            if urls = Url.find(:all)
                Url.find(:all).each do |url|
                    http = Curl.get(url.url)
                    p http.downloaded_bytes
                    Result.new(:url => url.url, :code => http.response_code, :response_time => http.total_time, :time => Time.now, :data_size => http.downloaded_bytes).save!
                end
            end
            p "Execute"
            sleep SLEEP_TIME
        end
    end
end
