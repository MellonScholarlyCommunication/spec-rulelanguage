.PHONY: spec watch examples

help:
	@echo "Generate HTML from a Bikeshed source document:"
	@echo "  make spec     Generate HTML"
	@echo "  make watch    Generate HTML each time the source changes"
	@echo "  make examples Generate examples answers"

spec:
	docker run --rm -v "`pwd`:/spec" -w /spec netwerkdigitaalerfgoed/bikeshed:1.7.0

watch:
	docker run --rm -v "`pwd`:/spec" -w /spec netwerkdigitaalerfgoed/bikeshed:1.7.0 sh -c "bikeshed watch"

DATA = examples/data
N3 = $(DATA)/coar_endorsement_success.n3	$(DATA)/coar_review_reject.n3	\
     $(DATA)/coar_review_success.n3       $(DATA)/coar_review_accept.n3 \
		 $(DATA)/coar_review_request.n3 \
		 $(DATA)/mellon_accept.n3						  $(DATA)/mellon_announce_with_inreplyto.n3 \
		 $(DATA)/mellon_reject.n3             $(DATA)/mellon_announce.n3		\
		 $(DATA)/mellon_offer.n3

n3: $(N3)

examples: $(N3)
	examples/n3/test

examples/data/%.n3: examples/data/%.jsonld
	bin/convert_rdf $< NT > $@
