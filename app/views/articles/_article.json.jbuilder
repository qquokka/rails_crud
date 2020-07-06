json.extract! article, :id, :content, :title, :created_at, :updated_at
json.url article_url(article, format: :json)
