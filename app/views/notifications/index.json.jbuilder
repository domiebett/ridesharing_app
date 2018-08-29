json.array! @notifications do |notification|
  json.id notification.id
  json.recipient notification.recipient
  json.actor notification.actor
  json.action notification.action
  json.notifiable notification.notifiable
  json.read_at notification.read_at
  json.path notification.path
end
