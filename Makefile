# Find all markdown files
MARKDOWN=$(shell find . -iname "*.md")
# Form all 'html' counterparts
HTML=$(MARKDOWN:.md=.html)

.PHONY = all tar clean
all: $(HTML)

%.html: %.md
	pandoc --from markdown --to html $< -o $@

tar: $(MARKDOWN)
	tar --exclude=notes.tar.gz --exclude=.git/ -czvf notes.tar.gz ./

clean:
	rm $(HTML)
