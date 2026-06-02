.PHONY: all
all: publish

.PHONY: publish
publish: book.html
	mkdir -p site
	mv $< site/index.html

.PHONY: html
html: book.html

# book.html should depend on all Org sources
book.html: book.org
	emacs --batch \
	  --load org \
	  --visit $< \
	  --funcall org-html-export-to-html

.PHONY: clean
clean:
	rm -rf book.html site
