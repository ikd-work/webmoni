require 'curb'
require 'td'

class Tasks::CheckUrl
    SLEEP_TIME = 10
    API_KEY = ''
    TreasureData::Logger.open('webmoni',:apikey=>API_KEY,:auto_create_table=>true)
    def self.execute
        loop do
            if urls = Url.find(:all)
                Url.find(:all).each do |url|
                    http = Curl.get(url.url)
                    p http.downloaded_bytes
                    Result.new(:url => url.url, :code => http.response_code, :response_time => http.total_time, :time => Time.now, :data_size => http.downloaded_bytes).save!
                    TD.event.post('result', {:url=>url.url,:code=>http.response_code,:response_time=>http.total_time,:data_size=>http.downloaded_bytes})
                end
            end
            p "Execute"
            sleep SLEEP_TIME
        end
    end
end
