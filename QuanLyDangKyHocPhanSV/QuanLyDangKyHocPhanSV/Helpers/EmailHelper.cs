using MailKit.Net.Smtp;
using MailKit;
using MimeKit;

namespace QuanLyDangKyHocPhanSV.Helpers
{
    public class EmailHelper
    {
        private readonly string smtpHost = "smtp.gmail.com";
        private readonly int smtpPort = 465;
        private readonly string smtpUser = "khangksp@gmail.com";
        private readonly string smtpPass = "yxzehtkzurhlcrgk";
        private readonly string fromEmail = "khangksp@gmail.com";

        public void SendEmail(string toEmail, string subject, string body)
        {
            var message = new MimeMessage();
            message.From.Add(new MailboxAddress("Admin", fromEmail));
            message.To.Add(new MailboxAddress("", toEmail));
            message.Subject = subject;

            var bodyBuilder = new BodyBuilder
            {
                HtmlBody = body
            };

            message.Body = bodyBuilder.ToMessageBody();

            using (var client = new SmtpClient())
            {
                try
                {
                    client.Connect(smtpHost, smtpPort, true);
                    client.Authenticate(smtpUser, smtpPass);

                    client.Send(message);
                    client.Disconnect(true);
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Gửi mail thất bại: " + ex.Message);
                }
            }
        }
    }
}
