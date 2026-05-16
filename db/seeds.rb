# The data can be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
puts "Cleaning database..."
Invoice.destroy_all
UsageRecord.destroy_all
Subscription.destroy_all
Company.destroy_all

puts "Creating Efteling company with Enterprise Subscription"

efteling_park = Company.create!(
  name: "Efteling",
  vat_number: "NL847392018B01",
  country: "The Netherlands"
)

Subscription.create!(
  company: efteling_park,
  plan_name: "Enterprise",
  base_price_cents: 49000,
  included_usage: 1000,
  overage_rate_cents: 10
)

puts "Creating Walibi Holland company with Starter Subscription"

walibi_park = Company.create!(
  name: "Walibi Holland",
  vat_number: "NL847417108B01",
  country: "The Netherlands"
)

Subscription.create!(
  company: walibi_park,
  plan_name: "Starter",
  base_price_cents: 4900,
  included_usage: 100,
  overage_rate_cents: 50
)

puts "Simulating credits usage for Efteling (going above limit)"

UsageRecord.create!(
  company: efteling_park,
  action_type: "booking_processed",
  quantity: 600
)

UsageRecord.create!(
  company: efteling_park,
  action_type: "api_request",
  quantity: 600
)

puts "Simulating credits usage for Walibi Holland (staying under limit)"


UsageRecord.create!(
  company: walibi_park,
  action_type: "api_request",
  quantity: 49
)

UsageRecord.create!(
  company: walibi_park,
  action_type: "booking_processed",
  quantity: 50
)
