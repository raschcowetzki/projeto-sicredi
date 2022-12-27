# projeto-sicredi


Esse repositório contem um projeto que visa completar os requisitos da avaliação técnica do sicredi. Para isso seria necessário criar tabelas, popular com dados ficticios seguindo o modelo a seguir 

<img width="751" alt="image" src="https://user-images.githubusercontent.com/64164029/209675476-890fda92-3c14-4297-977e-730652e61577.png">

Além disso era necessário criar uma tabela-resumo contendo informações de todas outras e disponibiliza-lá via csv:

<img width="326" alt="image" src="https://user-images.githubusercontent.com/64164029/209675837-c912a1a0-9317-4cd0-8e07-b6882f45d515.png">

Para realizar isso, criei uma infraestrutura completa para bigdata que pode ser reproduzida localmente via docker-compose.

## Tech stack
* Trino - Query Engine rodando junto com MariaDB.
* Minio - Para reproduzir um data lake como o S3 para armazenamento de objetos.
* Hive Metastore - para termos um catalogo acessível via Trino e Spark.
* Jupyter Lab - Para criação de notebooks em python para fluxos ETL utilizando Spark 3.0
* Apache superset - Para visualização e para executar querys em uma interface.


## Para comecar
* vá até a raiz do arquivo 
* rode: 
```
docker-compose up -d
```
```
sh superset_init.sh
```

Isso irá startar toda stack mencionada acima. Cada ambiente está acessível em uma porta diferente:

* minio: http://localhost:38000/ login:minio_access_key password:minio_secret_key
* apachesuperset: http://localhost:8088/ login:admin password:admin
* jupyter lab: acesse o log do container, lá havera uma url com token de autenticação para o acesso

Configurando trino + superset:
* Acesse o superset.
* Na aba de DATA encontre Add Database.
* Utilize a SqlAlchemy URI e teste a conexão:`trino://hive@trino-coordinator:8080/hive`

Para executar o projeto, siga o passo a passo abaixo:

* Crie um bucket de nome `sicredi` no MiniO
* Importe os notebooks da pasta jupyter_data para o Jupyter Lab.(Cada um contém as configuraçoes necessárias para conexão com o resto do ambiente)
* Execute os notebooks um a um, deixando o `movimento_flat` por último.(É possível conferir a criação dos arquivos em tempo real dentro do MiniO)
* Após isso teremos tudo populado corretamente, porém não em uma estrutura de tabela, são apenas arquivos parquet crus.
* Acesse o trino rodando o seguinte comando na raiz do arquivo:
```
docker exec -it trino trino
```
* Execute os comandos contidos no `init.sql` para criar o schema e as tabelas.(É possível conferir em tempo real a criação das tabelas dentro do apache superset)
* Acesse o Apache superset e vá até SQL Lab para realizar querys nas tabelas.

## Melhorias Futuras
* Debugar a conexão spark -> hive, possibilitando o gerenciamento do catálogo diretamente via jupyter notebooks.
* Para testes podemos utilizar a lib Great Expectations para garantir a consitência dos dados.

