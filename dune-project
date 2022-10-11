(lang dune 2.9)

(name plateau)

(license GPL-3.0-only)

(authors "Harry Eldridge <eldridgemharry@gmail.com>")

(maintainers "Harry Eldridge <eldridgemharry@gmail.com>")

(source
 (github heldridge/plateau))

(generate_opam_files true)

(package
 (name plateau)
 (synopsis "Print a table in a single line")
 (description
  "Add a simple command to print a table to the command line with nice formatting")
 (depends
  (ocaml
   (>= 4.12.0))
  (core
   (>= 0.14.1))))
