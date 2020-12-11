CREATE TABLE public.pet (
	id int NULL GENERATED ALWAYS AS IDENTITY,
	guestid int NULL,
	pettype varchar(50) NULL
);
