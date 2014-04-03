
all: dist/index.css examples

dist/index.css: src/index.styl
	stylus < $^ > $@

%.html: %.jade
	jade < $^ > $@

examples: examples/index.html

.PHONY: examples
