using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web.Http;
using Microsoft.Owin.Security.OAuth;
using Newtonsoft.Json.Serialization;
using System.Net.Http.Formatting;
using System.Web.Http.Cors;
namespace WebApplication3
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services
            // Configure Web API to use only bearer token authentication.
            
            config.EnableCors(new EnableCorsAttribute(origins: "*", headers: "*", methods: "*"));//allow to solve CORS(Cross origin resource sharing) problem 

            //config.Formatters.Clear();// clear default returntype format of api
            //config.Formatters.Add(new JsonMediaTypeFormatter());//set new return type for api.
            config.IncludeErrorDetailPolicy = IncludeErrorDetailPolicy.Always;

            config.SuppressDefaultHostAuthentication();
            config.Filters.Add(new HostAuthenticationFilter(OAuthDefaults.AuthenticationType));

            // Web API routes
            config.MapHttpAttributeRoutes();

           // config.Routes.MapHttpRoute(
           //    name: "NewApiRoute",
           //    routeTemplate: "api/{controller}/{action}/{id}",
           //    defaults: new { id = RouteParameter.Optional }
           //);
            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}
