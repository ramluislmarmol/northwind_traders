# Project Description

## Rationale
This project aims to analyze the famous Northwind Traders dataset using an multipage interactive Power BI dashboard connected to a MySQL database. The goal of this project is to provide the top management for at-a-glance analysis of the current performance of the company. Focusing on implementing slicers and making use of a multipage report.

## Project Output
### Dashboard
The dashboard is split into 4 pages, Revenue, Customers, Employee and Products.

![northwind_traders_page1.jpg](powerbi/exports/northwind_traders_page1.jpg)
![northwind_traders_page2.jpg](powerbi/exports/northwind_traders_page2.jpg)
![northwind_traders_page3.jpg](powerbi/exports/northwind_traders_page3.jpg)
![northwind_traders_page4.jpg](powerbi/exports/northwind_traders_page4.jpg)

### Interactivity Demonstration
![northwind_traders.gif](powerbi/exports/northwind_traders.gif)

## Tools and Methodology
### MySQL
I used MySQL to host the main database. I used `LOAD DATA LOCAL INFILE` to load the data from my csv's to the database.
### Power BI
I used a lot of DAX expressions to aggregate and slice data.

## Learnings and Conclusion
Most of my learnings for this project comes from dashboard building, specifically about how `CALCULATE()` and slicer visuals work together. It also taught me about making a separate `date_table` for dates and manipulation.

rllm-lmgc