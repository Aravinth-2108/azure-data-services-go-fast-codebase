function(GFPIR="IRA") {
	"name": "GDS_AzureBlobStorage_Parquet_" + GFIR,
    "properties": {
        "linkedServiceName": {
            "referenceName": "GenericBlobStorage_" + GFIR,
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
            }
        },
        "folder": {
            "name": "ADS Go Fast/Generic/" + GFIR
        },
        "annotations": [],
        "type": "Parquet",
        "typeProperties": {
            "location": {
                "type": "AzureBlobStorageLocation",
                "fileName": {
                    "value": "@dataset().FileName",
                    "type": "Expression"
                },
                "folderPath": {
                    "value": "@dataset().RelativePath",
                    "type": "Expression"
                },
                "container": {
                    "value": "@dataset().StorageAccountContainerName",
                    "type": "Expression"
                }
            },
            "compressionCodec": "gzip"
        },
        "schema": []
    },
    "type": "Microsoft.DataFactory/factories/datasets"
}

