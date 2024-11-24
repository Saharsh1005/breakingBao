import psycopg2
import random

conn = psycopg2.connect("dbname=imdb4 user=imdb")
cur = conn.cursor()

# Get all indexes (excluding primary keys and unique constraints)
cur.execute("""
    SELECT i.relname AS indexname, t.relname AS tablename, n.nspname AS schemaname
    FROM pg_index x
    JOIN pg_class i ON i.oid = x.indexrelid
    JOIN pg_class t ON t.oid = x.indrelid
    JOIN pg_namespace n ON n.oid = t.relnamespace
    WHERE NOT x.indisprimary AND NOT x.indisunique
      AND n.nspname NOT IN ('pg_catalog', 'information_schema');
""")
indexes = cur.fetchall()

# Randomly select 20% (imdb2) 40% (imdb3) 60% (imdb4) of indexes
'''
IMDB 2: 20% of indexes dropped
    Dropping index: public on complete_cast
    Dropping index: public on movie_companies
    Dropping index: public on movie_companies
    Dropping index: public on movie_link

IMDB 3: 40% of indexes dropped
    Dropping index: public on cast_info
    Dropping index: public on movie_link
    Dropping index: public on aka_title
    Dropping index: public on cast_info
    Dropping index: public on complete_cast
    Dropping index: public on movie_link
    Dropping index: public on movie_info_idx
    Dropping index: public on movie_info_idx
    Dropping index: public on movie_companies

IMDB 4: 60% of indexes dropped (TBD)
    Dropping index: public on movie_info
    Dropping index: public on movie_keyword
    Dropping index: public on movie_link
    Dropping index: public on complete_cast
    Dropping index: public on aka_title
    Dropping index: public on movie_companies
    Dropping index: public on movie_link
    Dropping index: public on movie_companies
    Dropping index: public on aka_name
    Dropping index: public on movie_link
    Dropping index: public on aka_title
    Dropping index: public on title
    Dropping index: public on cast_info
'''
sample_size = int(0.6 * len(indexes))
indexes_to_drop = random.sample(indexes, sample_size)

# Drop the selected indexes
for schemaname, tablename, indexname in indexes_to_drop:
    # drop_query = f"DROP INDEX IF EXISTS {schemaname}.{indexname};"
    print(f"Dropping index: {schemaname}.{indexname} on {tablename}")
    # cur.execute(drop_query)

conn.commit()
cur.close()
conn.close()
