# Azure-Data-Engineering-Project
1) Create an azure account
2) Create a resource group
3) Create Storage Account(carjishadatalake) > click on microsoft storage account > Enter Storage Account Name & Redundancy = LRS (cheapest option) > Next page **check** Enable Hierarchical namespace (to create a datalake) > click on Review+Create > click on create
4) Create datafactory (carjishadf) > click on microsoft datafactory > Review+Create > Create
5) Create Azure SQL > click on microsoft Azure SQL > select SQL databases > give a database name (carsales)> create new server (carsalesserverjisha)> Authentication method select Use both SQl and Microsoft extra authentication > Set admin as yourself > Give server admin login and password > OK > Workload environment = Development > Configure Database > Service Tier = Serverless > Backup Storage Redundancy = Locally-redundant backup storage > click on Apply > click on Next: Networking > Connectivity method = Public endpoint > click on Security > Review+Create > Create (**Deplyment failed. Redeployed with AutoResponse=15**)
6) create 3 containers in Data Storage of carjishadatalake with the names bronze, silver and gold
7) Open carsales database, using query editor create table (source_cars_data)
8) Open carjishsdf > Launch Studio > click on Auther tab > Create new pipeline > give a name (source_prep)
9) To connect to hithub source data--click on managed data > click on +New > click on http connection > Continue > give a name(ls_github) > Enter the base url (https://raw.githubusercontent.com/) > Enter the Authentication connection to Anonymous > Test the connection and create
10) Create another linked service to connect to Azure sql database > select the azure subscription, server name, database > Enter username, password > Test Connection > create
11) Go back to Author tab > drag Copy Data from activities > create a parameterized data set from Source > Source Data Set > New > http > csv > Name it (ds_git)
12) Publish All from the Linked Services
