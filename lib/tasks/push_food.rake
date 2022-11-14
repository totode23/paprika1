namespace :push_food do
    desc "賞味期限の通知" 
    task :push_line_message_food => :environment do
        client ||= Line::Bot::Client.new { |config|
            config.channel_secret = ENV["e47e4b7a88edf8696686ae46424cbe66"]
            config.channel_token = ENV["jObvknV9WCksOgs/COyS5W8CF9wUEwn7ptjtGH3MSNFcawwgc1wA5rCJ045V0LgPaa23uWZN4IbisEiVDmIgLegqZqsoQ68z9f5eedawfjBXItPWeOQ6kfF4aFGzX7udcqOmZZiOinLyx+ZyuPsu3QdB04t89/1O/w1cDnyilFU="]
        }

        limit_foods = Food.where(expiry_at: Date.today <= 0)
        limit_foods.each do |t|
            message = {
                type: 'text',
                text: "「#{t.name}」の賞味期限が切れています"
            }
            response = client.push_message(t.user_id, message)
            p response
        end
    end
end
