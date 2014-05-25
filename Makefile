PORT ?= 3020
SERVE ?= ./node_modules/.bin/serve

test:
	$(SERVE) . --port $(PORT) &
	open http://localhost:$(PORT)/$@/index.jade

.PHONY: test
