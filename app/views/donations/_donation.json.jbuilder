json.extract! donation, :id, :name, :amount, :email, :description, :created_at, :updated_at
json.url donation_url(donation, format: :json)
