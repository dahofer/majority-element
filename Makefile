TARGET = all

all: majority-element-hs majority-element-go majority-element-crystal
	@echo ""
	@echo "Crystal"; ./average -n 10 ./majority_element_cr medium-input.txt > /dev/null
	@echo ""
	@echo "Go"; ./average -n 10 ./majority-element-go --input-file=medium-input.txt > /dev/null
	@echo ""
	@echo "Ruby"; ./average -n 10 /usr/bin/env ruby ./majority_element.rb medium-input.txt > /dev/null
	@echo ""
	@echo "Haskell (compiled, small input file)"; ./average -n 10 ./majority-element-hs naive small-input.txt > /dev/null
	@echo ""
	@echo "Haskell (interpreted, small input file)"; ./average -n 10 runhaskell ./majority-element-hs.hs naive small-input.txt > /dev/null

majority-element-hs: majority-element-hs.hs
	ghc --make $?

majority-element-go: majority-element-go.go
	go build $?

majority-element-crystal: majority_element_cr.cr
	crystal build --release $?

clean:
	rm -f $(TARGET) majority_element_cr majority-element-go majority-element-hs majority-element-hs.hi majority-element-hs.o
