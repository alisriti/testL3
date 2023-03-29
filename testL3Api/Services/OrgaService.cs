using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using testL3Api.Managers;
using testL3Api.Models;

namespace testL3Api.Services
{
    public class OrgaService
    {
        private StorageManager storage;

        public OrgaService(IConfiguration configuration)
        {
            storage = new StorageManager(configuration);
        }

        public List<Faculte> GetFacultes()
        {
            List<Faculte> facultes = storage.SelectFacultes();
            return facultes;
        }

        public Faculte GetFaculte(string code)
        {
            Faculte faculte = storage.SelectFaculte(code);
            List<Departement> departements = storage.SelectDepartementsByFaculte(code);

            faculte.Departements = departements;
            return faculte;
        }
    }
}