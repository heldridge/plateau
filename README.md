# Plateau

Plateau is an OCaml package for easily printing tables.
It contains a single public function `print_table_exn : string list list -> unit` that prints a formatted table to the terminal.

## Example

Code:

```Ocaml
print_table_exn([["aaa"; "bbbb"; "ccc"]; ["wwwwwwww"; "x"; "zzzz"]])
```

Result:

```
aaa        bbbb    ccc
wwwwwww    x       zzz
```
