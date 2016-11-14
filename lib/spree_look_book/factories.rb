FactoryGirl.define do
  sequence(:lookbook_name) { |n| "Lookbook - #{n}" }

  factory :look_book, class: 'Spree::LookBook' do
    title              { FFaker::Lorem.sentence(1) }
    slug               { title }
    active             { true }
  end
end
