/* Fiddy Cent is a digital currency exchange headquartered in Neo Tokyo. They broker exchanges of Bitcoin, Bitcoin Cash, Ethereum, and Litecoin with fiat currencies in around 50 countries.

Analyzing their January ledger data using SQL aggregate functions! You are given the transactions table, which contains both money-in and money-out transactions.
*/

SELECT *
FROM transactions;
SELECT SUM(money_in)
FROM transactions;
SELECT SUM(money_out)
FROM transactions;
SELECT COUNT(money_in)
FROM transactions
WHERE money_in IS NOT NULL;
SELECT COUNT(money_in)
FROM transactions
WHERE currency LIKE '%BIT%';
SELECT MAX(money_in)
FROM transactions;

SELECT MAX(money_out)
FROM transactions;
SELECT AVG(money_in)
FROM transactions
WHERE currency LIKE '%ETH%';

SELECT date, ROUND(AVG(money_in), 2) AS came, ROUND(AVG(money_out), 2) AS gone
FROM transactions
GROUP BY date;