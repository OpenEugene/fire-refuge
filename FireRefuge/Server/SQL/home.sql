CREATE TABLE public.home (
	id int NULL GENERATED ALWAYS AS IDENTITY,
	hostid int NULL,
	guestid int NULL,
	address varchar(50) NULL
);
