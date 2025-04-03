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
11) Go back to Author tab > drag Copy Data from activities > create a parameterized data set from Source > Source Data Set > New > http > csv > Name it (ds_git) > select the linked Service > Give the relative url (jishaps/Azure-Data-Engineering-Project/refs/heads/main/SalesData.csv) > click on advanced > Open this dataset > click on Parameter > New > click on Relative URL > Add dynamic content ex. jishaps/Azure-Data-Engineering-Project/refs/heads/main/@{dataset().load_flag} > Go back to source_prep > give the parameter value (here it is SalesData.csv) > Go to general and give a name (CopyGitdata) > Got to Sink and create a sink azure sql dataset (ds_sqlDB) > select the linked services and table name click on ok > click on Debug (it will load the data to the SQL Database) > Publish the dataset> Now we can go to the Azure portal and using the Query editor and see the data
12) Publish All from the Linked Services
