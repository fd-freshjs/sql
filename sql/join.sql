

/* JOINS */

SELECT brand, id FROM phones
JOIN phones_to_orders ON id = phone_id
WHERE order_id = 19;


/*  */