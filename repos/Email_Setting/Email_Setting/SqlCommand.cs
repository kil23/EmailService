using System;
using System.Data;

namespace Email_Setting
{
    internal class SqlCommand
    {
        private string proc;
        private SqlConnection cn;

        public SqlCommand(string proc, SqlConnection cn)
        {
            this.proc = proc;
            this.cn = cn;
        }

        public object Parameters { get; internal set; }
        public CommandType CommandType { get; internal set; }

        internal void ExecuteNonQuery()
        {
            throw new NotImplementedException();
        }
    }
}