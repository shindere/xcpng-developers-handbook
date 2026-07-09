# Source files of the book
# To keep the list simple and easy to read:
#   - One file name per line
#   - No attempt to factor directory names
#   - Book's main file (book.org) as the first file
#   - Other files in their order of inclusion in book.org
SOURCE_FILES := \
  ./book.org \
  ./introduction.org \
  ./part1/part1.org \
  ./part1/chapter1.org \
  ./part1/chapter2.org \
  ./part2/part2.org \
  ./part2/chapter3.org \
  ./part2/chapter4.org \
  ./part2/chapter5.org \
  ./part2/chapter6.org \
  ./part3/part3.org \
  ./part3/chapter7.org \
  ./part4/part4.org \
  ./part4/chapterx.org \
  ./part4/chapterxplus1.org \
  ./part4/chapterxplus2.org \
  ./conclusion.org

# List of files to be published

PUBLIC_FILES := $(addprefix site/,\
  xcpng-developers-handbook.html)

.PHONY: all
all: $(PUBLIC_FILES)

.PHONY: html
html: site/xcpng-developers-handbook.html

site/xcpng-developers-handbook.html: $(SOURCE_FILES)
	emacs --batch \
	  --load org \
	  --visit $< \
	  --eval "(org-export-to-file 'html \"$@\")"

.PHONY: clean
clean:
	rm -f $(PUBLIC_FILES)
