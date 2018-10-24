FactoryBot.define do
    # factory blueprint for users
    factory :user do
      first_name "Alina"
      last_name "Yu"
      password_digest "secret"
      token "somenumbersandletters"
      email "alinayu@example.com"
    end
  
    # factory blueprint for entries
    factory :entry do
      association :user
      longitude -79.943016
      latitude 40.442806
      end_time Date.current - 1.day
      start_time Date.current - 1.day - 1.hour
      notes "I did not sleep enough"
    end
  
    # factory blueprint for datapoint
    factory :datapoint do
      association :entry
      value -1
      time Date.current - 1.day + 1.minute
    end
  end