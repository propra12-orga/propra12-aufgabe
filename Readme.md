Programmierpraktikum 2012
===========
Dateien für das Praktikum im Sommersemester 2012

Erstellen von PDF-Dateien aus Latex-Quellen mit Rake
-----

Es sind folgende Abhängigkeiten erforderlich:

1. >=ruby-1.9 (Das Rakefile funktioniert nicht mit Ruby-1.8!!!)
2. >=rake-0.9
3. pygments (nur für Syntax-Highlighting)
4. latexmk
5. evince

Installation von pygments latexmk und evince unter Gentoo oder Ubuntu:
-------------------------------------

- Für Gentoo: `emerge pygments latexmk evince`
- Für Ubuntu: `apt-get install latexmk evince python-pygments` (siehe auch http://wiki.ubuntuusers.de/Pygments)

Folgender Inhalt muss in die Datei `~/.latexmkrc`:

    $pdflatex = 'pdflatex -shell-escape %O %S';
    $pdf_previewer = "start evince";
    $pdf_update_method = 0;

Installation von Ruby mit RVM
--------------------

Danach rvm installieren, siehe https://rvm.io/rvm/install/

    curl -L get.rvm.io | bash -s stable
    source ~/.rvm/scripts/'rvm'
    rvm requirements
    #.
    #.
    #.
    #Additional Dependencies:
    ## For Ruby / Ruby HEAD (MRI, Rubinius, & REE), install the following:
    #  ruby|ruby-head: emerge libiconv readline zlib openssl curl git libyaml sqlite libxslt libtool gcc autoconf automake bison m4 # unter Ubuntu steht das ganze hier mit apt. Die Zeile am besten aus dem Output kopieren, da sie Systemspezifisch sind
    #.
    #.
    #.
    rvm get head
    rvm reload
    rvm install 1.9.3

Dann ins Verzeichnis wechseln und bundler ausführen:

    git clone http://github.com/propra12-orga/propra12-aufgabe.git
    cd propra12-aufgabe
    # Warnung über .rvmrc-Datei mit y beantworten
    bundle install

Schließlich Dokument kompilieren:

    mkdir build # falls nicht vorhanden
    rake clean && rake


Readme.md bearbeiten
--------------------
Zur Arbeit an der Readme.md gibt es einen kleinen Rake-Task, der die Datei in HTML kompiliert, nach /tmp speichert und mit Opera öffnet sowie einen Guard, der die Readme.md auf Änderungen überwacht und den Rake-Task automatisch startet.

    rake readme # rake task manuell starten
    bundle exec guard # guard starten

Für die Arbeit mit VIM empfehlen sich folgende Plugins:

* https://github.com/tpope/vim-markdown (Syntax-Highlight)
* https://github.com/suan/vim-instant-markdown (Live während des Bearbeitens im Browser laden. Abhängigkeiten im Gemfile enthalten. Nodejs und npm muss manuell nachinstalliert werden (siehe Readme im Projekt))
