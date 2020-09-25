class Mail::SendGrid
  def initialize(settings)
    @settings = settings
  end

  def deliver!(mail)
    from = SendGrid::Email.new(email: mail.from.first)
    to = SendGrid::Email.new(email: mail.to.first)
    subject = mail.subject
    content = SendGrid::Content.new(type: 'text/html', value: mail.body.raw_source)
    sg_mail = SendGrid::Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: @settings[:api_key])
    response = sg.client.mail._('send').post(request_body: sg_mail.to_json)
    puts "status_code=#{response.status_code}"
    # puts "body=#{response.body}"
    # puts "parse_body=#{response.parsed_body}"
    # puts "headers=#{response.headers}"
  end
end