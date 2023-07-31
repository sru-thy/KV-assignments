create table public."user" (
"created_at" TIMESTAMP not null default now(),
"updated_at" TIMESTAMP not null default now(),
"deleted_at" TIMESTAMP,
"id" uuid not null default uuid_generate_v4(),
"name" character varying not null,
"username" character varying not null,
"password" character varying,
"phone_number" integer not null,
constraint "PK_3c2bc72f03fd5abbbc5ac16498" primary key ("id")
);

create table public."user_address"(
"created_at" TIMESTAMP not null default now(),
"updated_at" TIMESTAMP not null default now(),
"deleted_at" TIMESTAMP,
"id" uuid not null default uuid_generate_v4(),
"address_line_1" character varying not null,
"address_line_2" character varying not null,
"address_line_3" character varying not null,
"pincode" character varying not null,
"user_id" uuid not null
);


create table public."product"(
"created_at" TIMESTAMP not null default now(),
"updated_at" TIMESTAMP not null default now(),
"deleted_at" TIMESTAMP,
"id" uuid not null default uuid_generate_v4(),
"name" character varying not null,
"description" character varying not null,
"price" float not null,
"sku" character varying,
"category_id" uuid not null,
constraint "PK_3c2bc72f03fd5abbbc5ac16408" primary key ("id")
);


create table public."product_category"(
"created_at" TIMESTAMP not null default now(),
"updated_at" TIMESTAMP not null default now(),
"deleted_at" TIMESTAMP,
"id" uuid not null default uuid_generate_v4(),
"name" character varying not null
)

create table public."product_category_map"(
"product_id" uuid not null,
"category_id" uuid not null
)

create table public."order_details"(
"created_at" TIMESTAMP not null default now(),
"updated_at" TIMESTAMP not null default now(),
"deleted_at" TIMESTAMP,
"id" uuid not null default uuid_generate_v4(),
"ordered_user_id" uuid not null,
"total" float not null,
constraint "PK_3c2bc72f03fd5abbbc5ac16608" primary key ("id")
);

create table public."order_items"(
"created_at" TIMESTAMP not null default now(),
"updated_at" TIMESTAMP not null default now(),
"deleted_at" TIMESTAMP,
"id" uuid not null default uuid_generate_v4(),
"order_id" uuid not null,
"product_id" uuid not null,
"quantity" integer not null,
constraint "PK_3c2bc72f03fd5abbbc5ac17408" primary key ("id")
);

INSERT INTO public."user"
("name", username, "password", phone_number)
values('sruthy', 'sruthy123', 'sruthy@123', 1234567890),
('sneha', 'sneha123', 'sneha@123', 0987654321),
('arya', 'arya123', 'arya@123', 1234509876);

INSERT INTO public.user_address
(address_line_1, address_line_2, address_line_3, pincode, user_id)
VALUES('line1', 'line2', 'line3', '123456', 'b0ccc9f9-b71e-44a6-a685-816e39d4dad7'),
('line1', 'line2', 'line3', '123456', '20a44d0e-24a1-4392-9953-c4c0c8829a56' ),
('line1', 'line2', 'line3', '123456', '3c3bf0c6-8d1a-4fe1-bf07-c97fa8d7b6c2' );

INSERT INTO public.user_address
(address_line_1, address_line_2, address_line_3, pincode, user_id)
VALUES('line1new', 'line2new', 'line3new', '123456new', 'b0ccc9f9-b71e-44a6-a685-816e39d4dad7');

INSERT INTO public.product
("name", description, price, sku)
VALUES('product1', 'description1', 10, 'sku-1'),
('product2', 'description2', 15, 'sku-2'),
('product3', 'description3', 20, 'sku-3'),
('product4', 'description4', 25, 'sku-4'),
('product5', 'description5', 30, 'sku-5');


INSERT INTO public.product_category
("name")
VALUES('category1'),
('category2'),
('category3');

INSERT INTO public.product_category_map (product_id, category_id)
values
((select id from product where "name"='product1'), (select id from product_category where "name"='category1')),
((select id from product where "name"='product2'), (select id from product_category where "name"='category2')),
((select id from product where "name"='product3'), (select id from product_category where "name"='category3')),
((select id from product where "name"='product4'),(select id from product_category where "name"='category1')),
((select id from product where "name"='product5'), (select id from product_category where "name"='category2'));


INSERT INTO public.order_details
(ordered_user_id, total)
values
( 'b0ccc9f9-b71e-44a6-a685-816e39d4dad7',150),
('20a44d0e-24a1-4392-9953-c4c0c8829a56',170),
('3c3bf0c6-8d1a-4fe1-bf07-c97fa8d7b6c2',200),
('3c3bf0c6-8d1a-4fe1-bf07-c97fa8d7b6c2',500),
('20a44d0e-24a1-4392-9953-c4c0c8829a56',255);

INSERT INTO public.order_items
(order_id, product_id, quantity)
values
('376bfb41-1828-40ba-8e6d-e79a753b7b6e',(select id from product  where name='product1'), 1),
('376bfb41-1828-40ba-8e6d-e79a753b7b6e',(select id from product  where name='product2'), 2),
('f058ce44-4c43-4714-9f33-f5bba3651487',(select id from product  where name='product3'), 3),
('670e0576-4796-4986-a6bc-4f5d28cf4477',(select id from product  where name='product4'), 1),
('9b04fc0c-5561-4438-b413-6d8c999852c3',(select id from product  where name='product5'), 1),
('b8cd82a2-9528-403f-8251-2e0dba916083',(select id from product  where name='product4'), 2);

create index user_name on user("name");

create index "product_name"
on "product" ("name");

create index "product_category_name"
on "product_category" ("name");