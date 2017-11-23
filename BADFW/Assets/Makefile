DIRECTORIES = $(wildcard Original/*)

.FORCE:

Original/%: .FORCE
	$(MAKE) -C Original/$*

all: $(DIRECTORIES)

print-% : ; @echo $* = $($*)
