from django.core.mail import send_mail

send_mail(
    "Subject here",
    "Here is the message.",
    "jonas@visualportfolio.net",
    ["pfeifer.jonas@gmail.com"],
    fail_silently=False,
)
