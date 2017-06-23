using System;
using System.Collections.Generic;
using testApi.Models;

namespace testApi.Responses
{
    public class TokenResponse
    {
        private static string _secretKey = "wYGgT9nCJ8GoERe7v7BoenEK8JXHbhpCArXL9rAP";
        private user user;
        public string token;
        private Models.user user1;

        public TokenResponse(user user)
        {
            this.user = user;
        }

        public TokenResponse generateToken()
        {
            var exp = ((DateTime.UtcNow.AddHours(12).Ticks - (new DateTime(1970, 1, 1).Ticks)) / TimeSpan.TicksPerSecond);
            Console.WriteLine(exp);
            var payload = new Dictionary<string, object>()
            {
                {"sub",new
                    {
                        id = user.id,
                        name = user.name
                    }
                },
                {
                    "exp", exp
                }
            };

            string token = JWT.JsonWebToken.Encode(payload, _secretKey, JWT.JwtHashAlgorithm.HS512);
            this.token = token;
            return this;
        }

        public static string SecretKey
        {
            get { return _secretKey; }
            set { _secretKey = value; }
        }
    }
}