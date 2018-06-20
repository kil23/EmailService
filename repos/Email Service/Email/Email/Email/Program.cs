using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;

namespace Email
{
    static class Program
    {
        static void Main()
        {
            //ServiceBase[] ServicesToRun;
            //ServicesToRun = new ServiceBase[]
            //{
            //    new EmailService()
            //};
            //ServiceBase.Run(ServicesToRun);


            //#if (!DEBUG)
            //                        ServiceBase[] ServicesToRun;
            //                        ServicesToRun = new ServiceBase[] 
            //                                       { 
            //                                            new EmailService() 
            //                                       };
            //                        ServiceBase.Run(ServicesToRun);
            //#else
            EmailService myServ = new EmailService();
            myServ.ServiceFunction();
            //#endif
        }
    }
}
