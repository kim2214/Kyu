# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    title { 'test' }
    contents { 'test contents' }
  end
end
