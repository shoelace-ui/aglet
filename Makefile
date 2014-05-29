## Variables

STYLUS ?= ./node_modules/.bin/stylus
JADE ?= ./node_modules/.bin/jade
DIST_GUARD = @mkdir -p dist
PORT ?= 3020
SERVE ?= ./node_modules/.bin/serve

## Default target

dist: $(STYLUS) dist/index.css

## Installations

$(STYLUS):
	@npm install stylus

## Build targets

dist/index.css: $(wildcard lib/*) $(wildcard node_modules/shoelace-ui*/*.styl)
	$(DIST_GUARD)
	@$(STYLUS) \
	  --include node_modules \
	  < lib/index.styl > $@

## Misc

test:
	$(SERVE) . --port $(PORT) &
	open http://localhost:$(PORT)/$@/index.jade

clean:
	rm -fr build components

.PHONY: clean all test
