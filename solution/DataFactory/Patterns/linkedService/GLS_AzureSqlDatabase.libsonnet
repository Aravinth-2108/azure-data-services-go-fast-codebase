function(GFPIR="IRA")
{
	"name": "GLS_AzureSQLDatabase_" + GFPIR,
	"type": "Microsoft.DataFactory/factories/linkedservices",
	"properties": {
		"parameters": {
			"Server": {
				"type": "string"
			},
			"Database": {
				"type": "string"
			}
		},
		"annotations": [],
		"type": "AzureSqlDatabase",
		"typeProperties": {
			"connectionString": "Integrated Security=False;Encrypt=True;Connection Timeout=30;Data Source=@{linkedService().Server};Initial Catalog=@{linkedService().Database}"
		},
		"connectVia": {
			"referenceName": GFPIR,
			"type": "IntegrationRuntimeReference"
		}
	}
}