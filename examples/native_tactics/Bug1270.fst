(*
   Copyright 2008-2018 Microsoft Research

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*)
module Bug1270

open FStar.Tactics.V2

[@@plugin]
let mytac =
    (fun () ->
        (fun () ->
          let _ = forall_intros () in
          let env = cur_env () in
          let hyps = vars_of_env env in
          match hyps with
          | [] -> ()
          | h :: _ -> ()) `or_else` trivial)

let test =
  assert (True ==> True) by mytac ()

