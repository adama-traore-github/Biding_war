json.extract! utilisateur, :id, :name, :email, :created_at, :updated_at
json.url utilisateur_url(utilisateur, format: :json)
