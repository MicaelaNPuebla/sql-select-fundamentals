-- ══════════════════════════════════════════
-- TechStore — Consultas Básicas SELECT
-- Autor: Micaela Puebla
-- Fecha: 18-08-2026
-- ══════════════════════════════════════════

-- Consulta 1: Exploración general de la tabla sales
-- SELECT * sirve para explorar una tabla nueva o validar que los datos
-- se cargaron bien (como al revisar mis tablas creadas en entregables anteriores).
-- NO conviene utilizar en un reporte para finanzas, ya que puede traer columnas innecesarias,
-- se vuelve más lento y puede exponer datos sensibles que no pidieron.
-- Para entregar, se piden sólo las columnas necesarias.
SELECT * FROM sales;

-- Consulta 2: Selección de columnas específicas para finanzas
SELECT customer_id, product_id, total_amount FROM sales;

-- Consulta 3: Selección con alias en español para stakeholders
SELECT order_date AS fecha_pedido, product_name AS nombre_producto, quantity AS cantidad_unidades FROM sales;