using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using testL3Api.Models;

namespace testL3Api.Managers
{
    public class StorageManager
    {
        private string connectionString;

        public StorageManager(IConfiguration configuration)
        {
            connectionString = configuration.GetConnectionString("test");
        }

        public List<Faculte> SelectFacultes()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SELECT * FROM FACULTES", connection);

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            connection.Open();
            da.Fill(dt);

            return convertDataTabletoListFacultes(dt);
        }

        public Faculte SelectFaculte(string code)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SELECT * FROM FACULTES WHERE Id = @aCode", connection);
            cmd.Parameters.AddWithValue("@aCode", code);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            connection.Open();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
                return convertDataRowToFaculte(dt.Rows[0]);
            else return null;
        }

        public List<Departement> SelectDepartementsByFaculte(string faculte)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SELECT * FROM DEPARTEMENTS WHERE Faculte = @aFaculte", connection);
            cmd.Parameters.AddWithValue("@aFaculte", faculte);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            connection.Open();
            da.Fill(dt);

            return convertDataTableToListDepartements(dt);
        }

        private Departement convertDataRowToDepartement(DataRow row)
        {
            return new Departement()
            {
                Code = (string)row["Code"],
                Nom = (string)row["Nom"]
            };
        }

        private List<Departement> convertDataTableToListDepartements(DataTable dt)
        {
            if (dt.Rows.Count == 0)
                return null;

            List<Departement> facultes = new List<Departement>();
            foreach (DataRow row in dt.Rows)
            {
                facultes.Add(convertDataRowToDepartement(row));
            }
            return facultes;
        }

        private Faculte convertDataRowToFaculte(DataRow row)
        {
            return new Faculte()
            {
                Code = (string)row["Id"],
                Nom = (string)row["Libelle"]
            };
        }

        private List<Faculte> convertDataTabletoListFacultes(DataTable dt)
        {
            if (dt.Rows.Count == 0)
                return null;

            List<Faculte> facultes = new List<Faculte>();
            foreach (DataRow row in dt.Rows)
            {
                facultes.Add(convertDataRowToFaculte(row));
            }
            return facultes;
        }
    }
}