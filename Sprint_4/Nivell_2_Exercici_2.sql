SELECT
   dia AS Data,
   total_vendes AS Vendes_Avui,
   LAG(total_vendes) OVER (ORDER BY dia) AS Vendes_Ahir,
   ROUND(
       ((total_vendes - LAG(total_vendes) OVER (ORDER BY dia)) / NULLIF(LAG(total_vendes) OVER (ORDER BY dia), 0)) * 100,
       2) AS Diff_Percentual
FROM sprint3_gold.mv_daily_sales
ORDER BY dia;