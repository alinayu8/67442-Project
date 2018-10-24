FactoryBot.define do
    # factory blueprint for users
    factory :user do
      first_name "Alina"
      last_name "Yu"
      password "secret"
      password_confirmation "secret"
      api_key "somenumbersandletters"
      email "alinayu@example.com"
    end
  
    # factory blueprint for entries
    factory :entry do
      association :user
      longitude -79.943016
      latitude 40.442806
      start_time DateTime.now.utc - 1.day - 1.hour
      end_time DateTime.now.utc - 1.day
      notes "I did not sleep enough"
    end
  
    # factory blueprint for datapoint
    factory :datapoint do
      association :entry
      value -1
      time DateTime.now.utc - 1.day - 1.hour + 1.minute
    end
  end