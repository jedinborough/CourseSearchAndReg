using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CourseSearchAndReg.Startup))]
namespace CourseSearchAndReg
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
