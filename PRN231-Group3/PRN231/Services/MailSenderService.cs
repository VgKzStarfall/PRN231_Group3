using MailKit.Net.Smtp;
using MailKit.Security;
using MimeKit;

namespace PRN231.Services
{
    public static class MailSenderService
    {
        public static async Task SendEmailAsync(string subject, string body, string toEmail)
        {
            var email = "toftoftofvanka@gmail.com";
            var password = "toftoftof";

            var emailMessage = new MimeMessage();
            emailMessage.From.Add(MailboxAddress.Parse(email));
            emailMessage.To.Add(MailboxAddress.Parse(toEmail));
            emailMessage.Sender = new MailboxAddress("247Express", email);
            emailMessage.Subject = subject;

            var builder = new BodyBuilder();

            builder.HtmlBody = body;
            emailMessage.Body = builder.ToMessageBody();
            using var smtp = new SmtpClient();
            smtp.Connect("smtp.gmail.com", 587, SecureSocketOptions.StartTls);
            smtp.Authenticate(email, password);
            await smtp.SendAsync(emailMessage);
            smtp.Disconnect(true);
        }
    }
}
