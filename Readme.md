## Overview

The Football Ticket Booking System is a university database assignment designed to model a simple football match ticket booking process. The project uses PostgreSQL and includes a relational database schema, sample data, an ERD, and SQL queries for retrieving booking and match information.

## Database Name

```text
football_ticket_booking
```

## Tables

### Users

Stores user information for football fans and ticket managers.

- `user_id` Primary Key
- `full_name`
- `email`
- `role`
- `phone_number`

### Matches

Stores football match information and ticket pricing details.

- `match_id` Primary Key
- `fixture`
- `tournament_category`
- `base_ticket_price`
- `match_status`

### Bookings

Stores ticket booking records made by users for football matches.

- `booking_id` Primary Key
- `user_id` Foreign Key
- `match_id` Foreign Key
- `seat_number`
- `payment_status`
- `total_cost`

## Relationships

- One user can make many bookings.
- One match can have many bookings.
- Each booking belongs to one user.
- Each booking belongs to one match.

## ERD Overview

The ERD contains three entities: `Users`, `Matches`, and `Bookings`.

Relationships:

- `Users (1) ------< Bookings`
- `Matches (1) ----< Bookings`

The Mermaid ERD is available in:

```text
doc/erd.md
```

## Project Structure

```text
Football Ticket Booking System/
+-- schema.sql
+-- insert.sql
+-- query.sql
+-- README.md
+-- doc/
    +-- erd.md
```

## How to Run

Use PostgreSQL to create the database and execute the SQL files in the correct order.

First, create the database:

```sql
CREATE DATABASE football_ticket_booking;
```

Then connect to the database:

```sql
\c football_ticket_booking
```

Run the SQL files in the execution order shown below.

## Execution Order

1. `schema.sql`
2. `insert.sql`
3. `query.sql`



