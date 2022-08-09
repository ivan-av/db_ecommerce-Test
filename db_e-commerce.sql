----- Ecommerce Database -----
-- Iván Daniel Campos --

-- Creation of the table USERS
CREATE TABLE "users" (
  "id" serial PRIMARY KEY,
  "first_name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "telephone" int,
  "password" varchar NOT NULL
);

-- Creation of the table PRODUCTS
CREATE TABLE "products" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "description" text,
  "price" decimal NOT NULL,
  "categories_id" int
);

-- Creation of the table CARTS
CREATE TABLE "carts" (
  "id" serial PRIMARY KEY,
  "quantity" int,
  "users_id" int,
  "products_id" int
);

-- Creation of the table CATEGORIES
CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

-- Creation of the table ORDERS
CREATE TABLE "orders" (
  "id" serial PRIMARY KEY,
  "quantity" int,
  "users_id" int,
  "products_id" int
);

-- Adding foreign keys to the tables
ALTER TABLE "orders" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "carts" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "products" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("products_id") REFERENCES "products" ("id");

ALTER TABLE "carts" ADD FOREIGN KEY ("products_id") REFERENCES "products" ("id");
