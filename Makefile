.PHONY: examples

help:
	@echo "Generate HTML from a Bikeshed source document:"
	@echo "  make spec     Generate HTML"
	@echo "  make watch    Generate HTML each time the source changes"
	@echo "  make examples Generate examples answers"

spec:
	docker run --rm -v "`pwd`:/spec" -w /spec netwerkdigitaalerfgoed/bikeshed:1.7.0

watch:
	docker run --rm -v "`pwd`:/spec" -w /spec netwerkdigitaalerfgoed/bikeshed:1.7.0 sh -c "bikeshed watch"

examples:
	examples/n3/test
