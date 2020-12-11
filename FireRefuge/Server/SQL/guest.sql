CREATE TABLE public.guest (
	id int NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar(50) NULL,
	phone varchar(12) NULL,
	email varchar(50) NULL,
	status varchar(50) NULL,
	adults int NULL,
	children int NULL,
	pets int NULL
);
