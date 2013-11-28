# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tariff do
    bank nil
    title "MyString"
    month_fee 1.5
    invoice_fee 1.5
    cashing_fee 1.5
    summary "MyText"
    pdf "MyString"
    description "MyText"
    invoice_tips "MyString"
  end
end
