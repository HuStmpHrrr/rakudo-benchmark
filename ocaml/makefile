TARGETS=$(basename $(wildcard *.ml))
.PHONY:main clean

main:${TARGETS}

${TARGETS}: %: %.ml
	ocamlc -o $@ unix.cma $<
	chmod +x $@

clean:
	rm -rf *.cmi *.cmo
	for f in *; do if [ -x $$f ] && [ $$f != run.sh ]; then rm -f $$f; fi; done
