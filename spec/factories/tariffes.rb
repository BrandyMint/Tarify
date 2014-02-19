# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tariffe do
    bank nil
    title "Базовый"
    month_fee   790.0
    invoice_fee 30.0
    cashing_fee 2.0
    summary "MyText"
    pdf nil
    description "MyText"
    invoice_tips "MyString"
  end
end
