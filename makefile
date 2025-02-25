.PHONY: test
test:
	rm -rf coverage && mkdir -p coverage && \
	flutter test --coverage && \
	lcov -r coverage/lcov.info "lib/**.g.dart" "lib/**.freezed.dart" "lib/**.gr.dart" -o coverage/lcov.info --ignore-errors unused && \
	genhtml coverage/lcov.info -o coverage
