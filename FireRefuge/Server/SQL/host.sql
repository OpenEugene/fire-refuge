CREATE TABLE public.host (
	id int NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar(50) NULL,
	phone varchar(12) NULL,
	email varchar(50) NULL,
	wantsincentives bool NULL
);
