require 'sendgrid-ruby'
require 'dotenv/load'
Dotenv.load
include SendGrid

from = SendGrid::Email.new(email: 'example_from@gmail.com')
to = SendGrid::Email.new(email: 'example_to@gmail.com')
subject = 'мяяя'
content = SendGrid::Content.new(type: 'text/plain', value: 'дарова')
mail = SendGrid::Mail.new(from, subject, to, content)

sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
response = sg.client.mail._('send').post(request_body: mail.to_json)
puts response.status_code
puts response.body
puts response.headers
