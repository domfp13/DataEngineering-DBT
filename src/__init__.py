
def get_data(query:str)->None:
    """Context manager to automatically close DB connections and cursor
    It retrieve credentials from Environment variables

    Args:
        query (str):  [Sql to run]

    Returns
        None
    """
    import os
    import psycopg2
    try:

        connection = psycopg2.connect(user=os.environ.get('DATABASE_USERNAME'),
                                      password=os.environ.get('DATABASE_PASSWORD'),
                                      host=os.environ.get('DATABASE_HOST'),
                                      port=os.environ.get('DATABASE_PORT'),
                                      database=os.environ.get('DATABASE_NAME'))

        cursor = connection.cursor()
        cursor.execute(query)
        
        for row in cursor.fetchall():
            print(row)

    except (Exception, psycopg2.Error) as error :
        print ("Error while fetching data from PostgreSQL", error)

    finally:
        if connection:
            cursor.close()
            connection.close()

def load_raw_netflix_titles(file_name:str) -> None:
    
    import pandas as pd
    import numpy as np
    from pathlib import Path
    import os
    import psycopg2
    import psycopg2.extras
    
    try:
        df = pd.read_csv(Path(os.getcwd(),'resources', file_name))
        df.rename(columns={'show_id':'show_id', 
                'type':'show_type', 
                'title':'title', 
                'director':'director',
                'cast':'show_cast',
                'country':'country', 
                'date_added':'date_added',
                'release_year':'release_year', 
                'rating':'rating',
                'duration':'duration', 
                'listed_in':'listed_in', 
                'description':'description'}, inplace=True)
        
        df_columns = list(df)
        
        columns = ",".join(df_columns)
        
        values = "VALUES({})".format(",".join(["%s" for _ in df_columns])) 

        insert_stmt = "INSERT INTO {} ({}) {}".format('raw_data.raw_netflix_titles',columns,values)
        
        connection = psycopg2.connect(user=os.environ.get('DATABASE_USERNAME'),
                                    password=os.environ.get('DATABASE_PASSWORD'),
                                    host=os.environ.get('DATABASE_HOST'),
                                    port=os.environ.get('DATABASE_PORT'),
                                    database=os.environ.get('DATABASE_NAME'))

        cursor = connection.cursor()
        psycopg2.extras.execute_batch(cursor, insert_stmt, df.values)
        connection.commit()
    except Exception as e:
        print(e)
    finally:
        if connection:
            cursor.close()
            connection.close()