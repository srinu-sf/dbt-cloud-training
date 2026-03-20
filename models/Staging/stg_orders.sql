SELECT 
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ORDERSELLINGPRICE - o.ORDERCOSTPRICE AS ORDERPROFIT,
o.ORDERSELLINGPRICE,
o.ORDERCOSTPRICE,
c.customername,
c.segment,
c.country,
p.category,
p.productname,
p.subcategory
  FROM {{ ref('raw_orders') }} o
 left join {{ ref('raw_customers') }} c on o.customerid = c.customerid
 left join {{ ref('raw_products') }} p  on o.productid = p.productid