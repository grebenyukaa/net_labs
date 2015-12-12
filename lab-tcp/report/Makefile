#
# Простейший Makefile для создания отчёта
#

PDF=report.pdf

# Используемые программы
PDFLATEX = xelatex -interaction=nonstopmode -shell-escape

LAB=../net

TEX=tex
TEXCOMMON = ../../tex/common
INCLUDES = $(TEX)/includes

.PHONY: clean
all : $(PDF)
report : $(PDF)

# Создание из исходного кода тех-файлов.
# $<  -- исходный файл, $@ --файл цели.

$(INCLUDES)/%.pdf : $(INCLUDES)/%.tex
	$(PDFLATEX) -output-directory=$(INCLUDES) $<

# Основная цель сборки --- отчет
$(PDF) : $(TEX)/report.tex $(TEXCOMMON)/header.tex
	cd $(TEX) && $(PDFLATEX) report.tex && $(PDFLATEX) report.tex && cp $(PDF) ..

# Удаление ВСЕХ временных файлов
clean:
	find $(TEX)/ -regextype posix-egrep -type f ! -regex ".*\.(sty|tex|clo|cls|bib|bst|gitignore)" -exec $(RM) {} \; ;

