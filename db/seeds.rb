# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

begin
    require "factory_bot_rails"
  rescue LoadError => e
    raise e unless ENV['RAILS_ENV'] == "production"
  end

# Step 1: create some users
alina = FactoryBot.create(:user, first_name: "Alina", last_name: "Yu")
shirley = FactoryBot.create(:user, first_name: "Shirley", last_name: "Zhou", email: "shirleyzhou@example.com", api_key: "hellohellohello")

# Step 2: create some entries
alina_entry1 = FactoryBot.create(:entry, user: alina)
shirley_entry1 = FactoryBot.create(:entry, user: shirley)
shirley_entry2 = FactoryBot.create(:entry, user: shirley, start_time: DateTime.now.utc - 2.day - 1.hour, end_time: Date.current - 2.day)

# Step 3: create some datapoints
alina_1 = FactoryBot.create(:datapoint, entry: alina_entry1)
alina_2 = FactoryBot.create(:datapoint, entry: alina_entry1, value: 1, time: DateTime.now.utc - 1.day - 1.minute)
shirley_1 = FactoryBot.create(:datapoint, entry: shirley_entry1)
shirley_2 = FactoryBot.create(:datapoint, entry: shirley_entry1, value: -1, time: DateTime.now.utc - 1.day - 1.minute)
shirley_3 = FactoryBot.create(:datapoint, entry: shirley_entry2, value: -1, time: DateTime.now.utc - 2.day - 1.hour + 1.minute)
shirley_4 = FactoryBot.create(:datapoint, entry: shirley_entry2, value: -1, time: DateTime.now.utc - 2.day - 1.hour + 5.minute)
shirley_5 = FactoryBot.create(:datapoint, entry: shirley_entry2, value: 1, time: DateTime.now.utc - 2.day - 1.hour + 10.minute)