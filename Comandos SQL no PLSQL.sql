/*
No Oracle SQL Developer, crie um novo script com a conex�o CURSO PLSQL.
Execute o comando INSERT:
*/

INSERT INTO segmercado (
    id,
    descricao
) VALUES (
    1,
    'Varejo'
);
-- Voc� receber� um erro.

--  Crie um novo script com a conex�o CONEX�O M�QUINA LOCAL e execute o seguinte comando:
ALTER USER cursoplsql
    QUOTA UNLIMITED ON users;

-- Volte ao script com a conex�o CURSO PLSQL e mostre o conte�do da tabela SEGMERCADO:
SELECT
    *
FROM
    segmercado;

-- Crie um programa para inserir dados na tabela, executando o seguinte c�digo:
DECLARE
    v_id        NUMBER(5) := 2;
    v_descricao VARCHAR2(100) := 'Industria';
BEGIN
    INSERT INTO segmercado (
        id,
        descricao
    ) VALUES (
        v_id,
        v_descricao
    );

    COMMIT;
END;

-- Utilize o comando %type:
DECLARE
    v_id        segmercado.id%TYPE := 3;
    v_descricao segmercado.descricao%TYPE := 'Atacado';
BEGIN
    INSERT INTO segmercado (
        id,
        descricao
    ) VALUES (
        v_id,
        v_descricao
    );

    COMMIT;
END;

-- Exiba o conte�do da tabela SEGMERCADO:
SELECT
    *
FROM
    segmercado;

/*
Crie um script novo, usando a conex�o CURSO PLSQL.
Mostre o conte�do de SEGMERCADO, usando as op��es da palavra atacado, com as sele��es:
*/

SELECT
    *
FROM
    segmercado;

SELECT
    *
FROM
    segmercado
WHERE
    descricao = 'Atacado';

SELECT
    *
FROM
    segmercado
WHERE
    descricao = 'atacado';

-- Use a fun��o UPPER:
SELECT
    *
FROM
    segmercado
WHERE
    upper(descricao) = 'ATACADO';

-- Fa�a o programa, executando os c�digos:
DECLARE
    v_id        segmercado.id%TYPE := 4;
    v_descricao segmercado.descricao%TYPE := 'Atacado';
BEGIN
    INSERT INTO segmercado (
        id,
        descricao
    ) VALUES (
        v_id,
        upper(v_descricao)
    );

    COMMIT;
END;

-- Apague o registro onde o ID � 4:
DELETE FROM segmercado
WHERE
    id = 4;

/*
Crie um novo script vazio.
Mostre o conte�do da tabela SEGMERCADO:
*/

SELECT
    *
FROM
    segmercado;

-- Use o comando UPDATE para alterar a tabela:
DECLARE
    v_id        segmercado.id%TYPE := 3;
    v_descricao segmercado.descricao%TYPE := 'Atacadista';
BEGIN
    UPDATE segmercado
    SET
        descricao = upper(v_descricao)
    WHERE
        id = v_id;

    v_id := 1;
    v_descricao := 'Varejista';
    UPDATE segmercado
    SET
        descricao = upper(v_descricao)
    WHERE
        id = v_id;

    v_id := 2;
    v_descricao := 'Industrial';
    UPDATE segmercado
    SET
        descricao = upper(v_descricao)
    WHERE
        id = v_id;

    COMMIT;
END;

/*
Crie uma nova conex�o com CURSO PLSQL.
Execute os seguintes comandos:
*/

DECLARE
    v_id        segmercado.id%TYPE := 5;
    v_descricao segmercado.descricao%TYPE := 'Esportistas';
BEGIN
    INSERT INTO segmercado (
        id,
        descricao
    ) VALUES (
        v_id,
        upper(v_descricao)
    );

    COMMIT;
END;

-- Para excluir o ID 5, execute o c�digo:
DECLARE
    v_id segmercado.id%TYPE := 5;
BEGIN
    DELETE FROM segmercado
    WHERE
        id = v_id;

    COMMIT;
END;

-- Para fazer uma inclus�o de segmento de mercado na tabela SEGMERCADO, execute:
DECLARE
    v_id        segmercado.id%TYPE := 4;
    v_descricao segmercado.descricao%TYPE := 'Atacado';
BEGIN
    INSERT INTO segmercado (
        id,
        descricao
    ) VALUES (
        v_id,
        upper(v_descricao)
    );

    COMMIT;
END;

-- Veja a altera��o do segmento de mercado na tabela:
DECLARE
    v_id        segmercado.id%TYPE := 3;
    v_descricao segmercado.descricao%TYPE := 'Atacadista';
BEGIN
    UPDATE segmercado
    SET
        descricao = upper(v_descricao)
    WHERE
        id = v_id;

    COMMIT;
END;

-- Exclua um segmento de mercado em SEGMERCADO:
DECLARE
    v_id segmercado.id%TYPE := 5;
BEGIN
    DELETE FROM segmercado
    WHERE
        id = v_id;

    COMMIT;
END;