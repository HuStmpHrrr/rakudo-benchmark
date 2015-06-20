TARGETS=$(addsuffix .class, $(basename $(wildcard *.java)))
.PHONY: main clean 

main:${TARGETS}

${TARGETS}: %.class: %.java
	javac $<

clean:
	rm -rf *.class
