# Azure-Data-Engineering-Project
<img width="1157" alt="Screenshot 2025-04-08 at 5 41 29 PM" src="https://github.com/user-attachments/assets/673950d7-6e7b-4b92-a4ba-53efe27ec343" />


**Steps:**
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
13) **Watermark Table** to hold latest date value for incremental loading > create and add the initial value to the watermark table> write a procedure to update the last_load column after each load (procedure_update_lastload.sql attached)
14) create a new pipeline for incremental load in azure datafactory > Drag and drop 2 lookup activity (last_load and current_load) > For last_load go to settings select the source dataset and create a parameter for dynamically change the table name so go to data set and select ds_sqlDB > create parameter > add that in Settings
15) Go back to LookUp > Uncheck first row only > Use Query (last_load look up pulls from watermark table and current_load pulls from source_cars_data) > Connect the 2 lookup's with Copy Data > create a query in the source > In Sink, create new link with Azure Data Lake Gen2
16) Create a stored procedure activity and connect to Copy Data > Fill the details accordingly
17) Debug
18) Create Databricks > Pricing tier is premium for Unity catalog
19) Get your entraID from Azure and use that to login to accounts.azuredatabricks.net > Make your gmail as an account admin > then you will be able to see the manage account at azure databricks
20) Go to manage account > delete the metastore created by databricks
21) create a access connector for databricks
22) create new IAM in datalake
23) create a folder (unitymetastore) in datalake
24) now go back to step 20 and complete the metastore creation by adding ADLS Gen2 path (unitymetastore@carjishadatalake.dfs.core.windows.net/) and add the access connector Id
25) Add workspace to this connector
26) Refresh your databricks workspace to see this unity catalog and create a compute
27) Create external data from catalog to store/access data from Azure > Catalog > External Data > create Credentials using the access connection resource id > grant permissions > create 3 external locations for bronze,silver and gold
28) Create a folder in workspace and a notebook (silver_notbook) inside that > Do the transformations.
29) Create Gold tables as follows
 <img width="612" alt="Screenshot 2025-04-08 at 11 55 31 AM" src="https://github.com/user-attachments/assets/097347a9-a263-47c2-925e-008dc2fdaa77" />
 
30) Create the workflow as follows
    <img width="777" alt="Screenshot 2025-04-08 at 3 12 01 PM" src="https://github.com/user-attachments/assets/9885254c-6340-429b-a478-1b53621aa9ee" />


