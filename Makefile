TAG ?=
VERSION := $(patsubst v%,%,$(TAG))

.PHONY: release
release:
	@if [ -z "$(TAG)" ]; then \
		echo "TAG is required (e.g. TAG=v0.0.3)"; \
		exit 1; \
	fi
	@if [ -z "$(VERSION)" ]; then \
		echo "Unable to derive version from TAG=$(TAG)"; \
		exit 1; \
	fi
	@if ! git diff --quiet || ! git diff --cached --quiet; then \
		echo "Working tree must be clean"; \
		exit 1; \
	fi
	@if git rev-parse -q --verify "refs/tags/$(TAG)" >/dev/null; then \
		echo "Tag $(TAG) already exists"; \
		exit 1; \
	fi
	@if sed --version >/dev/null 2>&1; then \
		sed -i "s/\"version\"[[:space:]]*:[[:space:]]*\"[^\"]*\"/\"version\": \"$(VERSION)\"/" package.json; \
	else \
		sed -i '' "s/\"version\"[[:space:]]*:[[:space:]]*\"[^\"]*\"/\"version\": \"$(VERSION)\"/" package.json; \
	fi
	@git add package.json
	@git commit -s -m "release $(VERSION)"
	@git tag -a "$(TAG)" -m "release $(VERSION)"
	@git push origin HEAD
	@git push origin "$(TAG)"
