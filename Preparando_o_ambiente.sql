/*
Abra o Oracle SQL Developer.
Faça a conexão default, com a máquina local.
Você irá um novo usuário para criar um novo ambiente Oracle.
Primeiramente, execute o comando:
*/

ALTER SESSION SET "_ORACLE_SCRIPT" = true;

/*
Você está usando o usuário system.
Para criar o usuário cursoplsql, use o comando:
*/

CREATE USER cursoplsql IDENTIFIED BY cursoplsql
    DEFAULT TABLESPACE users;

-- Para dar privilégios de acesso a este usuário:
GRANT connect, resource TO cursoplsql;

/*
À esquerda, em Conexões, clique com o botão direito do mouse em cima de Oracle Conexões e selecione Nova Conexão.
O nome dessa nova conexão será CURSOPLSQL. Em Nome do Usuário, insira o usuário que você criou anteriormente e crie uma senha. Além disso, você pode clicar em Salvar Senha.
Teste e clique em Conectar.
Para criar o esquema mostrado, crie um novo script usando a conexão CURSO PLSQL.
Crie a tabela SEGMERCADO:
*/

CREATE TABLE segmercado (
    id        NUMBER(5),
    descricao VARCHAR2(100)
);

-- Agora crie a tabela CLIENTE:
CREATE TABLE cliente (
    id                   NUMBER(5),
    razao_social         VARCHAR2(100),
    cnpj                 VARCHAR2(20),
    segmercado_id        NUMBER(5),
    data_inclusao        DATE,
    faturamento_previsto NUMBER(10, 2),
    categoria            VARCHAR2(20)
);

-- Altere a tabela para criar a chave primária da tabela SEGMERCADO:
ALTER TABLE segmercado ADD CONSTRAINT segmercaco_id_pk PRIMARY KEY ( id );

-- Agora a chave primária para a tabela CLIENTE:
ALTER TABLE cliente ADD CONSTRAINT cliente_id_pk PRIMARY KEY ( id );

-- Para criar as chaves estrangeira na tabela CLIENTE, execute:
ALTER TABLE cliente
    ADD CONSTRAINT cliente_segmercado_id FOREIGN KEY ( segmercado_id )
        REFERENCES segmercado ( id );