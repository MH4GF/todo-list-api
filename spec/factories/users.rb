# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string(255)      not null
#  name       :string(255)      not null
#  uid        :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :user do
    name { '山田太郎' }
    sequence(:email) { |n| "person#{n}@example.com" }
    uid { SecureRandom.urlsafe_base64(48) }
  end
end
