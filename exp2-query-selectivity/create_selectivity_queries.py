import psycopg2

conn_str = "dbname=imdb user=imdb host=localhost"

def read_queries_from_file(file_path):
    """Read SQL queries from a given text file and return a dictionary of queries."""
    queries = {}
    current_query = []
    query_name = None
    
    with open(file_path, 'r') as file:
        for line in file:
            if line.startswith('#'):
                # Skip comments
                continue
            if line.startswith('--'):
                if query_name and current_query:
                    queries[query_name] = ' '.join(current_query).strip()
                    current_query = []

                query_name = line.strip()
            else:
                current_query.append(line.strip())
        
        if query_name and current_query:
            queries[query_name] = ' '.join(current_query).strip()

    return queries

if __name__ == '__main__':
    file_path              = f'/Users/saharshbarve/Work/uiuc/study/Semester_3/cs511/project-bao/breakingBao/high_selectivity_queries/high_selectivity_queries.txt'  
    path_to_save_sql_files = f'/Users/saharshbarve/Work/uiuc/study/Semester_3/cs511/project-bao/breakingBao/high_selectivity_queries/shortlist'
    queries = read_queries_from_file(file_path)

    conn = psycopg2.connect(conn_str)
    cursor = conn.cursor()
    cursor.execute("SET statement_timeout = 10000;")
    # Execute each query and save them to .sql files if they run successfully
    results = {}
    for idx, (query_name, query) in enumerate(queries.items()):
        try:
            # cursor.execute(query)
            results[query_name] = 'Ran successfully'
            with open(f"/{path_to_save_sql_files}/query_{idx+1}.sql", "w") as f:  
                f.write(query)
        except Exception as e:
            results[query_name] = f'Failed to run: {str(e)}'

    cursor.close()
    conn.close()

    for name, result in results.items():
        print(f"{name}: {result}")
