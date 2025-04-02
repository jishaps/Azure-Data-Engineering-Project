# Azure-Data-Engineering-Project
1) Create an assure account
2) Create a resource group
3) Create Storage Account > click on microsoft storage account > Enter Storage Account Name & Redundancy = LRS (cheapest option) > Next page **check** Enable Hierarchical namespace (to create a datalake) > click on Review+Create > click on create
4) Create datafactory > click on microsoft datafactory > Review+Create > Create
5) Create Azure SQL > click on microsoft Azure SQL > select SQL databases > give a database name > create new server > Authentication method select Use both SQl and Microsoft extra authentication > Set admin as yourself > Give server admin login and password > OK > Workload environment = Development > Configure Database > Service Tier = Serverless > Backup Storage Redundancy = Locally-redundant backup storage > click on Apply > click on Next: Networking > Connectivity method = Public endpoint > click on Security > Review+Create > Create
