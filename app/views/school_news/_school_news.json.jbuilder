json.extract! school_news, :id, :title, :description, :content, :photo, :created_at, :updated_at
json.url school_news_url(school_news, format: :json)
