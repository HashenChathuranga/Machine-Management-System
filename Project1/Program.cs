using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Project1
{
    internal static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new frmLogin());
        }

        public struct Credentials
        {
            public static string UserID;
            public static string UserName;
            public static string Location;
            public static string Role;
        }

        public static string getConnectionSrtring()
        {
            return "server=localhost;uid=root;password=1234;database=machine_management_sys;";
        }
    }
}
