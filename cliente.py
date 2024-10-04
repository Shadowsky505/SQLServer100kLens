import pyodbc
import pandas as pd
import matplotlib.pyplot as plt

server = '3.82.242.250'
database = 'votos'
username = 'SA'
password = 'Contrastrasena(2024)'
connection_string = f'DRIVER={{ODBC Driver 18 for SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password};TrustServerCertificate=yes'

conn = pyodbc.connect(connection_string)
query = "SELECT gender, occupation FROM u_user;"
df = pd.read_sql(query, conn)

conn.close()

occupation_gender_counts = df.groupby(['gender', 'occupation']).size().unstack().fillna(0)

print(occupation_gender_counts)
 
occupation_gender_counts.T.plot(kind='bar', stacked=True, figsize=(12, 8))
plt.title('Distribución de Ocupación por Género')
plt.xlabel('Ocupación')
plt.ylabel('Número de Personas')
plt.legend(title='Género', labels=['F', 'M'])
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()
