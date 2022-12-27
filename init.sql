CREATE SCHEMA IF NOT EXISTS hive.sicredi
WITH (location = 's3a://sicredi/');

CREATE TABLE IF NOT EXISTS hive.sicredi.movimento (
  id               INT,
  vlr_transacao    DOUBLE,
  des_transacao    VARCHAR,
  data_movimento   VARCHAR,
  id_cartao        BIGINT
)
WITH (
  external_location = 's3a://sicredi/movimento',
  format = 'PARQUET'
);

CREATE TABLE IF NOT EXISTS hive.sicredi.cartao (
  id_associado   INT,
  id_conta       INT,
  nom_impresso   VARCHAR,
  num_cartao     BIGINT,
  id             BIGINT
)
WITH (
  external_location = 's3a://sicredi/cartao',
  format = 'PARQUET'
);


CREATE TABLE IF NOT EXISTS hive.sicredi.conta (
  tipo           VARCHAR,
  id             INT,
  data_criacao   VARCHAR,
  id_associado   INT
)
WITH (
  external_location = 's3a://sicredi/conta',
  format = 'PARQUET'
);

CREATE TABLE IF NOT EXISTS hive.sicredi.associado (
  idade           INT,
  sobrenome       VARCHAR,
  nome            VARCHAR,
  id              INT,
  email           VARCHAR
)
WITH (
  external_location = 's3a://sicredi/conta',
  format = 'PARQUET'
);

CREATE TABLE IF NOT EXISTS hive.sicredi.movimento_flat (
  data_movimento                 VARCHAR,
  desc_transacao_movimento       VARCHAR,
  vlr_transacao_movimento        DOUBLE,
  nome_impresso_cartao           VARCHAR,
  numero_cartao                  BIGINT,
  tipo_conta                     VARCHAR,
  data_criacao_conta             VARCHAR,
  nome_associado                 VARCHAR,
  sobrenome_associado            VARCHAR,
  idade_associado                INT,



)
WITH (
  external_location = 's3a://sicredi/movimento_flat',
  format = 'PARQUET'
);

