UPDATE public.track
	SET IsLarge=True
	WHERE Bytes>=10000000;

UPDATE public.track
	SET IsLarge=False
	WHERE Bytes<=10000000;