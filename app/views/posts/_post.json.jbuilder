json.extract! post, :id, :title, :body, :image, :category_id, :created_at, :updated_at
json.url post_url(post, format: :json)
json.body post.body.to_s
json.image url_for(post.image)
