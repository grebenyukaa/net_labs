#
# Простейший Makefile для создания отчёта
#

PDF=report.pdf

# Используемые программы
PDFLATEX = xelatex -interaction=nonstopmode -shell-escape
D2T=utils/dot2tex -f pgf  --crop --prog=neato
BP=utils/bindparser
L2D=utils/lab2dot

LAB=../net

TEX=tex
TEXCOMMON = ../../tex/common
INCLUDES = $(TEX)/includes

.PHONY: clean
all : $(PDF)
report : $(PDF)

# Создание из исходного кода тех-файлов.
# $<  -- исходный файл, $@ --файл цели.

# Файл на языке Graphviz, который создается по лабе.
graphs/network.gv: $(LAB)/lab.conf $(LAB)/*/etc/network/interfaces
	$(L2D) $(LAB) $@

# Файл на языке Graphviz, который создается по настройкам DNS.
graphs/dns.gv: $(LAB)/lab.conf $(LAB)/*/etc/bind/* $(LAB)/*/etc/network/interfaces
	$(BP) $(LAB) $@

# Картинка с графом, которая создаётся из файла Graphviz.
$(INCLUDES)/network_gv.tex  : graphs/network.gv
	$(D2T) --preproc $< | $(D2T) > $@

$(INCLUDES)/dns_gv.pdf  : graphs/dns.gv
	dot -Tpdf $< > $@

$(INCLUDES)/%.pdf : $(INCLUDES)/%.tex
	$(PDFLATEX) -output-directory=$(INCLUDES) $<

# Основная цель сборки --- отчет
$(PDF) : $(TEX)/report.tex $(TEXCOMMON)/header.tex $(INCLUDES)/network_gv.pdf $(INCLUDES)/dns_gv.pdf
	cd $(TEX) && $(PDFLATEX) report.tex && $(PDFLATEX) report.tex && cp $(PDF) ..

# Удаление ВСЕХ временных файлов
clean:
	$(RM) graphs/*.gv $(INCLUDES)/*.tex
	find $(TEX)/ -regextype posix-egrep -type f ! -regex ".*\.(sty|tex|clo|cls|bib|bst|gitignore)" -exec $(RM) {} \; ;
