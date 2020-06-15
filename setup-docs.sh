#!/usr//bin/sh
# Run asciidoctor for docs.zip

asciidoctor -b html spinnaker.asc

# Zip the docs.zip

zip docs.zip -r images spinnaker.html

# Run asciidoctor for slides.zip

asciidoctor-revealjs spinnaker.asc

# Zip the slides

zip slides.zip -r images spinnaker.html

# Desktape

decktape reveal -s '1440x900' spinnaker.html slides.pdf

# Lab-book

asciidoctor -b html lab_book.asc

# Zip the lab book

zip lab_book.zip -r images lab_book.html

# Setup documentation for instructor only

asciidoctor -b html setup.asc

