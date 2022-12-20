namespace :push_food do
    desc "賞味期限の通知" 
    task :push_line_message_food => :environment do
        client = Line::Bot::Client.new { |config|
            config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
            config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
        }

        # limit_foods = Food.where("expiry_at < ?", Date.today - Setting.find_by(user_id: ).inform_date.days)
        # limit_foods.each do |t|
        #     message = {
        #         type: 'text',
        #         text: "「#{t.name}」の賞味期限が切れています。"
        #     }
        #     response = client.push_message(t.user.uid, message)
        #     p response
        # end
        users = User.all
        users.each do |u|
            limit_foods = []
            u.foods.each do |f|
                if (f.expiry_at - Date.today).to_i < 0  &&  u.setting.inform
                    limit_foods << f.name
                end
            end
            message = {
                type: 'text',
                text: "#{limit_foods.to_s.gsub("[", "").gsub("]", "")}の賞味期限が切れています。"
            }
            if limit_foods.count >= 1
            response = client.push_message(u.uid, message)
            end
            p response
        end

        users = User.all
        users.each do |u|
            limit_foods = []
            u.foods.each do |f|
                if (f.expiry_at - Date.today).to_i <= u.setting.inform_date && (f.expiry_at - Date.today).to_i >= 0 &&  u.setting.inform
                    limit_foods << f.name
                end
            end
            message = {
                type: 'text',
                text: "#{limit_foods.to_s.gsub("[", "").gsub("]", "")}の賞味期限が切れそうです。"
            }
            if limit_foods.count >= 1
            response = client.push_message(u.uid, message)
            end
            p response
        end
    end
end
