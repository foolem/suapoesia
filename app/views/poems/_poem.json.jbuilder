json.extract! poem, :id, :status, :content, :created_at, :updated_at
json.url poem_url(poem, format: :json)
