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
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        static void Main()
        {
            //ServiceBase[] ServicesToRun;
            //ServicesToRun = new ServiceBase[]
            //{
            //    new EmailService()
            //};
            //ServiceBase.Run(ServicesToRun);


            //#if (!DEBUG)
            //           ServiceBase[] ServicesToRun;
            //           ServicesToRun = new ServiceBase[] 
            //	   { 
            //	        new EmailService() 
            //	   };
            //           ServiceBase.Run(ServicesToRun);
            //#else
            EmailService myServ = new EmailService();

            myServ.ServiceFunction();
            // here Process is my Service function
            // that will run when my service onstart is call
            // you need to call your own method or function name here instead of Process();
            //#endif
        }
    }
}
