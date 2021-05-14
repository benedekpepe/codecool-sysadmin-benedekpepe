ALTER TABLE public.customer
    ADD CONSTRAINT "accountID" FOREIGN KEY (customerid)
    REFERENCES public.account (accountid) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;