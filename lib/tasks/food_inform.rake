namespace :food_inform do
    desc "賞味期限の通知(お知らせ画面用)" 
    task inform_message_food: :environment do 

        users = User.all
        users.each do |u|
            limit_foods = []
            u.foods.each do |f|
                if (f.expiry_at - Date.today).to_i < 0 && u.setting.inform
                    limit_foods << f.name
                end
            end
            message = {
                type: 'text',
                text: "#{limit_foods.to_s.gsub("[", "").gsub("]", "")}の賞味期限が切れています。"
            }
            if limit_foods.count >= 1
                inform = Inform.new(news_title: "賞味期限が切れている食材があります。", news_message: message[:text], user_id: u.id)
                inform.save
            end
        end

        users = User.all
        users.each do |u|
            limit_foods = []
            u.foods.each do |f|
                if (f.expiry_at - Date.today).to_i <= u.setting.inform_date && (f.expiry_at - Date.today).to_i >= 0 && u.setting.inform
                    limit_foods << f.name
                end
            end
            message = {
                type: 'text',
                text: "#{limit_foods.to_s.gsub("[", "").gsub("]", "")}の賞味期限が切れそうです。"
            }
            if limit_foods.count >= 1
                inform = Inform.new(news_title: "賞味期限が近づいている食材があります。" ,news_message: message[:text] ,user_id: u.id)
                inform.save
            end
        end
    end
end
