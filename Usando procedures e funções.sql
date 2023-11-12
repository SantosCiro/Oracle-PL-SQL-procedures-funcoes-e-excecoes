/*
Crie um novo script com a conexão CURSO PLSQL.
Para incluir um novo cliente, crie uma procedure incluir_cliente, executando o seguinte código:
*/

CREATE OR REPLACE PROCEDURE incluir_cliente
(
p_ID CLIENTE.ID%type,
p_RAZAO CLIENTE.RAZAO_SOCIAL%type,
p_CNPJ CLIENTE.CNPJ%type,
p_SEGMERCADO CLIENTE.SEGMERCADO_ID%type,
p_FATURAMENTO CLIENTE.FATURAMENTO_PREVISTO%type,
p_CATEGORIA CLIENTE.CATEGORIA%type
)
IS
BEGIN
   INSERT INTO CLIENTE
   VALUES 
   (p_ID, p_RAZAO, p_CNPJ, p_SEGMERCADO, SYSDATE, p_FATURAMENTO, p_CATEGORIA);
   COMMIT;
END;

/*
Execute o programa.
Mostre as tabelas e execute incluir_cliente:
*/

SELECT * FROM CLIENTE;
SELECT * FROM SEGMERCADO;
EXECUTE incluir_cliente (1, 'SUPERMERCADOS CAMPEAO', '1234567890', 1, 90000, 'MEDIO GRANDE');

-- Crie um novo script e exiba a saída na tela:
SET SERVEROUTPUT ON

/*O novo programa seguirá a seguinte regra

-- PEQUENO FATURA ATÉ 10000

-- MEDIO ENTRE 10001 E 50000

-- MEDIO GRANDE ENTRE 50001 E 100000

-- GRANDE MAIS DE 100000
*/

-- Crie o programa para classificar o cliente:
DECLARE
   v_FATURAMENTO CLIENTE.FATURAMENTO_PREVISTO%type := 120000;
   v_CATEGORIA CLIENTE.CATEGORIA%type;
BEGIN
   IF v_FATURAMENTO <= 10000 THEN
      v_CATEGORIA := 'PEQUENO';
   ELSIF v_FATURAMENTO <= 50000 THEN
      v_CATEGORIA := 'MÉDIO';
   ELSIF v_FATURAMENTO <= 100000 THEN
      v_CATEGORIA := 'MÉDIO GRANDE';
   ELSE
      v_CATEGORIA := 'GRANDE';
   END IF;
   dbms_output.put_line('A Categoria é ' || v_CATEGORIA);
END;

--  Em uma nova janela de script, crie a função categoria_cliente:
CREATE OR REPLACE FUNCTION categoria_cliente
(p_FATURAMENTO IN CLIENTE.FATURAMENTO_PREVISTO%type)
RETURN CLIENTE.CATEGORIA%type
IS
   v_CATEGORIA CLIENTE.CATEGORIA%type;
BEGIN
   IF p_FATURAMENTO <= 10000 THEN
      v_CATEGORIA := 'PEQUENO';
   ELSIF p_FATURAMENTO <= 50000 THEN
      v_CATEGORIA := 'MÉDIO';
   ELSIF p_FATURAMENTO <= 100000 THEN
      v_CATEGORIA := 'MÉDIO GRANDE';
   ELSE
      v_CATEGORIA := 'GRANDE';
   END IF;
   RETURN v_CATEGORIA;
END;

-- Declare a variável, execute a função categoria_cliente e imprima a variável v_categoria:
VARIABLE g_CATEGORIA VARCHAR2(100);
EXECUTE :g_CATEGORIA:=categoria_cliente(120000);
PRINT g_CATEGORIA;

/*
Complemente a procedure para calcular a categoria de cliente.
Primeiramente, crie uma nova área de script para escrever essa procedure.
O código da nova procedure será:
*/

CREATE OR REPLACE PROCEDURE incluir_cliente
(
p_ID CLIENTE.ID%type,
p_RAZAO CLIENTE.RAZAO_SOCIAL%type,
p_CNPJ CLIENTE.CNPJ%type,
p_SEGMERCADO CLIENTE.SEGMERCADO_ID%type,
p_FATURAMENTO CLIENTE.FATURAMENTO_PREVISTO%type
)
IS
v_CATEGORIA CLIENTE.CATEGORIA%type;
BEGIN

   v_CATEGORIA := categoria_cliente(p_FATURAMENTO);

   INSERT INTO CLIENTE
   VALUES 
   (p_ID, p_RAZAO, p_CNPJ, p_SEGMERCADO, SYSDATE, p_FATURAMENTO, v_CATEGORIA);
   COMMIT;
END;

-- Mostre o conteúdo de CLIENTE:
SELECT * FROM CLIENTE;

-- Execute a procedure para incluir os novos clientes, passando os parâmetros:
EXECUTE incluir_cliente(2, 'SUPERMERCADO DO VALE','11111111111',1,90000);
EXECUTE incluir_cliente(3, 'SUPERMERCADO CARIOCA','22222222222',1,30000);





















