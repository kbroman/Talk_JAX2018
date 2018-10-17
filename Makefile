R_OPTS=--no-save --no-restore --no-init-file --no-site-file # --vanilla, but without --no-environ

docs/index.html: slides.Rmd docs/kbroman.css R/hs_fig.R R/gve_mixup_scheme.R
	cp slides.Rmd docs/index.Rmd
	cd docs;R $(R_OPTS) -e "rmarkdown::render('index.Rmd')"
	rm docs/index.Rmd

docs/kbroman.css: kbroman.css
	cp kbroman.css docs/

jax2018.zip: docs/index.html docs/jax2018.pdf
	mkdir docs/jax2018
	cd docs;cp -r *.html *.svg *.css index_files/ libs/ jax2018/
	cp docs/jax2018.pdf docs/jax2018/
	cd docs;zip -r jax2018.zip jax2018/
	rm -r docs/jax2018/
	mv docs/jax2018.zip .

docs/jax2018.pdf: docs/index.html
	R -e "file <- paste0('file://', normalizePath('docs/index.html'));webshot::webshot(file, '$@')"

all: jax2018.zip
zip: jax2018.zip
pdf: docs/jax2018.pdf
