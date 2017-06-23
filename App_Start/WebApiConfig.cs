using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Formatting;
using System.Net.Http.Headers;
using System.Web.Http;
using System.Web.Http.Cors;
using testApi.App_Start;

namespace testApi
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        
        {
            config.MapHttpAttributeRoutes();
            config.Services.Replace(typeof(IContentNegotiator), new JsonContentNegotiator(new JsonMediaTypeFormatter()));

            //var cors = new EnableCorsAttribute("*", "*", "*");
            //config.EnableCors(cors);
          
           config.Routes.MapHttpRoute(
               name: "DefaultApi",
               routeTemplate: "{controller}/{id}",
               defaults: new { id = RouteParameter.Optional }
           );
           


        }
    }
}
