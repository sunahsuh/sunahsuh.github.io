CSS_SRC = $(wildcard css/*.styl)

build: clean css
	cat css/build.css css/highlight/ascetic.css | cleancss -o css/build.css -d
	gzip -9 -c < css/build.css > css/build.css.gz

css: $(CSS_SRC)
	stylus -l -u ~/node_modules/nib < $(CSS_SRC) > css/build.css

clean:
	rm -rf css/build.css

.PHONY: clean css
