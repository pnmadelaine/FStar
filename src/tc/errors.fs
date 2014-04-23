﻿(*
   Copyright 2008-2014 Nikhil Swamy and Microsoft Research

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
#light "off"

module Microsoft.FStar.Tc.Errors

open Microsoft.FStar.Absyn
open Microsoft.FStar.Util

let occurs_check = 
  "Possibly infinite typ (occurs check failed)"

let unification_well_formedness = 
  "Term or type of an unexpected sort"

let incompatible_kinds k1 k2 = 
  format2 "Kinds %s and %s are incompatible" (Print.kind_to_string k1) (Print.kind_to_string k2)

let constructor_builds_the_wrong_type d t l = 
  format3 "Constructor %s builds a value of type %s; expected %s" (Print.sli d) (Print.typ_to_string t) (Print.sli l)

let inline_type_annotation_and_val_decl l = 
  format1 "%s has a val declaration as well as an inlined type annotation; remove one" (Print.sli l)

let inferred_type_causes_variable_to_escape t x = 
  format2 "Inferred type %s causes variable %s to escape its scope" (Print.typ_to_string t) (Print.strBvd x)
  
let expected_typ_of_kind k1 k2 =
  format2 "Expected type of kind %s; got %s"  (Print.kind_to_string k1) (Print.kind_to_string k2)

let expected_arrow_kind k = 
  format1 "Expected a type-constructor or type-function; got a type of kind %s" (Print.kind_to_string k)

let expected_function_typ t = 
  format1 "Expected a function; got an expression of type %s" (Print.typ_to_string t)

let expected_poly_typ t = 
  format1 "Expected a polymorphic function; got an expression of type %s" (Print.typ_to_string t)

let nonlinear_pattern_variable x = 
  format1 "The pattern variable %s was used more than once" (Print.strBvd x)

let disjunctive_pattern_vars v1 v2 = 
  let vars v =
    v |> List.map (function 
      | Inl a -> Print.strBvd a 
      | Inr x ->  Print.strBvd x) |> String.concat ", " in
  format2 
    "Every alternative of an 'or' pattern must bind the same variables; here one branch binds (%s) and another (%s)" 
    (vars v1) (vars v2)
  