/*
No Oracle SQL Developer, crie um novo script com a conexão CURSO PLSQL.
Execute o comando INSERT:
*/

INSERT INTO segmercado (
    id,
    descricao
) VALUES (
    1,
    'Varejo'
);
-- Você receberá um erro.

--  Crie um novo script com a conexão CONEXÃO MÁQUINA LOCAL e execute o seguinte comando:
ALTER USER cursoplsql
    QUOTA UNLIMITED ON users;

-- Volte ao script com a conexão CURSO PLSQL e mostre o conteúdo da tabela SEGMERCADO:
SELECT
    *
FROM
    segmercado;

-- Crie um programa para inserir dados na tabela, executando o seguinte código:
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

-- Exiba o conteúdo da tabela SEGMERCADO:
SELECT
    *
FROM
    segmercado;

/*
Crie um script novo, usando a conexão CURSO PLSQL.
Mostre o conteúdo de SEGMERCADO, usando as opções da palavra atacado, com as seleções:
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

-- Use a função UPPER:
SELECT
    *
FROM
    segmercado
WHERE
    upper(descricao) = 'ATACADO';

-- Faça o programa, executando os códigos:
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

-- Apague o registro onde o ID é 4:
DELETE FROM segmercado
WHERE
    id = 4;

/*
Crie um novo script vazio.
Mostre o conteúdo da tabela SEGMERCADO:
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
Crie uma nova conexão com CURSO PLSQL.
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

-- Para excluir o ID 5, execute o código:
DECLARE
    v_id segmercado.id%TYPE := 5;
BEGIN
    DELETE FROM segmercado
    WHERE
        id = v_id;

    COMMIT;
END;

-- Para fazer uma inclusão de segmento de mercado na tabela SEGMERCADO, execute:
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

-- Veja a alteração do segmento de mercado na tabela:
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