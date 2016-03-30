(* Ocsigen
 * http://www.ocsigen.org
 * Copyright (C) 2011 Grégoire Henry
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, with linking exception;
 * either version 2.1 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 *)

include module type of Eliom_runtime
  with type 'a Client_value_server_repr.t =
                 'a Eliom_runtime.Client_value_server_repr.t
  with type client_value_datum = Eliom_runtime.client_value_datum
  with type injection_datum := Eliom_runtime.injection_datum
  with type compilation_unit_global_data = Eliom_runtime.compilation_unit_global_data
  with type global_data := Eliom_runtime.global_data
  with type request_data = Eliom_runtime.request_data

(** {2 Client and shared values}

    See the {% <<a_manual chapter="clientserver-language"|manual>> %}. *)

(** An ['a] client value on the client is just an ['a].
    See also {% <<a_api subproject="server" text="the abstract representation on the server" |
    type Eliom_client_common.client_value >> %}. *)
type 'a client_value = 'a
type 'a shared_value = 'a

val create_shared_value : 'a -> 'a client_value -> 'a shared_value

(** This exception is raised (in Lwt) on the client if a call to a
    server function {% <<a_api subproject="server"|val
    Eliom_client.server_function>> %} fails (in Lwt) on the server
    side.

    The argument describes the original exception by
    {!Printexc.to_string}.
*)
exception Exception_on_server of string

(** Event handlers like {% <<a_api | Eliom_content.Html5.F.a_onclick
    >> %} may raise [False] to cancel the event (as if the JavaScript
    function returned [false]).
*)
(* Cannot re-export exception Eliom_lib.False,
   cf. http://caml.inria.fr/mantis/view.php?id=5778 *)
(* (\** See {% <<a_api subproject="client"|exception Eliom_lib.False>> %}. *\) *)
exception False

(**/**)

type injection_datum = Eliom_runtime.injection_datum
type global_data2 (* Global data only needed while unwrapping *)
