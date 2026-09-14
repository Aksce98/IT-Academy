SELECT
   DATE(dia) AS Data,
   ROUND(total_vendes,2) AS Vendes,
   SUM(total_vendes) OVER (PARTITION BY EXTRACT(YEAR FROM dia) ORDER BY dia ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Vendes_Acumulades_YTD
FROM sprint3_gold.mv_daily_sales
ORDER BY dia;