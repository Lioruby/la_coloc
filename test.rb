require 'mailjet'
Mailjet.configure do |config|
  config.api_key = 'dd3f89cb387aa3ae8ab2fb6053718d42'
  config.secret_key = 'a9eeda8d3e9b7d9a36f32e3ad48f71f5'
  config.api_version = "v3.1"
end
variable = Mailjet::Send.create(messages: [{
    'From'=> {
        'Email'=> 'xyz.lacoloc@gmail.com',
        'Name'=> 'Me'
    },
    'To'=> [
        {
            'Email'=> 'levy.lior.pro@gmail.com',
            'Name'=> 'You'
        }
    ],
    'Subject'=> 'My first Mailjet Email!',
    'TextPart'=> 'Greetings from Mailjet!',
    'HTMLPart'=> '<h3>Dear passenger 1, welcome to <a href=\'https://www.mailjet.com/\'>Mailjet</a>!</h3><br />May the delivery force be with you!'
}]
)
p variable.attributes[:messages]
