-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO clientes
  (nome, lealdade)
VALUES
  ('Georgia', 0);


-- 2)
INSERT INTO pedidos 
  (status, cliente_id)
VALUES
  ('Recebido', 6);


-- 3)
INSERT INTO produtos_pedidos
  (pedido_id, produto_id)
VALUES
  (6, 1),
  (6, 2),
  (6, 6),
  (6, 8),
  (6, 8);


-- Leitura

-- 1)
SELECT 
  c.id,
  c.nome,
  c.lealdade,
  pe.id,
  pe.status,
  pe.cliente_id,
  p.id,
  p.nome,
  p.tipo,
  p.preco,
  p.pts_de_lealdade
FROM produtos_pedidos p_p
JOIN clientes c ON c.id = p_p.pedido_id
JOIN pedidos pe ON pe.id = p_p.pedido_id
JOIN produtos p ON p.id = p_p.produto_id
WHERE c.id = 6;


-- Atualização

-- 1)
UPDATE clientes
SET lealdade = (SELECT SUM(p.pts_de_lealdade)
	FROM produtos_pedidos p_p
	JOIN clientes c ON c.id = p_p.pedido_id
	JOIN produtos p ON p.id = p_p.produto_id
	WHERE c.id = 6 AND c.nome = 'Georgia')
WHERE clientes.id = 6;

-- Deleção

-- 1)
DELETE FROM
	clientes 
WHERE 
	id = 4;

