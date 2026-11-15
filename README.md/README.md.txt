## Business Rules and Definitions

All revenue figures in this project follow these rules:

- **Line revenue** = quantity x unit_price x (1 - discount_pct / 100)
- **Order revenue** = the sum of the line revenue of all items in the order
- **Cancelled orders are excluded** from every revenue and sales figure
  (74 of 2,198 orders), because no sale took place.
- **Returned orders are included** (110 orders), so revenue is *gross revenue*
  before returns. Return rates are analyzed separately.
- **Profit** = line revenue - (quantity x unit_cost)
- **Average order value** = total revenue / number of non-cancelled orders
- **Analysis period:** 1 January 2024 to 31 December 2025

In SQL, this is written as:

    WHERE o.status <> 'Cancelled'

## Data Quality

Four integrity checks were run before the analysis: orders with no customer,
items with zero or negative quantity, orders dated before the customer signed
up, and duplicate emails. All returned zero issues. 26 registered customers
have never placed an order.