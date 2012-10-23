namespace :seed do
  desc "Convert response_time number for results"
  task :convert_response_time_number => :environment do
    Result.transaction do
      Result.all.each do |data|
        data.response_time = data.response_time_old.to_f
        data.save!
      end
    end
  end
end
