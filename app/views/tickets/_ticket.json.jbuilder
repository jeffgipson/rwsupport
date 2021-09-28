json.extract! ticket, :id, :title, :body, :image, :user_id, :status, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
json.body ticket.body.to_s
json.image url_for(ticket.image)
