# frozen_string_literal: true
FactoryGirl.define do
  factory :language do
    name 'English'
  end

  factory :user do
    email "user@test.dev.null"
    password "password"
  end
end
