# MySQLTFP
This repo contains example sql files to show how MySQL Triggers, Functions and Procedures work.

## Setup 
**1. Initialise a database using any method you prefer, i recommend using docker.** 

**2. Create the Schema**  
Execute create_db.sql in your query console

**3. Add products to the product table via your query console.**

**4. Load Logic**  
Execute process_order.sql, check_stock.sql and after_order_insert_trigger.sql in your query console

## Procedures

When called, the procedure will check if there is sufficient stock to place an order.

If yes it logs substracted stock in the inventory log and submits an order.
It will also reduce the available stock in the products table.

If not, it will create a rejected order. 

## Triggers

On a successfull insertion into the the order table, the trigger will automatically
further the order to shipments table.

## Functions 

When called will check if sufficient stock is available, it will return a boolean. 

## Summary

Using stored procedures, functions, and triggers allows you to embed business rules directly into the database layer. This can be especially powerful in systems where:

    Data integrity and consistency are critical (e.g., inventory, finance, or logistics).

    You want to enforce rules close to the data, independent of the application code.

    Multiple applications or teams interact with the same database, and centralizing logic reduces duplication.

For example, in this MySQLTFP setup:

    A process_order procedure ensures orders are only placed when stock is available.

    A trigger automatically forwards confirmed orders to shipment.

    A function checks stock availability consistently across calls.

This reduces the risk of logic being bypassed or inconsistently implemented in the application layer.  
### Trade-offs and Challenges  

While this approach has strengths, there are notable disadvantages:  
Maintainability  

    Database logic is often harder to track, version, and refactor compared to code in a standard language like JavaScript or Python.

    IDE support, linting, and debugging tools for SQL logic are less mature.

Testing  

    Automated testing of stored procedures and triggers is more complex than unit tests in code.

    Mocking or isolating behavior is difficult — especially for triggers, which are invisible and implicit.

    Debugging failures often requires logging or manual database inspection.

Team Familiarity  

    Many developers are more comfortable writing logic in application code than in SQL.

    Specialized knowledge of procedural SQL (like MySQL’s dialect) can limit collaboration or slow onboarding.
