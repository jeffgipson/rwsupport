json.extract! response, :id, :title, :body, :image, :user_id, :ticket_id, :created_at, :updated_at
json.url response_url(response, format: :json)
json.body response.body.to_s
json.image url_for(response.image)
