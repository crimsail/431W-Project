import psycopg2
from psycopg2 import Error
DB_NAME = "postgres"
DB_USER = "postgres"
DB_PASS = "zslayer12"
DB_HOST = "localhost"
DB_PORT = "5432"

try:
    conn = psycopg2.connect(database=DB_NAME, user=DB_USER, password=DB_PASS, host=DB_HOST, port=DB_PORT)
    cursor = conn.cursor()
except (Exception, Error) as error:
    print("Connection to SQL database failed:", error)
    quit()


def query(sql):
    try:
        cursor.execute(sql)
        return True
    except (Exception, Error) as error:
        print("Error:", error)
        return False


def func_exit(func):
    print("\n1.Return\n"
          "2.Return to menu\n"
          "3.Exit")
    option = input(":")
    if option == '1':
        func()
    if option == '2':
        main()
    if option == '3':
        quit()


def get_cols(table):
    sql = f'''SELECT * FROM public.{table} LIMIT 0'''
    cols = []
    if query(sql):
        cols = [desc[0] for desc in cursor.description]
    return cols


def get_tables():
    sql = '''SELECT table_name FROM information_schema.tables
       WHERE table_schema = 'public';'''
    query(sql)
    return cursor.fetchall()


def insert():
    table = input("Enter table: ")
    cols = (get_cols(table))
    if not cols:
        func_exit(insert)
    print("Enter values:")
    values = []
    for i in range(len(cols)):
        value = input(f"{str(cols[i])}: ")
        values.append(value)
    sql = f'''INSERT INTO public.{table}({','.join(cols)})
        VALUES ({','.join(values)});'''
    if query(sql):
        print("Record successfully inserted.")
    func_exit(insert)


def delete():
    table = input("Enter table: ")
    condition = input("Enter condition:")
    sql = f'''DELETE FROM public.{table}
        WHERE {condition};'''
    if query(sql):
        print("Record(s) successfully deleted.")
    func_exit(delete)


def update():
    table = input("Enter table: ")
    cols = (get_cols(table))
    if not cols:
        func_exit(update)
    values = []
    print("Set new values:")
    for i in range(len(cols)):
        value = input(f"{str(cols[i])}: ")
        set_value = str(cols[i]) + '=' + str(value)
        values.append(set_value)
    condition = input("Enter condition: ")
    sql = f'''UPDATE public.{table}
            SET {','.join(values)}
        WHERE {condition};'''
    if query(sql):
        print("Record(s) successfully updated.")
    func_exit(update)


def search():
    table = input("Enter table: ")
    cols = (get_cols(table))
    if not cols:
        func_exit(search)
    print(f'Columns: {', '.join(cols)}')
    sel_cols = input("Select column(s): ")
    condition = input("Enter condition: ")
    sort_col = input("Enter sorting column: ")
    sort_order = input("Enter sorting order: ")
    sql_table = f'''SELECT {sel_cols} FROM public.{table}'''
    if not condition:
        sql_cond = f''''''
    else:
        sql_cond = f''' WHERE {condition}'''
    if not sort_col:
        sql_sort = f''''''
    else:
        sql_sort = f''' ORDER BY {sort_col} {sort_order}'''
    sql = sql_table + sql_cond + sql_sort + ''';'''
    query(sql)
    records = cursor.fetchall()
    if records:
        for row in records:
            print(row)
    else:
        print("No records found.")
    func_exit(search)


def aggregate():
    table = input("Enter table: ")
    cols = (get_cols(table))
    if not cols:
        func_exit(search)
    print(f'Columns: {', '.join(cols)}')
    afunc = input("Enter aggregate function: ")
    col = input("Enter column: ")
    sql = f'''SELECT {afunc}({col}) FROM public.{table};'''
    query(sql)
    result = cursor.fetchall()
    if result:
        print(result)
    func_exit(aggregate)


def join():
    print(get_tables())
    ltable = input("Enter left table: ")
    rtable = input("Enter right table: ")
    key = input("Enter key: ")
    cols = input("Select Column(s): ")
    sql = f'''SELECT {cols} FROM public.{ltable} JOIN public.{rtable}
                ON {ltable}.{key} = {rtable}.{key};'''
    query(sql)
    records = cursor.fetchall()
    if records:
        for row in records:
            print(row)
    else:
        print("No records found.")
    func_exit(join)


def group():
    table = input("Enter table: ")
    cols = (get_cols(table))
    if not cols:
        func_exit(search)
    print(f'Columns: {', '.join(cols)}')
    sel_cols = input("Select column(s): ")
    group = input("Select group column: ")
    sql = f'''SELECT {sel_cols}, COUNT(*) FROM public.{table} 
                GROUP BY {group};'''
    query(sql)
    records = cursor.fetchall()
    if records:
        for row in records:
            print(row)
    else:
        print("No records found.")
    func_exit(group)


def subquery():
    outCols = input("Select outer column(s): ")
    inTable = input("Enter inner table: ")
    cols = (get_cols(inTable))
    if not cols:
        func_exit(search)
    inCols = input("Enter inner column(s): ")
    sql = f'''SELECT {outCols} FROM (
                SELECT {inCols} FROM {inTable});'''
    query(sql)
    records = cursor.fetchall()
    if records:
        for row in records:
            print(row)
    else:
        print("No records found.")
    func_exit(subquery)


def transactions():
    print("1.Commit\n"
          "2.Rollback\n"
          "3.Return to menu")
    sql = ''''''
    option = input(":")
    if option == '3':
        main()
    if option == '1':
        conn.commit()
        print("Transaction successfully commited.\n")
    if option == '2':
        conn.rollback()
        print("Transaction successfully rolled back.\n")
    transactions()


def main():
    print("\nDatabase Management Tool\n\nSelect an option:\n"
          "1.Insert Data\n"
          "2.Delete Data\n"
          "3.Update Data\n"
          "4.Search/Sort Data\n"
          "5.Aggregate Functions\n"
          "6.Joins\n"
          "7.Grouping\n"
          "8.Subqueries\n"
          "9.Transactions\n"
          "10.Exit"
          )
    option = input(":")

    if option == '1':
        insert()
    if option == '2':
        delete()
    if option == '3':
        update()
    if option == '4':
        search()
    if option == '5':
        aggregate()
    if option == '6':
        join()
    if option == '7':
        group()
    if option == '8':
        subquery()
    if option == '9':
        transactions()
    if option == '10':
        quit()


if __name__ == "__main__":
    main()

