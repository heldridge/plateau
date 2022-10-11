open Core

let get_column_widths_exn (table : string list list) : int list =
  match table with
  | [] -> []
  | row :: _ ->
      List.fold table
        ~init:(List.init (List.length row) ~f:(Fn.const 0))
        ~f:(fun accum row ->
          List.map row ~f:String.length
          |> List.zip_exn accum
          |> List.map ~f:(fun (a, b) -> Int.max a b))

let right_pad (base : string) (len : int) =
  let diff = len - String.length base in
  if diff > 0 then base ^ String.make diff ' ' else base

let pad_header_exn (table : string list list) =
  let widths = get_column_widths_exn table in
  match table with
  | header :: rest ->
      (List.zip_exn header widths
      (* Add 4 to add padding to columns *)
      |> List.map ~f:(fun (s, width) -> right_pad s (width + 4)))
      :: rest
  | [] -> []

let print_table_exn (table : string list list) =
  match pad_header_exn table with
  | [] -> ()
  | header :: rest ->
      Format.open_tbox ();
      List.iter header ~f:(fun s ->
          Format.set_tab ();
          Format.print_string s);
      List.iter (List.join rest) ~f:(fun s ->
          Format.print_tab ();
          Format.print_string s);
      Format.print_tab ();
      Format.close_tbox ()
