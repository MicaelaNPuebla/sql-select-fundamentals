# ¿Por qué es mala práctica usar SELECT * en producción? Mencioná al menos dos razones concretas (rendimiento, mantenibilidad, seguridad).

Usar 'SELECT *' está bien para explorar una tabla o validar los datos que se cargaron (por ejemplo, al revisar una tabla creada), pero en un reporte de producción es una mala páctica por tres razones concretas:

**Rendimiento:** 'SELECT *' trae todas las columnas, incluidas las que nadie pidió. Sobre una tabla con muchas columnas y millones de filas, significa que se leerán más datos, más memoria y una consulta más lenta. Si finanzas sólo necesita el cliente, el producto y el monto, pedir 40 columnas de 'sales' sería ineficiente.

**Seguridad:** Al traer todo, la consulta puede exponer columnas sensibles que no deberían salir en un reporte (datos personales de clientes, costos internos, etc.). Al seleccionar sólo las columnas necesarias, evito filtrar información que nadie pidió.

**Mantenibilidad:** Si un reporte usa 'SELECT *' y otra persona agrega una columna nueva a la tabla o cambia el orden de las columnas, Power BI o Excel recibe columnas que no esperaba y puede romperse o mostrar datos en el lugar equivocado sin avisar. En cambio, si la consulta nombra las columnas con 'SELECT customer_id, product_id, total_amount' siempre devolverá lo mismo sin importar cómo cambie la tabla.

**Buenas pácticas:** 'SELECT *' para explorar uno mismo; columnas específicas paraentregar a otras áreas/personas.

# ¿Por qué son importantes los alias para un stakeholder no técnico? Explicá con un ejemplo concreto cómo un alias transforma total_amount en algo que cualquier persona del área de finanzas puede interpretar directamente.

El alias 'AS' renombra la columna en el resultado de la consulta, sin modificar la tabla real, para que el encabezado sea legible para quienes lo reciben.

**Ejemplo:**

Los nombres de columnas en una base de datos suelen estar en inglés y en formato técnico: 'total_amount'. Una persona del área de finanzas que no conoce la base, no tiene por qué saber que 'total_amount' es el monto de la venta.

Por lo tanto, ingresamos:

SELECT total_amount AS monto_total FROM sales;

Sin el alias, finanzas recibe una columna llamada 'total_amount' y tiene que preguntarse qué significa. Con el alias, reciben una columna llamada 'monto_total', que cualquiera del área interpreta como 'el monto total de la venta', sin conocer la base de datos ni pedir aclaraciones.

**Esto, además, prepara los datos para reportes:**
Si estos resultados se llevan a POWER BI o Excel, los encabezados ya salen con nombres profesionales y en español. Listos para presentar.

**Buenas prácticas de alias:** Usar siempre guión bajo, sin espacios. 'monto_total', no 'Monto Total'. Un alias con espacios obliga a usar comillas dobles y es menos prolijo.