function(GFPIR="IRA") {
	"name": "GDS_AzureBlobFS_Excel_" + GFIR,
	"properties": {
		"linkedServiceName": {
			"referenceName": "GLS_AzureBlobFS_" + GFIR,
			"type": "LinkedServiceReference",
			"parameters": {
				"StorageAccountEndpoint": {
					"value": "@dataset().StorageAccountEndpoint",
					"type": "Expression"
				}
			}
		},
		"parameters": {
			"RelativePath": {
				"type": "string"
			},
			"FileName": {
				"type": "string"
			},
			"StorageAccountEndpoint": {
				"type": "string"
			},
			"StorageAccountContainerName": {
				"type": "string"
			},
			"SheetName": {
				"type": "string"
			},
			"FirstRowAsHeader": {
				"type": "bool"
			}
		},
		"folder": {
			"name": "ADS Go Fast/Generic/" + GFIR
		},
		"annotations": [],
		"type": "Excel",
		"typeProperties": {
			"sheetName": {
				"value": "@dataset().SheetName",
				"type": "Expression"
			},
			"location": {
				"type": "AzureBlobFSLocation",
				"fileName": {
					"value": "@dataset().FileName",
					"type": "Expression"
				},
				"folderPath": {
					"value": "@dataset().RelativePath",
					"type": "Expression"
				},
				"fileSystem": {
					"value": "@dataset().StorageAccountContainerName",
					"type": "Expression"
				}
			},
			"firstRowAsHeader": {
				"value": "@dataset().FirstRowAsHeader",
				"type": "Expression"
			}
		},
		"schema": []
	},
	"type": "Microsoft.DataFactory/factories/datasets"
}


