CREATE DATABASE AdventureWorksGold;

CREATE EXTERNAL DATA SOURCE AdventureWorksStorage
WITH (
    LOCATION = 'abfss://gold@adventureworks1nduta.dfs.core.windows.net'
)

CREATE EXTERNAL FILE FORMAT DeltaFormat
WITH (
    FORMAT_TYPE = DELTA
)

