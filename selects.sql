-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT 
 p.id,
 p.status,
 p.cliente_id,
 pr.id,
 pr.nome,
 pr.tipo,
 pr.preco,
 pr.pts_de_lealdade
FROM pedidos p
JOIN produtos_pedidos  p_p ON p.id = p_p.pedido_id
JOIN produtos  pr ON pr.id = p_p.produto_id;

-- 2)
SELECT 
  pedido_id
FROM produtos_pedidos  p_p
WHERE p_p.produto_id = 6;

-- 3)
SELECT 
  c.nome AS gostam_de_fritas
FROM produtos_pedidos p_p
JOIN clientes c ON c.id = p_p.pedido_id
JOIN pedidos p ON p.cliente_id = c.id
WHERE p_p.produto_id = 6;

-- 4)
SELECT 
  SUM(p.preco)
FROM produtos_pedidos p_p
JOIN clientes c ON c.id = p_p.pedido_id
JOIN produtos p ON p.id = p_p.produto_id
WHERE c.id = 5;

-- 5)
SELECT p.nome, COUNT(*) 
FROM produtos_pedidos pp 
JOIN produtos p ON p.id = pp.produto_id
GROUP BY p.nome;