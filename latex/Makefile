DESTDIR = dist
PKGNAME = lstontology

all: $(PKGNAME).sty $(PKGNAME).pdf

$(PKGNAME).sty: $(PKGNAME).dtx
	lualatex $<

$(PKGNAME).pdf: $(PKGNAME).dtx
	latexmk -lualatex $<

install: $(PKGNAME).pdf $(PKGNAME).sty
	mkdir -p $(DESTDIR)/src/latex/$(PKGNAME)
	mkdir -p $(DESTDIR)/doc/latex/$(PKGNAME)
	mkdir -p $(DESTDIR)/tex/latex/$(PKGNAME)
	install -m 644 $(PKGNAME).dtx lppl-1-3c.tex Makefile $(DESTDIR)/src/latex/$(PKGNAME)
	install -m 644 $(PKGNAME).pdf $(DESTDIR)/doc/latex/$(PKGNAME)
	install -m 644 $(PKGNAME).sty $(DESTDIR)/tex/latex/$(PKGNAME)

clean:
	rm -f $(PKGNAME).{aux,fdb_latexmk,fls,glo,gls,idx,ilg,ind,log,out,toc}

mrproper: clean
	rm -f $(PKGNAME).{sty,pdf}

.PHONY: clean mrproper
