open Prims
let (bv_eq :
  FStar_Reflection_Types.bv -> FStar_Reflection_Types.bv -> Prims.bool) =
  fun bv1 ->
    fun bv2 ->
      let bvv1 = FStar_Reflection_Builtins.inspect_bv bv1 in
      let bvv2 = FStar_Reflection_Builtins.inspect_bv bv2 in
      (bvv1.FStar_Reflection_Data.bv_ppname =
         bvv2.FStar_Reflection_Data.bv_ppname)
        &&
        (bvv1.FStar_Reflection_Data.bv_index =
           bvv2.FStar_Reflection_Data.bv_index)
let (fv_eq :
  FStar_Reflection_Types.fv -> FStar_Reflection_Types.fv -> Prims.bool) =
  fun fv1 ->
    fun fv2 ->
      let n1 = FStar_Reflection_Builtins.inspect_fv fv1 in
      let n2 = FStar_Reflection_Builtins.inspect_fv fv2 in n1 = n2
let (fv_eq_name :
  FStar_Reflection_Types.fv -> FStar_Reflection_Types.name -> Prims.bool) =
  fun fv ->
    fun n -> let fvn = FStar_Reflection_Builtins.inspect_fv fv in fvn = n
let opt_apply :
  'a 'b .
    ('a -> 'b) ->
      'a FStar_Pervasives_Native.option -> 'b FStar_Pervasives_Native.option
  =
  fun f ->
    fun x ->
      match x with
      | FStar_Pervasives_Native.None -> FStar_Pervasives_Native.None
      | FStar_Pervasives_Native.Some x' ->
          FStar_Pervasives_Native.Some (f x')
let opt_tapply :
  'a 'b .
    ('a -> ('b, unit) FStar_Tactics_Effect.tac_repr) ->
      'a FStar_Pervasives_Native.option ->
        ('b FStar_Pervasives_Native.option, unit)
          FStar_Tactics_Effect.tac_repr
  =
  fun uu___1 ->
    fun uu___ ->
      (fun f ->
         fun x ->
           match x with
           | FStar_Pervasives_Native.None ->
               Obj.magic
                 (Obj.repr
                    (FStar_Tactics_Effect.lift_div_tac
                       (fun uu___ -> FStar_Pervasives_Native.None)))
           | FStar_Pervasives_Native.Some x' ->
               Obj.magic
                 (Obj.repr
                    (FStar_Tactics_Effect.tac_bind
                       (Prims.mk_range
                          "experimental/FStar.InteractiveHelpers.Base.fst"
                          (Prims.of_int (42)) (Prims.of_int (20))
                          (Prims.of_int (42)) (Prims.of_int (26)))
                       (Prims.mk_range
                          "experimental/FStar.InteractiveHelpers.Base.fst"
                          (Prims.of_int (42)) (Prims.of_int (15))
                          (Prims.of_int (42)) (Prims.of_int (26)))
                       (Obj.magic (f x'))
                       (fun uu___ ->
                          FStar_Tactics_Effect.lift_div_tac
                            (fun uu___1 -> FStar_Pervasives_Native.Some uu___)))))
        uu___1 uu___
let option_to_string :
  'a .
    ('a -> (Prims.string, unit) FStar_Tactics_Effect.tac_repr) ->
      'a FStar_Pervasives_Native.option ->
        (Prims.string, unit) FStar_Tactics_Effect.tac_repr
  =
  fun uu___1 ->
    fun uu___ ->
      (fun f ->
         fun x ->
           match x with
           | FStar_Pervasives_Native.None ->
               Obj.magic
                 (Obj.repr
                    (FStar_Tactics_Effect.lift_div_tac (fun uu___ -> "None")))
           | FStar_Pervasives_Native.Some x' ->
               Obj.magic
                 (Obj.repr
                    (FStar_Tactics_Effect.tac_bind
                       (Prims.mk_range
                          "experimental/FStar.InteractiveHelpers.Base.fst"
                          (Prims.of_int (48)) (Prims.of_int (26))
                          (Prims.of_int (48)) (Prims.of_int (36)))
                       (Prims.mk_range "prims.fst" (Prims.of_int (606))
                          (Prims.of_int (19)) (Prims.of_int (606))
                          (Prims.of_int (31)))
                       (Obj.magic
                          (FStar_Tactics_Effect.tac_bind
                             (Prims.mk_range
                                "experimental/FStar.InteractiveHelpers.Base.fst"
                                (Prims.of_int (48)) (Prims.of_int (26))
                                (Prims.of_int (48)) (Prims.of_int (30)))
                             (Prims.mk_range "prims.fst" (Prims.of_int (606))
                                (Prims.of_int (19)) (Prims.of_int (606))
                                (Prims.of_int (31))) (Obj.magic (f x'))
                             (fun uu___ ->
                                FStar_Tactics_Effect.lift_div_tac
                                  (fun uu___1 -> Prims.strcat uu___ ")"))))
                       (fun uu___ ->
                          FStar_Tactics_Effect.lift_div_tac
                            (fun uu___1 -> Prims.strcat "Some (" uu___)))))
        uu___1 uu___
let opt_cons :
  'a . 'a FStar_Pervasives_Native.option -> 'a Prims.list -> 'a Prims.list =
  fun opt_x ->
    fun ls ->
      match opt_x with
      | FStar_Pervasives_Native.Some x -> x :: ls
      | FStar_Pervasives_Native.None -> ls
let list_to_string :
  'a .
    ('a -> (Prims.string, unit) FStar_Tactics_Effect.tac_repr) ->
      'a Prims.list -> (Prims.string, unit) FStar_Tactics_Effect.tac_repr
  =
  fun f ->
    fun ls ->
      FStar_Tactics_Effect.tac_bind
        (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
           (Prims.of_int (58)) (Prims.of_int (2)) (Prims.of_int (58))
           (Prims.of_int (68)))
        (Prims.mk_range "prims.fst" (Prims.of_int (606)) (Prims.of_int (19))
           (Prims.of_int (606)) (Prims.of_int (31)))
        (Obj.magic
           (FStar_Tactics_Util.fold_left
              (fun s ->
                 fun x ->
                   FStar_Tactics_Effect.tac_bind
                     (Prims.mk_range
                        "experimental/FStar.InteractiveHelpers.Base.fst"
                        (Prims.of_int (58)) (Prims.of_int (42))
                        (Prims.of_int (58)) (Prims.of_int (59)))
                     (Prims.mk_range "prims.fst" (Prims.of_int (606))
                        (Prims.of_int (19)) (Prims.of_int (606))
                        (Prims.of_int (31)))
                     (Obj.magic
                        (FStar_Tactics_Effect.tac_bind
                           (Prims.mk_range
                              "experimental/FStar.InteractiveHelpers.Base.fst"
                              (Prims.of_int (58)) (Prims.of_int (49))
                              (Prims.of_int (58)) (Prims.of_int (59)))
                           (Prims.mk_range "prims.fst" (Prims.of_int (606))
                              (Prims.of_int (19)) (Prims.of_int (606))
                              (Prims.of_int (31)))
                           (Obj.magic
                              (FStar_Tactics_Effect.tac_bind
                                 (Prims.mk_range
                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                    (Prims.of_int (58)) (Prims.of_int (49))
                                    (Prims.of_int (58)) (Prims.of_int (52)))
                                 (Prims.mk_range "prims.fst"
                                    (Prims.of_int (606)) (Prims.of_int (19))
                                    (Prims.of_int (606)) (Prims.of_int (31)))
                                 (Obj.magic (f x))
                                 (fun uu___ ->
                                    FStar_Tactics_Effect.lift_div_tac
                                      (fun uu___1 -> Prims.strcat uu___ ");"))))
                           (fun uu___ ->
                              FStar_Tactics_Effect.lift_div_tac
                                (fun uu___1 -> Prims.strcat " (" uu___))))
                     (fun uu___ ->
                        FStar_Tactics_Effect.lift_div_tac
                          (fun uu___1 -> Prims.strcat s uu___))) "[" ls))
        (fun uu___ ->
           FStar_Tactics_Effect.lift_div_tac
             (fun uu___1 -> Prims.strcat uu___ "]"))
let (mk_app_norm :
  FStar_Reflection_Types.env ->
    FStar_Reflection_Types.term ->
      FStar_Reflection_Types.term Prims.list ->
        (FStar_Reflection_Types.term, unit) FStar_Tactics_Effect.tac_repr)
  =
  fun e ->
    fun t ->
      fun params ->
        FStar_Tactics_Effect.tac_bind
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (65)) (Prims.of_int (11)) (Prims.of_int (65))
             (Prims.of_int (28)))
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (66)) (Prims.of_int (2)) (Prims.of_int (67))
             (Prims.of_int (4)))
          (FStar_Tactics_Effect.lift_div_tac
             (fun uu___ -> FStar_Reflection_Derived.mk_e_app t params))
          (fun uu___ ->
             (fun t1 ->
                Obj.magic
                  (FStar_Tactics_Effect.tac_bind
                     (Prims.mk_range
                        "experimental/FStar.InteractiveHelpers.Base.fst"
                        (Prims.of_int (66)) (Prims.of_int (11))
                        (Prims.of_int (66)) (Prims.of_int (32)))
                     (Prims.mk_range
                        "experimental/FStar.InteractiveHelpers.Base.fst"
                        (Prims.of_int (66)) (Prims.of_int (6))
                        (Prims.of_int (66)) (Prims.of_int (8)))
                     (Obj.magic
                        (FStar_Tactics_Builtins.norm_term_env e [] t1))
                     (fun t2 ->
                        FStar_Tactics_Effect.lift_div_tac (fun uu___ -> t2))))
               uu___)
let (opt_mk_app_norm :
  FStar_Reflection_Types.env ->
    FStar_Reflection_Types.term FStar_Pervasives_Native.option ->
      FStar_Reflection_Types.term Prims.list ->
        (FStar_Reflection_Types.term FStar_Pervasives_Native.option, 
          unit) FStar_Tactics_Effect.tac_repr)
  =
  fun e ->
    fun opt_t ->
      fun params -> opt_tapply (fun t -> mk_app_norm e t params) opt_t
let rec unzip :
  'a 'b . ('a * 'b) Prims.list -> ('a Prims.list * 'b Prims.list) =
  fun l ->
    match l with
    | [] -> ([], [])
    | (hd1, hd2)::tl ->
        let uu___ = unzip tl in
        (match uu___ with | (tl1, tl2) -> ((hd1 :: tl1), (hd2 :: tl2)))
let (abv_to_string :
  FStar_Reflection_Types.bv ->
    (Prims.string, unit) FStar_Tactics_Effect.tac_repr)
  =
  fun bv ->
    FStar_Tactics_Effect.tac_bind
      (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
         (Prims.of_int (84)) (Prims.of_int (12)) (Prims.of_int (84))
         (Prims.of_int (25)))
      (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
         (Prims.of_int (85)) (Prims.of_int (2)) (Prims.of_int (86))
         (Prims.of_int (28)))
      (FStar_Tactics_Effect.lift_div_tac
         (fun uu___ -> FStar_Reflection_Builtins.inspect_bv bv))
      (fun uu___ ->
         (fun bvv ->
            Obj.magic
              (FStar_Tactics_Effect.tac_bind
                 (Prims.mk_range
                    "experimental/FStar.InteractiveHelpers.Base.fst"
                    (Prims.of_int (85)) (Prims.of_int (18))
                    (Prims.of_int (86)) (Prims.of_int (28)))
                 (Prims.mk_range "prims.fst" (Prims.of_int (606))
                    (Prims.of_int (19)) (Prims.of_int (606))
                    (Prims.of_int (31)))
                 (Obj.magic
                    (FStar_Tactics_Effect.tac_bind
                       (Prims.mk_range
                          "experimental/FStar.InteractiveHelpers.Base.fst"
                          (Prims.of_int (85)) (Prims.of_int (26))
                          (Prims.of_int (86)) (Prims.of_int (28)))
                       (Prims.mk_range "prims.fst" (Prims.of_int (606))
                          (Prims.of_int (19)) (Prims.of_int (606))
                          (Prims.of_int (31)))
                       (Obj.magic
                          (FStar_Tactics_Effect.tac_bind
                             (Prims.mk_range
                                "experimental/FStar.InteractiveHelpers.Base.fst"
                                (Prims.of_int (85)) (Prims.of_int (57))
                                (Prims.of_int (86)) (Prims.of_int (28)))
                             (Prims.mk_range "prims.fst" (Prims.of_int (606))
                                (Prims.of_int (19)) (Prims.of_int (606))
                                (Prims.of_int (31)))
                             (Obj.magic
                                (FStar_Tactics_Effect.tac_bind
                                   (Prims.mk_range
                                      "experimental/FStar.InteractiveHelpers.Base.fst"
                                      (Prims.of_int (86)) (Prims.of_int (2))
                                      (Prims.of_int (86)) (Prims.of_int (28)))
                                   (Prims.mk_range "prims.fst"
                                      (Prims.of_int (606))
                                      (Prims.of_int (19))
                                      (Prims.of_int (606))
                                      (Prims.of_int (31)))
                                   (Obj.magic
                                      (FStar_Tactics_Builtins.term_to_string
                                         bvv.FStar_Reflection_Data.bv_sort))
                                   (fun uu___ ->
                                      FStar_Tactics_Effect.lift_div_tac
                                        (fun uu___1 ->
                                           Prims.strcat ") : " uu___))))
                             (fun uu___ ->
                                FStar_Tactics_Effect.lift_div_tac
                                  (fun uu___1 ->
                                     Prims.strcat
                                       (Prims.string_of_int
                                          bvv.FStar_Reflection_Data.bv_index)
                                       uu___))))
                       (fun uu___ ->
                          FStar_Tactics_Effect.lift_div_tac
                            (fun uu___1 -> Prims.strcat " (%" uu___))))
                 (fun uu___ ->
                    FStar_Tactics_Effect.lift_div_tac
                      (fun uu___1 ->
                         Prims.strcat bvv.FStar_Reflection_Data.bv_ppname
                           uu___)))) uu___)
let (print_binder_info :
  Prims.bool ->
    FStar_Reflection_Types.binder ->
      (unit, unit) FStar_Tactics_Effect.tac_repr)
  =
  fun full ->
    fun b ->
      FStar_Tactics_Effect.tac_bind
        (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
           (Prims.of_int (89)) (Prims.of_int (24)) (Prims.of_int (89))
           (Prims.of_int (40)))
        (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
           (Prims.of_int (89)) (Prims.of_int (2)) (Prims.of_int (107))
           (Prims.of_int (33)))
        (FStar_Tactics_Effect.lift_div_tac
           (fun uu___ -> FStar_Reflection_Builtins.inspect_binder b))
        (fun uu___ ->
           (fun uu___ ->
              match uu___ with
              | (bv, (a, _attrs)) ->
                  Obj.magic
                    (FStar_Tactics_Effect.tac_bind
                       (Prims.mk_range
                          "experimental/FStar.InteractiveHelpers.Base.fst"
                          (Prims.of_int (90)) (Prims.of_int (14))
                          (Prims.of_int (93)) (Prims.of_int (45)))
                       (Prims.mk_range
                          "experimental/FStar.InteractiveHelpers.Base.fst"
                          (Prims.of_int (96)) (Prims.of_int (2))
                          (Prims.of_int (107)) (Prims.of_int (33)))
                       (match a with
                        | FStar_Reflection_Data.Q_Implicit ->
                            Obj.magic
                              (Obj.repr
                                 (FStar_Tactics_Effect.lift_div_tac
                                    (fun uu___1 -> "Implicit")))
                        | FStar_Reflection_Data.Q_Explicit ->
                            Obj.magic
                              (Obj.repr
                                 (FStar_Tactics_Effect.lift_div_tac
                                    (fun uu___1 -> "Explicit")))
                        | FStar_Reflection_Data.Q_Meta t ->
                            Obj.magic
                              (Obj.repr
                                 (FStar_Tactics_Effect.tac_bind
                                    (Prims.mk_range
                                       "experimental/FStar.InteractiveHelpers.Base.fst"
                                       (Prims.of_int (93))
                                       (Prims.of_int (29))
                                       (Prims.of_int (93))
                                       (Prims.of_int (45)))
                                    (Prims.mk_range "prims.fst"
                                       (Prims.of_int (606))
                                       (Prims.of_int (19))
                                       (Prims.of_int (606))
                                       (Prims.of_int (31)))
                                    (Obj.magic
                                       (FStar_Tactics_Builtins.term_to_string
                                          t))
                                    (fun uu___1 ->
                                       FStar_Tactics_Effect.lift_div_tac
                                         (fun uu___2 ->
                                            Prims.strcat "Meta: " uu___1)))))
                       (fun uu___1 ->
                          (fun a_str ->
                             Obj.magic
                               (FStar_Tactics_Effect.tac_bind
                                  (Prims.mk_range
                                     "experimental/FStar.InteractiveHelpers.Base.fst"
                                     (Prims.of_int (96)) (Prims.of_int (14))
                                     (Prims.of_int (96)) (Prims.of_int (27)))
                                  (Prims.mk_range
                                     "experimental/FStar.InteractiveHelpers.Base.fst"
                                     (Prims.of_int (97)) (Prims.of_int (2))
                                     (Prims.of_int (107)) (Prims.of_int (33)))
                                  (FStar_Tactics_Effect.lift_div_tac
                                     (fun uu___1 ->
                                        FStar_Reflection_Builtins.inspect_bv
                                          bv))
                                  (fun uu___1 ->
                                     (fun bview ->
                                        if full
                                        then
                                          Obj.magic
                                            (FStar_Tactics_Effect.tac_bind
                                               (Prims.mk_range
                                                  "experimental/FStar.InteractiveHelpers.Base.fst"
                                                  (Prims.of_int (98))
                                                  (Prims.of_int (10))
                                                  (Prims.of_int (106))
                                                  (Prims.of_int (5)))
                                               (Prims.mk_range
                                                  "experimental/FStar.InteractiveHelpers.Base.fst"
                                                  (Prims.of_int (98))
                                                  (Prims.of_int (4))
                                                  (Prims.of_int (106))
                                                  (Prims.of_int (5)))
                                               (Obj.magic
                                                  (FStar_Tactics_Effect.tac_bind
                                                     (Prims.mk_range
                                                        "experimental/FStar.InteractiveHelpers.Base.fst"
                                                        (Prims.of_int (100))
                                                        (Prims.of_int (6))
                                                        (Prims.of_int (105))
                                                        (Prims.of_int (49)))
                                                     (Prims.mk_range
                                                        "prims.fst"
                                                        (Prims.of_int (606))
                                                        (Prims.of_int (19))
                                                        (Prims.of_int (606))
                                                        (Prims.of_int (31)))
                                                     (Obj.magic
                                                        (FStar_Tactics_Effect.tac_bind
                                                           (Prims.mk_range
                                                              "experimental/FStar.InteractiveHelpers.Base.fst"
                                                              (Prims.of_int (100))
                                                              (Prims.of_int (21))
                                                              (Prims.of_int (105))
                                                              (Prims.of_int (49)))
                                                           (Prims.mk_range
                                                              "prims.fst"
                                                              (Prims.of_int (606))
                                                              (Prims.of_int (19))
                                                              (Prims.of_int (606))
                                                              (Prims.of_int (31)))
                                                           (Obj.magic
                                                              (FStar_Tactics_Effect.tac_bind
                                                                 (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (101))
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (105))
                                                                    (Prims.of_int (49)))
                                                                 (Prims.mk_range
                                                                    "prims.fst"
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (19))
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (31)))
                                                                 (Obj.magic
                                                                    (
                                                                    FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (101))
                                                                    (Prims.of_int (26))
                                                                    (Prims.of_int (105))
                                                                    (Prims.of_int (49)))
                                                                    (Prims.mk_range
                                                                    "prims.fst"
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (19))
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (31)))
                                                                    (Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (102))
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (105))
                                                                    (Prims.of_int (49)))
                                                                    (Prims.mk_range
                                                                    "prims.fst"
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (19))
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (31)))
                                                                    (Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (102))
                                                                    (Prims.of_int (22))
                                                                    (Prims.of_int (105))
                                                                    (Prims.of_int (49)))
                                                                    (Prims.mk_range
                                                                    "prims.fst"
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (19))
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (31)))
                                                                    (Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (103))
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (105))
                                                                    (Prims.of_int (49)))
                                                                    (Prims.mk_range
                                                                    "prims.fst"
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (19))
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (31)))
                                                                    (Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (103))
                                                                    (Prims.of_int (23))
                                                                    (Prims.of_int (105))
                                                                    (Prims.of_int (49)))
                                                                    (Prims.mk_range
                                                                    "prims.fst"
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (19))
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (31)))
                                                                    (Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (104))
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (105))
                                                                    (Prims.of_int (49)))
                                                                    (Prims.mk_range
                                                                    "prims.fst"
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (19))
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (31)))
                                                                    (Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (104))
                                                                    (Prims.of_int (22))
                                                                    (Prims.of_int (105))
                                                                    (Prims.of_int (49)))
                                                                    (Prims.mk_range
                                                                    "prims.fst"
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (19))
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (31)))
                                                                    (Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (105))
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (105))
                                                                    (Prims.of_int (49)))
                                                                    (Prims.mk_range
                                                                    "prims.fst"
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (19))
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (31)))
                                                                    (Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (105))
                                                                    (Prims.of_int (21))
                                                                    (Prims.of_int (105))
                                                                    (Prims.of_int (49)))
                                                                    (Prims.mk_range
                                                                    "prims.fst"
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (19))
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (31)))
                                                                    (Obj.magic
                                                                    (FStar_Tactics_Builtins.term_to_string
                                                                    bview.FStar_Reflection_Data.bv_sort))
                                                                    (fun
                                                                    uu___1 ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___2 ->
                                                                    Prims.strcat
                                                                    "\n- sort: "
                                                                    uu___1))))
                                                                    (fun
                                                                    uu___1 ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___2 ->
                                                                    Prims.strcat
                                                                    (Prims.string_of_int
                                                                    bview.FStar_Reflection_Data.bv_index)
                                                                    uu___1))))
                                                                    (fun
                                                                    uu___1 ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___2 ->
                                                                    Prims.strcat
                                                                    "\n- index: "
                                                                    uu___1))))
                                                                    (fun
                                                                    uu___1 ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___2 ->
                                                                    Prims.strcat
                                                                    bview.FStar_Reflection_Data.bv_ppname
                                                                    uu___1))))
                                                                    (fun
                                                                    uu___1 ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___2 ->
                                                                    Prims.strcat
                                                                    "\n- ppname: "
                                                                    uu___1))))
                                                                    (fun
                                                                    uu___1 ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___2 ->
                                                                    Prims.strcat
                                                                    a_str
                                                                    uu___1))))
                                                                    (fun
                                                                    uu___1 ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___2 ->
                                                                    Prims.strcat
                                                                    "\n- aqual: "
                                                                    uu___1))))
                                                                    (fun
                                                                    uu___1 ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___2 ->
                                                                    Prims.strcat
                                                                    (FStar_Reflection_Derived.binder_to_string
                                                                    b) uu___1))))
                                                                    (fun
                                                                    uu___1 ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___2 ->
                                                                    Prims.strcat
                                                                    "\n- as string: "
                                                                    uu___1))))
                                                                 (fun uu___1
                                                                    ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___2 ->
                                                                    Prims.strcat
                                                                    (FStar_Reflection_Derived.name_of_binder
                                                                    b) uu___1))))
                                                           (fun uu___1 ->
                                                              FStar_Tactics_Effect.lift_div_tac
                                                                (fun uu___2
                                                                   ->
                                                                   Prims.strcat
                                                                    "\n- name: "
                                                                    uu___1))))
                                                     (fun uu___1 ->
                                                        FStar_Tactics_Effect.lift_div_tac
                                                          (fun uu___2 ->
                                                             Prims.strcat
                                                               "> print_binder_info:"
                                                               uu___1))))
                                               (fun uu___1 ->
                                                  (fun uu___1 ->
                                                     Obj.magic
                                                       (FStar_Tactics_Builtins.print
                                                          uu___1)) uu___1))
                                        else
                                          Obj.magic
                                            (FStar_Tactics_Builtins.print
                                               (FStar_Reflection_Derived.binder_to_string
                                                  b))) uu___1))) uu___1)))
             uu___)
let (print_binders_info :
  Prims.bool ->
    FStar_Reflection_Types.env -> (unit, unit) FStar_Tactics_Effect.tac_repr)
  =
  fun full ->
    fun e ->
      FStar_Tactics_Util.iter (print_binder_info full)
        (FStar_Reflection_Builtins.binders_of_env e)
let (acomp_to_string :
  FStar_Reflection_Types.comp ->
    (Prims.string, unit) FStar_Tactics_Effect.tac_repr)
  =
  fun c ->
    match FStar_Reflection_Builtins.inspect_comp c with
    | FStar_Reflection_Data.C_Total ret ->
        FStar_Tactics_Effect.tac_bind
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (115)) (Prims.of_int (18)) (Prims.of_int (115))
             (Prims.of_int (42)))
          (Prims.mk_range "prims.fst" (Prims.of_int (606))
             (Prims.of_int (19)) (Prims.of_int (606)) (Prims.of_int (31)))
          (Obj.magic
             (FStar_Tactics_Effect.tac_bind
                (Prims.mk_range
                   "experimental/FStar.InteractiveHelpers.Base.fst"
                   (Prims.of_int (115)) (Prims.of_int (18))
                   (Prims.of_int (115)) (Prims.of_int (36)))
                (Prims.mk_range "prims.fst" (Prims.of_int (606))
                   (Prims.of_int (19)) (Prims.of_int (606))
                   (Prims.of_int (31)))
                (Obj.magic (FStar_Tactics_Builtins.term_to_string ret))
                (fun uu___ ->
                   FStar_Tactics_Effect.lift_div_tac
                     (fun uu___1 -> Prims.strcat uu___ ")"))))
          (fun uu___ ->
             FStar_Tactics_Effect.lift_div_tac
               (fun uu___1 -> Prims.strcat "C_Total (" uu___))
    | FStar_Reflection_Data.C_GTotal ret ->
        FStar_Tactics_Effect.tac_bind
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (117)) (Prims.of_int (19)) (Prims.of_int (117))
             (Prims.of_int (43)))
          (Prims.mk_range "prims.fst" (Prims.of_int (606))
             (Prims.of_int (19)) (Prims.of_int (606)) (Prims.of_int (31)))
          (Obj.magic
             (FStar_Tactics_Effect.tac_bind
                (Prims.mk_range
                   "experimental/FStar.InteractiveHelpers.Base.fst"
                   (Prims.of_int (117)) (Prims.of_int (19))
                   (Prims.of_int (117)) (Prims.of_int (37)))
                (Prims.mk_range "prims.fst" (Prims.of_int (606))
                   (Prims.of_int (19)) (Prims.of_int (606))
                   (Prims.of_int (31)))
                (Obj.magic (FStar_Tactics_Builtins.term_to_string ret))
                (fun uu___ ->
                   FStar_Tactics_Effect.lift_div_tac
                     (fun uu___1 -> Prims.strcat uu___ ")"))))
          (fun uu___ ->
             FStar_Tactics_Effect.lift_div_tac
               (fun uu___1 -> Prims.strcat "C_GTotal (" uu___))
    | FStar_Reflection_Data.C_Lemma (pre, post, patterns) ->
        FStar_Tactics_Effect.tac_bind
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (119)) (Prims.of_int (18)) (Prims.of_int (119))
             (Prims.of_int (72)))
          (Prims.mk_range "prims.fst" (Prims.of_int (606))
             (Prims.of_int (19)) (Prims.of_int (606)) (Prims.of_int (31)))
          (Obj.magic
             (FStar_Tactics_Effect.tac_bind
                (Prims.mk_range
                   "experimental/FStar.InteractiveHelpers.Base.fst"
                   (Prims.of_int (119)) (Prims.of_int (18))
                   (Prims.of_int (119)) (Prims.of_int (36)))
                (Prims.mk_range
                   "experimental/FStar.InteractiveHelpers.Base.fst"
                   (Prims.of_int (119)) (Prims.of_int (18))
                   (Prims.of_int (119)) (Prims.of_int (72)))
                (Obj.magic (FStar_Tactics_Builtins.term_to_string pre))
                (fun uu___ ->
                   (fun uu___ ->
                      Obj.magic
                        (FStar_Tactics_Effect.tac_bind
                           (Prims.mk_range
                              "experimental/FStar.InteractiveHelpers.Base.fst"
                              (Prims.of_int (119)) (Prims.of_int (39))
                              (Prims.of_int (119)) (Prims.of_int (72)))
                           (Prims.mk_range "prims.fst" (Prims.of_int (606))
                              (Prims.of_int (19)) (Prims.of_int (606))
                              (Prims.of_int (31)))
                           (Obj.magic
                              (FStar_Tactics_Effect.tac_bind
                                 (Prims.mk_range
                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                    (Prims.of_int (119)) (Prims.of_int (47))
                                    (Prims.of_int (119)) (Prims.of_int (72)))
                                 (Prims.mk_range "prims.fst"
                                    (Prims.of_int (606)) (Prims.of_int (19))
                                    (Prims.of_int (606)) (Prims.of_int (31)))
                                 (Obj.magic
                                    (FStar_Tactics_Effect.tac_bind
                                       (Prims.mk_range
                                          "experimental/FStar.InteractiveHelpers.Base.fst"
                                          (Prims.of_int (119))
                                          (Prims.of_int (47))
                                          (Prims.of_int (119))
                                          (Prims.of_int (66)))
                                       (Prims.mk_range "prims.fst"
                                          (Prims.of_int (606))
                                          (Prims.of_int (19))
                                          (Prims.of_int (606))
                                          (Prims.of_int (31)))
                                       (Obj.magic
                                          (FStar_Tactics_Builtins.term_to_string
                                             post))
                                       (fun uu___1 ->
                                          FStar_Tactics_Effect.lift_div_tac
                                            (fun uu___2 ->
                                               Prims.strcat uu___1 ")"))))
                                 (fun uu___1 ->
                                    FStar_Tactics_Effect.lift_div_tac
                                      (fun uu___2 ->
                                         Prims.strcat ") (" uu___1))))
                           (fun uu___1 ->
                              FStar_Tactics_Effect.lift_div_tac
                                (fun uu___2 -> Prims.strcat uu___ uu___1))))
                     uu___)))
          (fun uu___ ->
             FStar_Tactics_Effect.lift_div_tac
               (fun uu___1 -> Prims.strcat "C_Lemma (" uu___))
    | FStar_Reflection_Data.C_Eff (us, eff_name, result, eff_args, uu___) ->
        FStar_Tactics_Effect.tac_bind
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (122)) (Prims.of_int (6)) (Prims.of_int (122))
             (Prims.of_int (35)))
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (124)) (Prims.of_int (4)) (Prims.of_int (126))
             (Prims.of_int (86)))
          (FStar_Tactics_Effect.lift_div_tac
             (fun uu___1 ->
                fun a ->
                  FStar_Tactics_Effect.tac_bind
                    (Prims.mk_range
                       "experimental/FStar.InteractiveHelpers.Base.fst"
                       (Prims.of_int (122)) (Prims.of_int (13))
                       (Prims.of_int (122)) (Prims.of_int (35)))
                    (Prims.mk_range "prims.fst" (Prims.of_int (606))
                       (Prims.of_int (19)) (Prims.of_int (606))
                       (Prims.of_int (31)))
                    (Obj.magic
                       (FStar_Tactics_Effect.tac_bind
                          (Prims.mk_range
                             "experimental/FStar.InteractiveHelpers.Base.fst"
                             (Prims.of_int (122)) (Prims.of_int (13))
                             (Prims.of_int (122)) (Prims.of_int (29)))
                          (Prims.mk_range "prims.fst" (Prims.of_int (606))
                             (Prims.of_int (19)) (Prims.of_int (606))
                             (Prims.of_int (31)))
                          (Obj.magic
                             (FStar_Tactics_Builtins.term_to_string a))
                          (fun uu___2 ->
                             FStar_Tactics_Effect.lift_div_tac
                               (fun uu___3 -> Prims.strcat uu___2 ")"))))
                    (fun uu___2 ->
                       FStar_Tactics_Effect.lift_div_tac
                         (fun uu___3 -> Prims.strcat " (" uu___2))))
          (fun uu___1 ->
             (fun eff_arg_to_string ->
                Obj.magic
                  (FStar_Tactics_Effect.tac_bind
                     (Prims.mk_range
                        "experimental/FStar.InteractiveHelpers.Base.fst"
                        (Prims.of_int (124)) (Prims.of_int (19))
                        (Prims.of_int (124)) (Prims.of_int (67)))
                     (Prims.mk_range
                        "experimental/FStar.InteractiveHelpers.Base.fst"
                        (Prims.of_int (125)) (Prims.of_int (4))
                        (Prims.of_int (126)) (Prims.of_int (86)))
                     (Obj.magic
                        (FStar_Tactics_Util.map
                           (fun uu___1 ->
                              match uu___1 with
                              | (x, y) -> eff_arg_to_string x) eff_args))
                     (fun uu___1 ->
                        (fun args_str ->
                           Obj.magic
                             (FStar_Tactics_Effect.tac_bind
                                (Prims.mk_range
                                   "experimental/FStar.InteractiveHelpers.Base.fst"
                                   (Prims.of_int (125)) (Prims.of_int (19))
                                   (Prims.of_int (125)) (Prims.of_int (68)))
                                (Prims.mk_range
                                   "experimental/FStar.InteractiveHelpers.Base.fst"
                                   (Prims.of_int (126)) (Prims.of_int (4))
                                   (Prims.of_int (126)) (Prims.of_int (86)))
                                (FStar_Tactics_Effect.lift_div_tac
                                   (fun uu___1 ->
                                      FStar_List_Tot_Base.fold_left
                                        (fun x -> fun y -> Prims.strcat x y)
                                        "" args_str))
                                (fun uu___1 ->
                                   (fun args_str1 ->
                                      Obj.magic
                                        (FStar_Tactics_Effect.tac_bind
                                           (Prims.mk_range
                                              "experimental/FStar.InteractiveHelpers.Base.fst"
                                              (Prims.of_int (126))
                                              (Prims.of_int (16))
                                              (Prims.of_int (126))
                                              (Prims.of_int (86)))
                                           (Prims.mk_range "prims.fst"
                                              (Prims.of_int (606))
                                              (Prims.of_int (19))
                                              (Prims.of_int (606))
                                              (Prims.of_int (31)))
                                           (Obj.magic
                                              (FStar_Tactics_Effect.tac_bind
                                                 (Prims.mk_range
                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                    (Prims.of_int (126))
                                                    (Prims.of_int (40))
                                                    (Prims.of_int (126))
                                                    (Prims.of_int (86)))
                                                 (Prims.mk_range "prims.fst"
                                                    (Prims.of_int (606))
                                                    (Prims.of_int (19))
                                                    (Prims.of_int (606))
                                                    (Prims.of_int (31)))
                                                 (Obj.magic
                                                    (FStar_Tactics_Effect.tac_bind
                                                       (Prims.mk_range
                                                          "experimental/FStar.InteractiveHelpers.Base.fst"
                                                          (Prims.of_int (126))
                                                          (Prims.of_int (48))
                                                          (Prims.of_int (126))
                                                          (Prims.of_int (86)))
                                                       (Prims.mk_range
                                                          "prims.fst"
                                                          (Prims.of_int (606))
                                                          (Prims.of_int (19))
                                                          (Prims.of_int (606))
                                                          (Prims.of_int (31)))
                                                       (Obj.magic
                                                          (FStar_Tactics_Effect.tac_bind
                                                             (Prims.mk_range
                                                                "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                (Prims.of_int (126))
                                                                (Prims.of_int (48))
                                                                (Prims.of_int (126))
                                                                (Prims.of_int (69)))
                                                             (Prims.mk_range
                                                                "prims.fst"
                                                                (Prims.of_int (606))
                                                                (Prims.of_int (19))
                                                                (Prims.of_int (606))
                                                                (Prims.of_int (31)))
                                                             (Obj.magic
                                                                (FStar_Tactics_Builtins.term_to_string
                                                                   result))
                                                             (fun uu___1 ->
                                                                FStar_Tactics_Effect.lift_div_tac
                                                                  (fun uu___2
                                                                    ->
                                                                    Prims.strcat
                                                                    uu___1
                                                                    (Prims.strcat
                                                                    ")"
                                                                    args_str1)))))
                                                       (fun uu___1 ->
                                                          FStar_Tactics_Effect.lift_div_tac
                                                            (fun uu___2 ->
                                                               Prims.strcat
                                                                 ") (" uu___1))))
                                                 (fun uu___1 ->
                                                    FStar_Tactics_Effect.lift_div_tac
                                                      (fun uu___2 ->
                                                         Prims.strcat
                                                           (FStar_Reflection_Derived.flatten_name
                                                              eff_name)
                                                           uu___1))))
                                           (fun uu___1 ->
                                              FStar_Tactics_Effect.lift_div_tac
                                                (fun uu___2 ->
                                                   Prims.strcat "C_Eff ("
                                                     uu___1)))) uu___1)))
                          uu___1))) uu___1)
exception MetaAnalysis of Prims.string 
let (uu___is_MetaAnalysis : Prims.exn -> Prims.bool) =
  fun projectee ->
    match projectee with | MetaAnalysis uu___ -> true | uu___ -> false
let (__proj__MetaAnalysis__item__uu___ : Prims.exn -> Prims.string) =
  fun projectee -> match projectee with | MetaAnalysis uu___ -> uu___
let mfail :
  'uuuuu . Prims.string -> ('uuuuu, unit) FStar_Tactics_Effect.tac_repr =
  fun str -> FStar_Tactics_Effect.raise (MetaAnalysis str)
let (print_dbg :
  Prims.bool -> Prims.string -> (unit, unit) FStar_Tactics_Effect.tac_repr) =
  fun uu___1 ->
    fun uu___ ->
      (fun debug ->
         fun s ->
           if debug
           then Obj.magic (Obj.repr (FStar_Tactics_Builtins.print s))
           else
             Obj.magic
               (Obj.repr
                  (FStar_Tactics_Effect.lift_div_tac (fun uu___1 -> ()))))
        uu___1 uu___
let (term_view_construct :
  FStar_Reflection_Data.term_view ->
    (Prims.string, unit) FStar_Tactics_Effect.tac_repr)
  =
  fun uu___ ->
    (fun t ->
       Obj.magic
         (FStar_Tactics_Effect.lift_div_tac
            (fun uu___ ->
               match t with
               | FStar_Reflection_Data.Tv_Var uu___1 -> "Tv_Var"
               | FStar_Reflection_Data.Tv_BVar uu___1 -> "Tv_BVar"
               | FStar_Reflection_Data.Tv_FVar uu___1 -> "Tv_FVar"
               | FStar_Reflection_Data.Tv_App (uu___1, uu___2) -> "Tv_App"
               | FStar_Reflection_Data.Tv_Abs (uu___1, uu___2) -> "Tv_Abs"
               | FStar_Reflection_Data.Tv_Arrow (uu___1, uu___2) ->
                   "Tv_Arrow"
               | FStar_Reflection_Data.Tv_Type uu___1 -> "Tv_Type"
               | FStar_Reflection_Data.Tv_Refine (uu___1, uu___2) ->
                   "Tv_Refine"
               | FStar_Reflection_Data.Tv_Const uu___1 -> "Tv_Const"
               | FStar_Reflection_Data.Tv_Uvar (uu___1, uu___2) -> "Tv_Uvar"
               | FStar_Reflection_Data.Tv_Let
                   (uu___1, uu___2, uu___3, uu___4, uu___5) -> "Tv_Let"
               | FStar_Reflection_Data.Tv_Match (uu___1, uu___2, uu___3) ->
                   "Tv_Match"
               | FStar_Reflection_Data.Tv_AscribedT
                   (uu___1, uu___2, uu___3, uu___4) -> "Tv_AscribedT"
               | FStar_Reflection_Data.Tv_AscribedC
                   (uu___1, uu___2, uu___3, uu___4) -> "Tv_AScribedC"
               | uu___1 -> "Tv_Unknown"))) uu___
let (term_construct :
  FStar_Reflection_Types.term ->
    (Prims.string, unit) FStar_Tactics_Effect.tac_repr)
  =
  fun t ->
    FStar_Tactics_Effect.tac_bind
      (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
         (Prims.of_int (162)) (Prims.of_int (22)) (Prims.of_int (162))
         (Prims.of_int (33)))
      (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
         (Prims.of_int (162)) (Prims.of_int (2)) (Prims.of_int (162))
         (Prims.of_int (33))) (Obj.magic (FStar_Tactics_Builtins.inspect t))
      (fun uu___ ->
         (fun uu___ -> Obj.magic (term_view_construct uu___)) uu___)
let (filter_ascriptions :
  Prims.bool ->
    FStar_Reflection_Types.term ->
      (FStar_Reflection_Types.term, unit) FStar_Tactics_Effect.tac_repr)
  =
  fun dbg ->
    fun t ->
      FStar_Tactics_Effect.tac_bind
        (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
           (Prims.of_int (175)) (Prims.of_int (2)) (Prims.of_int (175))
           (Prims.of_int (94)))
        (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
           (Prims.of_int (176)) (Prims.of_int (2)) (Prims.of_int (180))
           (Prims.of_int (15)))
        (Obj.magic
           (FStar_Tactics_Effect.tac_bind
              (Prims.mk_range
                 "experimental/FStar.InteractiveHelpers.Base.fst"
                 (Prims.of_int (175)) (Prims.of_int (16))
                 (Prims.of_int (175)) (Prims.of_int (94)))
              (Prims.mk_range
                 "experimental/FStar.InteractiveHelpers.Base.fst"
                 (Prims.of_int (175)) (Prims.of_int (2)) (Prims.of_int (175))
                 (Prims.of_int (94)))
              (Obj.magic
                 (FStar_Tactics_Effect.tac_bind
                    (Prims.mk_range
                       "experimental/FStar.InteractiveHelpers.Base.fst"
                       (Prims.of_int (175)) (Prims.of_int (45))
                       (Prims.of_int (175)) (Prims.of_int (92)))
                    (Prims.mk_range "prims.fst" (Prims.of_int (606))
                       (Prims.of_int (19)) (Prims.of_int (606))
                       (Prims.of_int (31)))
                    (Obj.magic
                       (FStar_Tactics_Effect.tac_bind
                          (Prims.mk_range
                             "experimental/FStar.InteractiveHelpers.Base.fst"
                             (Prims.of_int (175)) (Prims.of_int (45))
                             (Prims.of_int (175)) (Prims.of_int (66)))
                          (Prims.mk_range
                             "experimental/FStar.InteractiveHelpers.Base.fst"
                             (Prims.of_int (175)) (Prims.of_int (45))
                             (Prims.of_int (175)) (Prims.of_int (92)))
                          (Obj.magic
                             (FStar_Tactics_Effect.tac_bind
                                (Prims.mk_range
                                   "experimental/FStar.InteractiveHelpers.Base.fst"
                                   (Prims.of_int (174)) (Prims.of_int (27))
                                   (Prims.of_int (174)) (Prims.of_int (28)))
                                (Prims.mk_range
                                   "experimental/FStar.InteractiveHelpers.Base.fst"
                                   (Prims.of_int (175)) (Prims.of_int (45))
                                   (Prims.of_int (175)) (Prims.of_int (66)))
                                (Obj.magic (FStar_Tactics_Builtins.inspect t))
                                (fun uu___ ->
                                   (fun uu___ ->
                                      Obj.magic (term_view_construct uu___))
                                     uu___)))
                          (fun uu___ ->
                             (fun uu___ ->
                                Obj.magic
                                  (FStar_Tactics_Effect.tac_bind
                                     (Prims.mk_range
                                        "experimental/FStar.InteractiveHelpers.Base.fst"
                                        (Prims.of_int (175))
                                        (Prims.of_int (69))
                                        (Prims.of_int (175))
                                        (Prims.of_int (92)))
                                     (Prims.mk_range "prims.fst"
                                        (Prims.of_int (606))
                                        (Prims.of_int (19))
                                        (Prims.of_int (606))
                                        (Prims.of_int (31)))
                                     (Obj.magic
                                        (FStar_Tactics_Effect.tac_bind
                                           (Prims.mk_range
                                              "experimental/FStar.InteractiveHelpers.Base.fst"
                                              (Prims.of_int (175))
                                              (Prims.of_int (76))
                                              (Prims.of_int (175))
                                              (Prims.of_int (92)))
                                           (Prims.mk_range "prims.fst"
                                              (Prims.of_int (606))
                                              (Prims.of_int (19))
                                              (Prims.of_int (606))
                                              (Prims.of_int (31)))
                                           (Obj.magic
                                              (FStar_Tactics_Builtins.term_to_string
                                                 t))
                                           (fun uu___1 ->
                                              FStar_Tactics_Effect.lift_div_tac
                                                (fun uu___2 ->
                                                   Prims.strcat ": " uu___1))))
                                     (fun uu___1 ->
                                        FStar_Tactics_Effect.lift_div_tac
                                          (fun uu___2 ->
                                             Prims.strcat uu___ uu___1))))
                               uu___)))
                    (fun uu___ ->
                       FStar_Tactics_Effect.lift_div_tac
                         (fun uu___1 ->
                            Prims.strcat "[> filter_ascriptions: " uu___))))
              (fun uu___ ->
                 (fun uu___ -> Obj.magic (print_dbg dbg uu___)) uu___)))
        (fun uu___ ->
           (fun uu___ ->
              Obj.magic
                (FStar_Tactics_Visit.visit_tm
                   (fun t1 ->
                      FStar_Tactics_Effect.tac_bind
                        (Prims.mk_range
                           "experimental/FStar.InteractiveHelpers.Base.fst"
                           (Prims.of_int (177)) (Prims.of_int (10))
                           (Prims.of_int (177)) (Prims.of_int (19)))
                        (Prims.mk_range
                           "experimental/FStar.InteractiveHelpers.Base.fst"
                           (Prims.of_int (177)) (Prims.of_int (4))
                           (Prims.of_int (180)) (Prims.of_int (12)))
                        (Obj.magic (FStar_Tactics_Builtins.inspect t1))
                        (fun uu___1 ->
                           FStar_Tactics_Effect.lift_div_tac
                             (fun uu___2 ->
                                match uu___1 with
                                | FStar_Reflection_Data.Tv_AscribedT
                                    (e, uu___3, uu___4, uu___5) -> e
                                | FStar_Reflection_Data.Tv_AscribedC
                                    (e, uu___3, uu___4, uu___5) -> e
                                | uu___3 -> t1))) t)) uu___)
let (prettify_term :
  Prims.bool ->
    FStar_Reflection_Types.term ->
      (FStar_Reflection_Types.term, unit) FStar_Tactics_Effect.tac_repr)
  = fun dbg -> fun t -> filter_ascriptions dbg t
type 'a bind_map = (FStar_Reflection_Types.bv * 'a) Prims.list
let bind_map_push :
  'a .
    'a bind_map ->
      FStar_Reflection_Types.bv ->
        'a -> (FStar_Reflection_Types.bv * 'a) Prims.list
  = fun m -> fun b -> fun x -> (b, x) :: m
let rec bind_map_get :
  'a .
    'a bind_map ->
      FStar_Reflection_Types.bv -> 'a FStar_Pervasives_Native.option
  =
  fun m ->
    fun b ->
      match m with
      | [] -> FStar_Pervasives_Native.None
      | (b', x)::m' ->
          if (FStar_Reflection_Builtins.compare_bv b b') = FStar_Order.Eq
          then FStar_Pervasives_Native.Some x
          else bind_map_get m' b
let rec bind_map_get_from_name :
  'a .
    'a bind_map ->
      Prims.string ->
        (FStar_Reflection_Types.bv * 'a) FStar_Pervasives_Native.option
  =
  fun m ->
    fun name ->
      match m with
      | [] -> FStar_Pervasives_Native.None
      | (b', x)::m' ->
          let b'v = FStar_Reflection_Builtins.inspect_bv b' in
          if b'v.FStar_Reflection_Data.bv_ppname = name
          then FStar_Pervasives_Native.Some (b', x)
          else bind_map_get_from_name m' name
type genv =
  {
  env: FStar_Reflection_Types.env ;
  bmap: (Prims.bool * FStar_Reflection_Types.term) bind_map ;
  svars: FStar_Reflection_Types.bv Prims.list }
let (__proj__Mkgenv__item__env : genv -> FStar_Reflection_Types.env) =
  fun projectee -> match projectee with | { env; bmap; svars;_} -> env
let (__proj__Mkgenv__item__bmap :
  genv -> (Prims.bool * FStar_Reflection_Types.term) bind_map) =
  fun projectee -> match projectee with | { env; bmap; svars;_} -> bmap
let (__proj__Mkgenv__item__svars :
  genv -> FStar_Reflection_Types.bv Prims.list) =
  fun projectee -> match projectee with | { env; bmap; svars;_} -> svars
let (get_env : genv -> FStar_Reflection_Types.env) = fun e -> e.env
let (get_bind_map :
  genv -> (Prims.bool * FStar_Reflection_Types.term) bind_map) =
  fun e -> e.bmap
let (mk_genv :
  FStar_Reflection_Types.env ->
    (Prims.bool * FStar_Reflection_Types.term) bind_map ->
      FStar_Reflection_Types.bv Prims.list -> genv)
  = fun env -> fun bmap -> fun svars -> { env; bmap; svars }
let (mk_init_genv : FStar_Reflection_Types.env -> genv) =
  fun env -> mk_genv env [] []
let (genv_to_string :
  genv -> (Prims.string, unit) FStar_Tactics_Effect.tac_repr) =
  fun ge ->
    FStar_Tactics_Effect.tac_bind
      (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
         (Prims.of_int (248)) (Prims.of_int (4)) (Prims.of_int (248))
         (Prims.of_int (41)))
      (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
         (Prims.of_int (250)) (Prims.of_int (2)) (Prims.of_int (261))
         (Prims.of_int (34)))
      (FStar_Tactics_Effect.lift_div_tac
         (fun uu___ ->
            fun b ->
              FStar_Tactics_Effect.tac_bind
                (Prims.mk_range
                   "experimental/FStar.InteractiveHelpers.Base.fst"
                   (Prims.of_int (248)) (Prims.of_int (4))
                   (Prims.of_int (248)) (Prims.of_int (34)))
                (Prims.mk_range "prims.fst" (Prims.of_int (606))
                   (Prims.of_int (19)) (Prims.of_int (606))
                   (Prims.of_int (31)))
                (Obj.magic
                   (abv_to_string (FStar_Reflection_Derived.bv_of_binder b)))
                (fun uu___1 ->
                   FStar_Tactics_Effect.lift_div_tac
                     (fun uu___2 -> Prims.strcat uu___1 "\n"))))
      (fun uu___ ->
         (fun binder_to_string ->
            Obj.magic
              (FStar_Tactics_Effect.tac_bind
                 (Prims.mk_range
                    "experimental/FStar.InteractiveHelpers.Base.fst"
                    (Prims.of_int (250)) (Prims.of_int (20))
                    (Prims.of_int (250)) (Prims.of_int (64)))
                 (Prims.mk_range
                    "experimental/FStar.InteractiveHelpers.Base.fst"
                    (Prims.of_int (251)) (Prims.of_int (2))
                    (Prims.of_int (261)) (Prims.of_int (34)))
                 (Obj.magic
                    (FStar_Tactics_Util.map binder_to_string
                       (FStar_Reflection_Builtins.binders_of_env ge.env)))
                 (fun uu___ ->
                    (fun binders_str ->
                       Obj.magic
                         (FStar_Tactics_Effect.tac_bind
                            (Prims.mk_range
                               "experimental/FStar.InteractiveHelpers.Base.fst"
                               (Prims.of_int (252)) (Prims.of_int (4))
                               (Prims.of_int (254)) (Prims.of_int (57)))
                            (Prims.mk_range
                               "experimental/FStar.InteractiveHelpers.Base.fst"
                               (Prims.of_int (256)) (Prims.of_int (2))
                               (Prims.of_int (261)) (Prims.of_int (34)))
                            (FStar_Tactics_Effect.lift_div_tac
                               (fun uu___ ->
                                  fun e ->
                                    FStar_Tactics_Effect.tac_bind
                                      (Prims.mk_range
                                         "experimental/FStar.InteractiveHelpers.Base.fst"
                                         (Prims.of_int (252))
                                         (Prims.of_int (23))
                                         (Prims.of_int (252))
                                         (Prims.of_int (24)))
                                      (Prims.mk_range
                                         "experimental/FStar.InteractiveHelpers.Base.fst"
                                         (Prims.of_int (252))
                                         (Prims.of_int (4))
                                         (Prims.of_int (254))
                                         (Prims.of_int (57)))
                                      (FStar_Tactics_Effect.lift_div_tac
                                         (fun uu___1 -> e))
                                      (fun uu___1 ->
                                         (fun uu___1 ->
                                            match uu___1 with
                                            | (bv, (abs, t)) ->
                                                Obj.magic
                                                  (FStar_Tactics_Effect.tac_bind
                                                     (Prims.mk_range
                                                        "experimental/FStar.InteractiveHelpers.Base.fst"
                                                        (Prims.of_int (253))
                                                        (Prims.of_int (10))
                                                        (Prims.of_int (254))
                                                        (Prims.of_int (57)))
                                                     (Prims.mk_range
                                                        "prims.fst"
                                                        (Prims.of_int (606))
                                                        (Prims.of_int (19))
                                                        (Prims.of_int (606))
                                                        (Prims.of_int (31)))
                                                     (Obj.magic
                                                        (FStar_Tactics_Effect.tac_bind
                                                           (Prims.mk_range
                                                              "experimental/FStar.InteractiveHelpers.Base.fst"
                                                              (Prims.of_int (253))
                                                              (Prims.of_int (10))
                                                              (Prims.of_int (253))
                                                              (Prims.of_int (26)))
                                                           (Prims.mk_range
                                                              "experimental/FStar.InteractiveHelpers.Base.fst"
                                                              (Prims.of_int (253))
                                                              (Prims.of_int (10))
                                                              (Prims.of_int (254))
                                                              (Prims.of_int (57)))
                                                           (Obj.magic
                                                              (abv_to_string
                                                                 bv))
                                                           (fun uu___2 ->
                                                              (fun uu___2 ->
                                                                 Obj.magic
                                                                   (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (253))
                                                                    (Prims.of_int (28))
                                                                    (Prims.of_int (254))
                                                                    (Prims.of_int (57)))
                                                                    (Prims.mk_range
                                                                    "prims.fst"
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (19))
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (31)))
                                                                    (Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (254))
                                                                    (Prims.of_int (4))
                                                                    (Prims.of_int (254))
                                                                    (Prims.of_int (57)))
                                                                    (Prims.mk_range
                                                                    "prims.fst"
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (19))
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (31)))
                                                                    (Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (254))
                                                                    (Prims.of_int (25))
                                                                    (Prims.of_int (254))
                                                                    (Prims.of_int (57)))
                                                                    (Prims.mk_range
                                                                    "prims.fst"
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (19))
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (31)))
                                                                    (Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (254))
                                                                    (Prims.of_int (32))
                                                                    (Prims.of_int (254))
                                                                    (Prims.of_int (57)))
                                                                    (Prims.mk_range
                                                                    "prims.fst"
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (19))
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (31)))
                                                                    (Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (254))
                                                                    (Prims.of_int (32))
                                                                    (Prims.of_int (254))
                                                                    (Prims.of_int (48)))
                                                                    (Prims.mk_range
                                                                    "prims.fst"
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (19))
                                                                    (Prims.of_int (606))
                                                                    (Prims.of_int (31)))
                                                                    (Obj.magic
                                                                    (FStar_Tactics_Builtins.term_to_string
                                                                    t))
                                                                    (fun
                                                                    uu___3 ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___4 ->
                                                                    Prims.strcat
                                                                    uu___3
                                                                    "))\n"))))
                                                                    (fun
                                                                    uu___3 ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___4 ->
                                                                    Prims.strcat
                                                                    ", "
                                                                    uu___3))))
                                                                    (fun
                                                                    uu___3 ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___4 ->
                                                                    Prims.strcat
                                                                    (Prims.string_of_bool
                                                                    abs)
                                                                    uu___3))))
                                                                    (fun
                                                                    uu___3 ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___4 ->
                                                                    Prims.strcat
                                                                    " -> ("
                                                                    uu___3))))
                                                                    (fun
                                                                    uu___3 ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___4 ->
                                                                    Prims.strcat
                                                                    uu___2
                                                                    uu___3))))
                                                                uu___2)))
                                                     (fun uu___2 ->
                                                        FStar_Tactics_Effect.lift_div_tac
                                                          (fun uu___3 ->
                                                             Prims.strcat "("
                                                               uu___2))))
                                           uu___1)))
                            (fun uu___ ->
                               (fun bmap_elem_to_string ->
                                  Obj.magic
                                    (FStar_Tactics_Effect.tac_bind
                                       (Prims.mk_range
                                          "experimental/FStar.InteractiveHelpers.Base.fst"
                                          (Prims.of_int (256))
                                          (Prims.of_int (17))
                                          (Prims.of_int (256))
                                          (Prims.of_int (48)))
                                       (Prims.mk_range
                                          "experimental/FStar.InteractiveHelpers.Base.fst"
                                          (Prims.of_int (257))
                                          (Prims.of_int (2))
                                          (Prims.of_int (261))
                                          (Prims.of_int (34)))
                                       (Obj.magic
                                          (FStar_Tactics_Util.map
                                             bmap_elem_to_string ge.bmap))
                                       (fun uu___ ->
                                          (fun bmap_str ->
                                             Obj.magic
                                               (FStar_Tactics_Effect.tac_bind
                                                  (Prims.mk_range
                                                     "experimental/FStar.InteractiveHelpers.Base.fst"
                                                     (Prims.of_int (257))
                                                     (Prims.of_int (18))
                                                     (Prims.of_int (257))
                                                     (Prims.of_int (66)))
                                                  (Prims.mk_range "prims.fst"
                                                     (Prims.of_int (606))
                                                     (Prims.of_int (19))
                                                     (Prims.of_int (606))
                                                     (Prims.of_int (31)))
                                                  (Obj.magic
                                                     (FStar_Tactics_Util.map
                                                        (fun bv ->
                                                           FStar_Tactics_Effect.tac_bind
                                                             (Prims.mk_range
                                                                "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                (Prims.of_int (257))
                                                                (Prims.of_int (33))
                                                                (Prims.of_int (257))
                                                                (Prims.of_int (49)))
                                                             (Prims.mk_range
                                                                "prims.fst"
                                                                (Prims.of_int (606))
                                                                (Prims.of_int (19))
                                                                (Prims.of_int (606))
                                                                (Prims.of_int (31)))
                                                             (Obj.magic
                                                                (abv_to_string
                                                                   bv))
                                                             (fun uu___ ->
                                                                FStar_Tactics_Effect.lift_div_tac
                                                                  (fun uu___1
                                                                    ->
                                                                    Prims.strcat
                                                                    uu___
                                                                    "\n")))
                                                        ge.svars))
                                                  (fun svars_str ->
                                                     FStar_Tactics_Effect.lift_div_tac
                                                       (fun uu___ ->
                                                          Prims.strcat
                                                            "> env:\n"
                                                            (Prims.strcat
                                                               (FStar_List_Tot_Base.fold_left
                                                                  (fun x ->
                                                                    fun y ->
                                                                    Prims.strcat
                                                                    x y) ""
                                                                  binders_str)
                                                               (Prims.strcat
                                                                  "> bmap:\n"
                                                                  (Prims.strcat
                                                                    (FStar_List_Tot_Base.fold_left
                                                                    (fun x ->
                                                                    fun y ->
                                                                    Prims.strcat
                                                                    x y) ""
                                                                    bmap_str)
                                                                    (Prims.strcat
                                                                    "> svars:\n"
                                                                    (FStar_List_Tot_Base.fold_left
                                                                    (fun x ->
                                                                    fun y ->
                                                                    Prims.strcat
                                                                    x y) ""
                                                                    svars_str)))))))))
                                            uu___))) uu___))) uu___))) uu___)
let (genv_get :
  genv ->
    FStar_Reflection_Types.bv ->
      (Prims.bool * FStar_Reflection_Types.term)
        FStar_Pervasives_Native.option)
  = fun ge -> fun b -> bind_map_get ge.bmap b
let (genv_get_from_name :
  genv ->
    Prims.string ->
      (FStar_Reflection_Types.bv * (Prims.bool *
        FStar_Reflection_Types.term)) FStar_Pervasives_Native.option)
  = fun ge -> fun name -> bind_map_get_from_name ge.bmap name
let (genv_push_bv :
  genv ->
    FStar_Reflection_Types.bv ->
      Prims.bool ->
        FStar_Reflection_Types.term FStar_Pervasives_Native.option ->
          (genv, unit) FStar_Tactics_Effect.tac_repr)
  =
  fun ge ->
    fun b ->
      fun abs ->
        fun t ->
          FStar_Tactics_Effect.tac_bind
            (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
               (Prims.of_int (272)) (Prims.of_int (11)) (Prims.of_int (272))
               (Prims.of_int (22)))
            (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
               (Prims.of_int (273)) (Prims.of_int (2)) (Prims.of_int (278))
               (Prims.of_int (25)))
            (FStar_Tactics_Effect.lift_div_tac
               (fun uu___ -> FStar_Reflection_Derived.mk_binder b))
            (fun uu___ ->
               (fun br ->
                  Obj.magic
                    (FStar_Tactics_Effect.tac_bind
                       (Prims.mk_range
                          "experimental/FStar.InteractiveHelpers.Base.fst"
                          (Prims.of_int (273)) (Prims.of_int (11))
                          (Prims.of_int (273)) (Prims.of_int (47)))
                       (Prims.mk_range
                          "experimental/FStar.InteractiveHelpers.Base.fst"
                          (Prims.of_int (274)) (Prims.of_int (2))
                          (Prims.of_int (278)) (Prims.of_int (25)))
                       (FStar_Tactics_Effect.lift_div_tac
                          (fun uu___ ->
                             genv_get_from_name ge
                               (FStar_Reflection_Derived.name_of_bv b)))
                       (fun uu___ ->
                          (fun sv ->
                             Obj.magic
                               (FStar_Tactics_Effect.tac_bind
                                  (Prims.mk_range
                                     "experimental/FStar.InteractiveHelpers.Base.fst"
                                     (Prims.of_int (274)) (Prims.of_int (15))
                                     (Prims.of_int (274)) (Prims.of_int (74)))
                                  (Prims.mk_range
                                     "experimental/FStar.InteractiveHelpers.Base.fst"
                                     (Prims.of_int (275)) (Prims.of_int (2))
                                     (Prims.of_int (278)) (Prims.of_int (25)))
                                  (FStar_Tactics_Effect.lift_div_tac
                                     (fun uu___ ->
                                        if
                                          FStar_Pervasives_Native.uu___is_Some
                                            sv
                                        then
                                          (FStar_Pervasives_Native.fst
                                             (FStar_Pervasives_Native.__proj__Some__item__v
                                                sv))
                                          :: (ge.svars)
                                        else ge.svars))
                                  (fun uu___ ->
                                     (fun svars' ->
                                        Obj.magic
                                          (FStar_Tactics_Effect.tac_bind
                                             (Prims.mk_range
                                                "experimental/FStar.InteractiveHelpers.Base.fst"
                                                (Prims.of_int (275))
                                                (Prims.of_int (11))
                                                (Prims.of_int (275))
                                                (Prims.of_int (32)))
                                             (Prims.mk_range
                                                "experimental/FStar.InteractiveHelpers.Base.fst"
                                                (Prims.of_int (276))
                                                (Prims.of_int (2))
                                                (Prims.of_int (278))
                                                (Prims.of_int (25)))
                                             (FStar_Tactics_Effect.lift_div_tac
                                                (fun uu___ ->
                                                   FStar_Reflection_Builtins.push_binder
                                                     ge.env br))
                                             (fun uu___ ->
                                                (fun e' ->
                                                   Obj.magic
                                                     (FStar_Tactics_Effect.tac_bind
                                                        (Prims.mk_range
                                                           "experimental/FStar.InteractiveHelpers.Base.fst"
                                                           (Prims.of_int (276))
                                                           (Prims.of_int (11))
                                                           (Prims.of_int (276))
                                                           (Prims.of_int (57)))
                                                        (Prims.mk_range
                                                           "experimental/FStar.InteractiveHelpers.Base.fst"
                                                           (Prims.of_int (278))
                                                           (Prims.of_int (2))
                                                           (Prims.of_int (278))
                                                           (Prims.of_int (25)))
                                                        (if
                                                           FStar_Pervasives_Native.uu___is_Some
                                                             t
                                                         then
                                                           Obj.magic
                                                             (Obj.repr
                                                                (FStar_Tactics_Effect.lift_div_tac
                                                                   (fun uu___
                                                                    ->
                                                                    FStar_Pervasives_Native.__proj__Some__item__v
                                                                    t)))
                                                         else
                                                           Obj.magic
                                                             (Obj.repr
                                                                (FStar_Tactics_Builtins.pack
                                                                   (FStar_Reflection_Data.Tv_Var
                                                                    b))))
                                                        (fun tm ->
                                                           FStar_Tactics_Effect.lift_div_tac
                                                             (fun uu___ ->
                                                                mk_genv e'
                                                                  (bind_map_push
                                                                    ge.bmap b
                                                                    (abs, tm))
                                                                  svars'))))
                                                  uu___))) uu___))) uu___)))
                 uu___)
let (genv_push_binder :
  genv ->
    FStar_Reflection_Types.binder ->
      Prims.bool ->
        FStar_Reflection_Types.term FStar_Pervasives_Native.option ->
          (genv, unit) FStar_Tactics_Effect.tac_repr)
  =
  fun ge ->
    fun b ->
      fun abs ->
        fun t ->
          genv_push_bv ge (FStar_Reflection_Derived.bv_of_binder b) abs t
let (bv_is_shadowed : genv -> FStar_Reflection_Types.bv -> Prims.bool) =
  fun ge -> fun bv -> FStar_List_Tot_Base.existsb (bv_eq bv) ge.svars
let (binder_is_shadowed :
  genv -> FStar_Reflection_Types.binder -> Prims.bool) =
  fun ge ->
    fun b -> bv_is_shadowed ge (FStar_Reflection_Derived.bv_of_binder b)
let (find_shadowed_bvs :
  genv ->
    FStar_Reflection_Types.bv Prims.list ->
      (FStar_Reflection_Types.bv * Prims.bool) Prims.list)
  =
  fun ge ->
    fun bl ->
      FStar_List_Tot_Base.map (fun b -> (b, (bv_is_shadowed ge b))) bl
let (find_shadowed_binders :
  genv ->
    FStar_Reflection_Types.binder Prims.list ->
      (FStar_Reflection_Types.binder * Prims.bool) Prims.list)
  =
  fun ge ->
    fun bl ->
      FStar_List_Tot_Base.map (fun b -> (b, (binder_is_shadowed ge b))) bl
let (bv_is_abstract : genv -> FStar_Reflection_Types.bv -> Prims.bool) =
  fun ge ->
    fun bv ->
      match genv_get ge bv with
      | FStar_Pervasives_Native.None -> false
      | FStar_Pervasives_Native.Some (abs, uu___) -> abs
let (binder_is_abstract :
  genv -> FStar_Reflection_Types.binder -> Prims.bool) =
  fun ge ->
    fun b -> bv_is_abstract ge (FStar_Reflection_Derived.bv_of_binder b)
let (genv_abstract_bvs : genv -> FStar_Reflection_Types.bv Prims.list) =
  fun ge ->
    let abs =
      FStar_List_Tot_Base.filter
        (fun uu___ -> match uu___ with | (uu___1, (abs1, uu___2)) -> abs1)
        ge.bmap in
    FStar_List_Tot_Base.map
      (fun uu___ -> match uu___ with | (bv, uu___1) -> bv) abs
let rec (_fresh_bv :
  Prims.string Prims.list ->
    Prims.string ->
      Prims.int ->
        FStar_Reflection_Types.typ ->
          (FStar_Reflection_Types.bv, unit) FStar_Tactics_Effect.tac_repr)
  =
  fun binder_names ->
    fun basename ->
      fun i ->
        fun ty ->
          FStar_Tactics_Effect.tac_bind
            (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
               (Prims.of_int (315)) (Prims.of_int (13)) (Prims.of_int (315))
               (Prims.of_int (39)))
            (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
               (Prims.of_int (318)) (Prims.of_int (2)) (Prims.of_int (319))
               (Prims.of_int (29)))
            (FStar_Tactics_Effect.lift_div_tac
               (fun uu___ -> Prims.strcat basename (Prims.string_of_int i)))
            (fun uu___ ->
               (fun name ->
                  if FStar_List_Tot_Base.mem name binder_names
                  then
                    Obj.magic
                      (_fresh_bv binder_names basename (i + Prims.int_one) ty)
                  else
                    Obj.magic (FStar_Tactics_Builtins.fresh_bv_named name ty))
                 uu___)
let (fresh_bv :
  FStar_Reflection_Types.env ->
    Prims.string ->
      FStar_Reflection_Types.typ ->
        (FStar_Reflection_Types.bv, unit) FStar_Tactics_Effect.tac_repr)
  =
  fun e ->
    fun basename ->
      fun ty ->
        FStar_Tactics_Effect.tac_bind
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (322)) (Prims.of_int (16)) (Prims.of_int (322))
             (Prims.of_int (32)))
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (323)) (Prims.of_int (2)) (Prims.of_int (324))
             (Prims.of_int (38)))
          (FStar_Tactics_Effect.lift_div_tac
             (fun uu___ -> FStar_Reflection_Builtins.binders_of_env e))
          (fun uu___ ->
             (fun binders ->
                Obj.magic
                  (FStar_Tactics_Effect.tac_bind
                     (Prims.mk_range
                        "experimental/FStar.InteractiveHelpers.Base.fst"
                        (Prims.of_int (323)) (Prims.of_int (21))
                        (Prims.of_int (323)) (Prims.of_int (56)))
                     (Prims.mk_range
                        "experimental/FStar.InteractiveHelpers.Base.fst"
                        (Prims.of_int (324)) (Prims.of_int (2))
                        (Prims.of_int (324)) (Prims.of_int (38)))
                     (FStar_Tactics_Effect.lift_div_tac
                        (fun uu___ ->
                           FStar_List_Tot_Base.map
                             FStar_Reflection_Derived.name_of_binder binders))
                     (fun uu___ ->
                        (fun binder_names ->
                           Obj.magic
                             (_fresh_bv binder_names basename Prims.int_zero
                                ty)) uu___))) uu___)
let (fresh_binder :
  FStar_Reflection_Types.env ->
    Prims.string ->
      FStar_Reflection_Types.typ ->
        (FStar_Reflection_Types.binder, unit) FStar_Tactics_Effect.tac_repr)
  =
  fun e ->
    fun basename ->
      fun ty ->
        FStar_Tactics_Effect.tac_bind
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (327)) (Prims.of_int (11)) (Prims.of_int (327))
             (Prims.of_int (33)))
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (328)) (Prims.of_int (2)) (Prims.of_int (328))
             (Prims.of_int (14))) (Obj.magic (fresh_bv e basename ty))
          (fun bv ->
             FStar_Tactics_Effect.lift_div_tac
               (fun uu___ -> FStar_Reflection_Derived.mk_binder bv))
let (genv_push_fresh_binder :
  genv ->
    Prims.string ->
      FStar_Reflection_Types.typ ->
        ((genv * FStar_Reflection_Types.binder), unit)
          FStar_Tactics_Effect.tac_repr)
  =
  fun ge ->
    fun basename ->
      fun ty ->
        FStar_Tactics_Effect.tac_bind
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (331)) (Prims.of_int (10)) (Prims.of_int (331))
             (Prims.of_int (41)))
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (333)) (Prims.of_int (2)) (Prims.of_int (334))
             (Prims.of_int (8)))
          (Obj.magic (fresh_binder ge.env basename ty))
          (fun uu___ ->
             (fun b ->
                Obj.magic
                  (FStar_Tactics_Effect.tac_bind
                     (Prims.mk_range
                        "experimental/FStar.InteractiveHelpers.Base.fst"
                        (Prims.of_int (333)) (Prims.of_int (12))
                        (Prims.of_int (333)) (Prims.of_int (43)))
                     (Prims.mk_range
                        "experimental/FStar.InteractiveHelpers.Base.fst"
                        (Prims.of_int (334)) (Prims.of_int (2))
                        (Prims.of_int (334)) (Prims.of_int (8)))
                     (Obj.magic
                        (genv_push_binder ge b true
                           FStar_Pervasives_Native.None))
                     (fun ge' ->
                        FStar_Tactics_Effect.lift_div_tac
                          (fun uu___ -> (ge', b))))) uu___)
let (push_fresh_binder :
  FStar_Reflection_Types.env ->
    Prims.string ->
      FStar_Reflection_Types.typ ->
        ((FStar_Reflection_Types.env * FStar_Reflection_Types.binder), 
          unit) FStar_Tactics_Effect.tac_repr)
  =
  fun e ->
    fun basename ->
      fun ty ->
        FStar_Tactics_Effect.tac_bind
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (338)) (Prims.of_int (10)) (Prims.of_int (338))
             (Prims.of_int (36)))
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (339)) (Prims.of_int (2)) (Prims.of_int (340))
             (Prims.of_int (7))) (Obj.magic (fresh_binder e basename ty))
          (fun b ->
             FStar_Tactics_Effect.lift_div_tac
               (fun uu___ -> ((FStar_Reflection_Builtins.push_binder e b), b)))
let (genv_push_fresh_bv :
  genv ->
    Prims.string ->
      FStar_Reflection_Types.typ ->
        ((genv * FStar_Reflection_Types.bv), unit)
          FStar_Tactics_Effect.tac_repr)
  =
  fun ge ->
    fun basename ->
      fun ty ->
        FStar_Tactics_Effect.tac_bind
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (343)) (Prims.of_int (15)) (Prims.of_int (343))
             (Prims.of_int (52)))
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (343)) (Prims.of_int (2)) (Prims.of_int (344))
             (Prims.of_int (21)))
          (Obj.magic (genv_push_fresh_binder ge basename ty))
          (fun uu___ ->
             FStar_Tactics_Effect.lift_div_tac
               (fun uu___1 ->
                  match uu___ with
                  | (ge', b) ->
                      (ge', (FStar_Reflection_Derived.bv_of_binder b))))
let (push_fresh_var :
  FStar_Reflection_Types.env ->
    Prims.string ->
      FStar_Reflection_Types.typ ->
        ((FStar_Reflection_Types.term * FStar_Reflection_Types.binder *
           FStar_Reflection_Types.env),
          unit) FStar_Tactics_Effect.tac_repr)
  =
  fun e0 ->
    fun basename ->
      fun ty ->
        FStar_Tactics_Effect.tac_bind
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (348)) (Prims.of_int (15)) (Prims.of_int (348))
             (Prims.of_int (47)))
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (348)) (Prims.of_int (2)) (Prims.of_int (350))
             (Prims.of_int (12)))
          (Obj.magic (push_fresh_binder e0 basename ty))
          (fun uu___ ->
             (fun uu___ ->
                match uu___ with
                | (e1, b1) ->
                    Obj.magic
                      (FStar_Tactics_Effect.tac_bind
                         (Prims.mk_range
                            "experimental/FStar.InteractiveHelpers.Base.fst"
                            (Prims.of_int (349)) (Prims.of_int (11))
                            (Prims.of_int (349)) (Prims.of_int (42)))
                         (Prims.mk_range
                            "experimental/FStar.InteractiveHelpers.Base.fst"
                            (Prims.of_int (350)) (Prims.of_int (2))
                            (Prims.of_int (350)) (Prims.of_int (12)))
                         (Obj.magic
                            (FStar_Tactics_Builtins.pack
                               (FStar_Reflection_Data.Tv_Var
                                  (FStar_Reflection_Derived.bv_of_binder b1))))
                         (fun v1 ->
                            FStar_Tactics_Effect.lift_div_tac
                              (fun uu___1 -> (v1, b1, e1))))) uu___)
let (genv_push_fresh_var :
  genv ->
    Prims.string ->
      FStar_Reflection_Types.typ ->
        ((FStar_Reflection_Types.term * FStar_Reflection_Types.binder * genv),
          unit) FStar_Tactics_Effect.tac_repr)
  =
  fun ge0 ->
    fun basename ->
      fun ty ->
        FStar_Tactics_Effect.tac_bind
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (354)) (Prims.of_int (16)) (Prims.of_int (354))
             (Prims.of_int (54)))
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (354)) (Prims.of_int (2)) (Prims.of_int (356))
             (Prims.of_int (13)))
          (Obj.magic (genv_push_fresh_binder ge0 basename ty))
          (fun uu___ ->
             (fun uu___ ->
                match uu___ with
                | (ge1, b1) ->
                    Obj.magic
                      (FStar_Tactics_Effect.tac_bind
                         (Prims.mk_range
                            "experimental/FStar.InteractiveHelpers.Base.fst"
                            (Prims.of_int (355)) (Prims.of_int (11))
                            (Prims.of_int (355)) (Prims.of_int (42)))
                         (Prims.mk_range
                            "experimental/FStar.InteractiveHelpers.Base.fst"
                            (Prims.of_int (356)) (Prims.of_int (2))
                            (Prims.of_int (356)) (Prims.of_int (13)))
                         (Obj.magic
                            (FStar_Tactics_Builtins.pack
                               (FStar_Reflection_Data.Tv_Var
                                  (FStar_Reflection_Derived.bv_of_binder b1))))
                         (fun v1 ->
                            FStar_Tactics_Effect.lift_div_tac
                              (fun uu___1 -> (v1, b1, ge1))))) uu___)
let (push_two_fresh_vars :
  FStar_Reflection_Types.env ->
    Prims.string ->
      FStar_Reflection_Types.typ ->
        ((FStar_Reflection_Types.term * FStar_Reflection_Types.binder *
           FStar_Reflection_Types.term * FStar_Reflection_Types.binder *
           FStar_Reflection_Types.env),
          unit) FStar_Tactics_Effect.tac_repr)
  =
  fun e0 ->
    fun basename ->
      fun ty ->
        FStar_Tactics_Effect.tac_bind
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (360)) (Prims.of_int (15)) (Prims.of_int (360))
             (Prims.of_int (47)))
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (360)) (Prims.of_int (2)) (Prims.of_int (364))
             (Prims.of_int (20)))
          (Obj.magic (push_fresh_binder e0 basename ty))
          (fun uu___ ->
             (fun uu___ ->
                match uu___ with
                | (e1, b1) ->
                    Obj.magic
                      (FStar_Tactics_Effect.tac_bind
                         (Prims.mk_range
                            "experimental/FStar.InteractiveHelpers.Base.fst"
                            (Prims.of_int (361)) (Prims.of_int (15))
                            (Prims.of_int (361)) (Prims.of_int (47)))
                         (Prims.mk_range
                            "experimental/FStar.InteractiveHelpers.Base.fst"
                            (Prims.of_int (361)) (Prims.of_int (2))
                            (Prims.of_int (364)) (Prims.of_int (20)))
                         (Obj.magic (push_fresh_binder e1 basename ty))
                         (fun uu___1 ->
                            (fun uu___1 ->
                               match uu___1 with
                               | (e2, b2) ->
                                   Obj.magic
                                     (FStar_Tactics_Effect.tac_bind
                                        (Prims.mk_range
                                           "experimental/FStar.InteractiveHelpers.Base.fst"
                                           (Prims.of_int (362))
                                           (Prims.of_int (11))
                                           (Prims.of_int (362))
                                           (Prims.of_int (42)))
                                        (Prims.mk_range
                                           "experimental/FStar.InteractiveHelpers.Base.fst"
                                           (Prims.of_int (363))
                                           (Prims.of_int (2))
                                           (Prims.of_int (364))
                                           (Prims.of_int (20)))
                                        (Obj.magic
                                           (FStar_Tactics_Builtins.pack
                                              (FStar_Reflection_Data.Tv_Var
                                                 (FStar_Reflection_Derived.bv_of_binder
                                                    b1))))
                                        (fun uu___2 ->
                                           (fun v1 ->
                                              Obj.magic
                                                (FStar_Tactics_Effect.tac_bind
                                                   (Prims.mk_range
                                                      "experimental/FStar.InteractiveHelpers.Base.fst"
                                                      (Prims.of_int (363))
                                                      (Prims.of_int (11))
                                                      (Prims.of_int (363))
                                                      (Prims.of_int (42)))
                                                   (Prims.mk_range
                                                      "experimental/FStar.InteractiveHelpers.Base.fst"
                                                      (Prims.of_int (364))
                                                      (Prims.of_int (2))
                                                      (Prims.of_int (364))
                                                      (Prims.of_int (20)))
                                                   (Obj.magic
                                                      (FStar_Tactics_Builtins.pack
                                                         (FStar_Reflection_Data.Tv_Var
                                                            (FStar_Reflection_Derived.bv_of_binder
                                                               b2))))
                                                   (fun v2 ->
                                                      FStar_Tactics_Effect.lift_div_tac
                                                        (fun uu___2 ->
                                                           (v1, b1, v2, b2,
                                                             e2))))) uu___2)))
                              uu___1))) uu___)
let (genv_push_two_fresh_vars :
  genv ->
    Prims.string ->
      FStar_Reflection_Types.typ ->
        ((FStar_Reflection_Types.term * FStar_Reflection_Types.binder *
           FStar_Reflection_Types.term * FStar_Reflection_Types.binder *
           genv),
          unit) FStar_Tactics_Effect.tac_repr)
  =
  fun ge0 ->
    fun basename ->
      fun ty ->
        FStar_Tactics_Effect.tac_bind
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (368)) (Prims.of_int (16)) (Prims.of_int (368))
             (Prims.of_int (54)))
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (368)) (Prims.of_int (2)) (Prims.of_int (372))
             (Prims.of_int (21)))
          (Obj.magic (genv_push_fresh_binder ge0 basename ty))
          (fun uu___ ->
             (fun uu___ ->
                match uu___ with
                | (ge1, b1) ->
                    Obj.magic
                      (FStar_Tactics_Effect.tac_bind
                         (Prims.mk_range
                            "experimental/FStar.InteractiveHelpers.Base.fst"
                            (Prims.of_int (369)) (Prims.of_int (16))
                            (Prims.of_int (369)) (Prims.of_int (54)))
                         (Prims.mk_range
                            "experimental/FStar.InteractiveHelpers.Base.fst"
                            (Prims.of_int (369)) (Prims.of_int (2))
                            (Prims.of_int (372)) (Prims.of_int (21)))
                         (Obj.magic (genv_push_fresh_binder ge1 basename ty))
                         (fun uu___1 ->
                            (fun uu___1 ->
                               match uu___1 with
                               | (ge2, b2) ->
                                   Obj.magic
                                     (FStar_Tactics_Effect.tac_bind
                                        (Prims.mk_range
                                           "experimental/FStar.InteractiveHelpers.Base.fst"
                                           (Prims.of_int (370))
                                           (Prims.of_int (11))
                                           (Prims.of_int (370))
                                           (Prims.of_int (42)))
                                        (Prims.mk_range
                                           "experimental/FStar.InteractiveHelpers.Base.fst"
                                           (Prims.of_int (371))
                                           (Prims.of_int (2))
                                           (Prims.of_int (372))
                                           (Prims.of_int (21)))
                                        (Obj.magic
                                           (FStar_Tactics_Builtins.pack
                                              (FStar_Reflection_Data.Tv_Var
                                                 (FStar_Reflection_Derived.bv_of_binder
                                                    b1))))
                                        (fun uu___2 ->
                                           (fun v1 ->
                                              Obj.magic
                                                (FStar_Tactics_Effect.tac_bind
                                                   (Prims.mk_range
                                                      "experimental/FStar.InteractiveHelpers.Base.fst"
                                                      (Prims.of_int (371))
                                                      (Prims.of_int (11))
                                                      (Prims.of_int (371))
                                                      (Prims.of_int (42)))
                                                   (Prims.mk_range
                                                      "experimental/FStar.InteractiveHelpers.Base.fst"
                                                      (Prims.of_int (372))
                                                      (Prims.of_int (2))
                                                      (Prims.of_int (372))
                                                      (Prims.of_int (21)))
                                                   (Obj.magic
                                                      (FStar_Tactics_Builtins.pack
                                                         (FStar_Reflection_Data.Tv_Var
                                                            (FStar_Reflection_Derived.bv_of_binder
                                                               b2))))
                                                   (fun v2 ->
                                                      FStar_Tactics_Effect.lift_div_tac
                                                        (fun uu___2 ->
                                                           (v1, b1, v2, b2,
                                                             ge2))))) uu___2)))
                              uu___1))) uu___)
let (norm_apply_subst :
  FStar_Reflection_Types.env ->
    FStar_Reflection_Types.term ->
      (FStar_Reflection_Types.bv * FStar_Reflection_Types.term) Prims.list ->
        (FStar_Reflection_Types.term, unit) FStar_Tactics_Effect.tac_repr)
  =
  fun e ->
    fun t ->
      fun subst ->
        FStar_Tactics_Effect.tac_bind
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (386)) (Prims.of_int (15)) (Prims.of_int (386))
             (Prims.of_int (26)))
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (386)) (Prims.of_int (2)) (Prims.of_int (390))
             (Prims.of_int (23)))
          (FStar_Tactics_Effect.lift_div_tac (fun uu___ -> unzip subst))
          (fun uu___ ->
             (fun uu___ ->
                match uu___ with
                | (bl, vl) ->
                    Obj.magic
                      (FStar_Tactics_Effect.tac_bind
                         (Prims.mk_range
                            "experimental/FStar.InteractiveHelpers.Base.fst"
                            (Prims.of_int (387)) (Prims.of_int (11))
                            (Prims.of_int (387)) (Prims.of_int (36)))
                         (Prims.mk_range
                            "experimental/FStar.InteractiveHelpers.Base.fst"
                            (Prims.of_int (388)) (Prims.of_int (2))
                            (Prims.of_int (390)) (Prims.of_int (23)))
                         (FStar_Tactics_Effect.lift_div_tac
                            (fun uu___1 ->
                               FStar_List_Tot_Base.map
                                 FStar_Reflection_Derived.mk_binder bl))
                         (fun uu___1 ->
                            (fun bl1 ->
                               Obj.magic
                                 (FStar_Tactics_Effect.tac_bind
                                    (Prims.mk_range
                                       "experimental/FStar.InteractiveHelpers.Base.fst"
                                       (Prims.of_int (388))
                                       (Prims.of_int (11))
                                       (Prims.of_int (388))
                                       (Prims.of_int (22)))
                                    (Prims.mk_range
                                       "experimental/FStar.InteractiveHelpers.Base.fst"
                                       (Prims.of_int (389))
                                       (Prims.of_int (2))
                                       (Prims.of_int (390))
                                       (Prims.of_int (23)))
                                    (Obj.magic
                                       (FStar_Tactics_Derived.mk_abs bl1 t))
                                    (fun uu___1 ->
                                       (fun t1 ->
                                          Obj.magic
                                            (FStar_Tactics_Effect.tac_bind
                                               (Prims.mk_range
                                                  "experimental/FStar.InteractiveHelpers.Base.fst"
                                                  (Prims.of_int (389))
                                                  (Prims.of_int (11))
                                                  (Prims.of_int (389))
                                                  (Prims.of_int (25)))
                                               (Prims.mk_range
                                                  "experimental/FStar.InteractiveHelpers.Base.fst"
                                                  (Prims.of_int (390))
                                                  (Prims.of_int (2))
                                                  (Prims.of_int (390))
                                                  (Prims.of_int (23)))
                                               (FStar_Tactics_Effect.lift_div_tac
                                                  (fun uu___1 ->
                                                     FStar_Reflection_Derived.mk_e_app
                                                       t1 vl))
                                               (fun uu___1 ->
                                                  (fun t2 ->
                                                     Obj.magic
                                                       (FStar_Tactics_Builtins.norm_term_env
                                                          e [] t2)) uu___1)))
                                         uu___1))) uu___1))) uu___)
let (norm_apply_subst_in_comp :
  FStar_Reflection_Types.env ->
    FStar_Reflection_Types.comp ->
      (FStar_Reflection_Types.bv * FStar_Reflection_Types.term) Prims.list ->
        (FStar_Reflection_Types.comp, unit) FStar_Tactics_Effect.tac_repr)
  =
  fun e ->
    fun c ->
      fun subst ->
        FStar_Tactics_Effect.tac_bind
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (393)) (Prims.of_int (14)) (Prims.of_int (393))
             (Prims.of_int (51)))
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (394)) (Prims.of_int (2)) (Prims.of_int (416))
             (Prims.of_int (55)))
          (FStar_Tactics_Effect.lift_div_tac
             (fun uu___ -> fun x -> norm_apply_subst e x subst))
          (fun uu___ ->
             (fun subst1 ->
                Obj.magic
                  (FStar_Tactics_Effect.tac_bind
                     (Prims.mk_range
                        "experimental/FStar.InteractiveHelpers.Base.fst"
                        (Prims.of_int (395)) (Prims.of_int (4))
                        (Prims.of_int (398)) (Prims.of_int (34)))
                     (Prims.mk_range
                        "experimental/FStar.InteractiveHelpers.Base.fst"
                        (Prims.of_int (400)) (Prims.of_int (2))
                        (Prims.of_int (416)) (Prims.of_int (55)))
                     (FStar_Tactics_Effect.lift_div_tac
                        (fun uu___1 ->
                           fun uu___ ->
                             (fun uu___ ->
                                fun a ->
                                  match a with
                                  | FStar_Reflection_Data.Q_Implicit ->
                                      Obj.magic
                                        (Obj.repr
                                           (FStar_Tactics_Effect.lift_div_tac
                                              (fun uu___1 -> a)))
                                  | FStar_Reflection_Data.Q_Explicit ->
                                      Obj.magic
                                        (Obj.repr
                                           (FStar_Tactics_Effect.lift_div_tac
                                              (fun uu___1 -> a)))
                                  | FStar_Reflection_Data.Q_Meta t ->
                                      Obj.magic
                                        (Obj.repr
                                           (FStar_Tactics_Effect.tac_bind
                                              (Prims.mk_range
                                                 "experimental/FStar.InteractiveHelpers.Base.fst"
                                                 (Prims.of_int (398))
                                                 (Prims.of_int (25))
                                                 (Prims.of_int (398))
                                                 (Prims.of_int (34)))
                                              (Prims.mk_range
                                                 "experimental/FStar.InteractiveHelpers.Base.fst"
                                                 (Prims.of_int (398))
                                                 (Prims.of_int (18))
                                                 (Prims.of_int (398))
                                                 (Prims.of_int (34)))
                                              (Obj.magic (subst1 t))
                                              (fun uu___1 ->
                                                 FStar_Tactics_Effect.lift_div_tac
                                                   (fun uu___2 ->
                                                      FStar_Reflection_Data.Q_Meta
                                                        uu___1))))) uu___1
                               uu___))
                     (fun uu___ ->
                        (fun subst_in_aqualv ->
                           match FStar_Reflection_Builtins.inspect_comp c
                           with
                           | FStar_Reflection_Data.C_Total ret ->
                               Obj.magic
                                 (FStar_Tactics_Effect.tac_bind
                                    (Prims.mk_range
                                       "experimental/FStar.InteractiveHelpers.Base.fst"
                                       (Prims.of_int (402))
                                       (Prims.of_int (14))
                                       (Prims.of_int (402))
                                       (Prims.of_int (23)))
                                    (Prims.mk_range
                                       "experimental/FStar.InteractiveHelpers.Base.fst"
                                       (Prims.of_int (403))
                                       (Prims.of_int (4))
                                       (Prims.of_int (403))
                                       (Prims.of_int (27)))
                                    (Obj.magic (subst1 ret))
                                    (fun ret1 ->
                                       FStar_Tactics_Effect.lift_div_tac
                                         (fun uu___ ->
                                            FStar_Reflection_Builtins.pack_comp
                                              (FStar_Reflection_Data.C_Total
                                                 ret1))))
                           | FStar_Reflection_Data.C_GTotal ret ->
                               Obj.magic
                                 (FStar_Tactics_Effect.tac_bind
                                    (Prims.mk_range
                                       "experimental/FStar.InteractiveHelpers.Base.fst"
                                       (Prims.of_int (405))
                                       (Prims.of_int (14))
                                       (Prims.of_int (405))
                                       (Prims.of_int (23)))
                                    (Prims.mk_range
                                       "experimental/FStar.InteractiveHelpers.Base.fst"
                                       (Prims.of_int (406))
                                       (Prims.of_int (4))
                                       (Prims.of_int (406))
                                       (Prims.of_int (28)))
                                    (Obj.magic (subst1 ret))
                                    (fun ret1 ->
                                       FStar_Tactics_Effect.lift_div_tac
                                         (fun uu___ ->
                                            FStar_Reflection_Builtins.pack_comp
                                              (FStar_Reflection_Data.C_GTotal
                                                 ret1))))
                           | FStar_Reflection_Data.C_Lemma
                               (pre, post, patterns) ->
                               Obj.magic
                                 (FStar_Tactics_Effect.tac_bind
                                    (Prims.mk_range
                                       "experimental/FStar.InteractiveHelpers.Base.fst"
                                       (Prims.of_int (408))
                                       (Prims.of_int (14))
                                       (Prims.of_int (408))
                                       (Prims.of_int (23)))
                                    (Prims.mk_range
                                       "experimental/FStar.InteractiveHelpers.Base.fst"
                                       (Prims.of_int (409))
                                       (Prims.of_int (4))
                                       (Prims.of_int (411))
                                       (Prims.of_int (41)))
                                    (Obj.magic (subst1 pre))
                                    (fun uu___ ->
                                       (fun pre1 ->
                                          Obj.magic
                                            (FStar_Tactics_Effect.tac_bind
                                               (Prims.mk_range
                                                  "experimental/FStar.InteractiveHelpers.Base.fst"
                                                  (Prims.of_int (409))
                                                  (Prims.of_int (15))
                                                  (Prims.of_int (409))
                                                  (Prims.of_int (25)))
                                               (Prims.mk_range
                                                  "experimental/FStar.InteractiveHelpers.Base.fst"
                                                  (Prims.of_int (410))
                                                  (Prims.of_int (4))
                                                  (Prims.of_int (411))
                                                  (Prims.of_int (41)))
                                               (Obj.magic (subst1 post))
                                               (fun uu___ ->
                                                  (fun post1 ->
                                                     Obj.magic
                                                       (FStar_Tactics_Effect.tac_bind
                                                          (Prims.mk_range
                                                             "experimental/FStar.InteractiveHelpers.Base.fst"
                                                             (Prims.of_int (410))
                                                             (Prims.of_int (19))
                                                             (Prims.of_int (410))
                                                             (Prims.of_int (33)))
                                                          (Prims.mk_range
                                                             "experimental/FStar.InteractiveHelpers.Base.fst"
                                                             (Prims.of_int (411))
                                                             (Prims.of_int (4))
                                                             (Prims.of_int (411))
                                                             (Prims.of_int (41)))
                                                          (Obj.magic
                                                             (subst1 patterns))
                                                          (fun patterns1 ->
                                                             FStar_Tactics_Effect.lift_div_tac
                                                               (fun uu___ ->
                                                                  FStar_Reflection_Builtins.pack_comp
                                                                    (
                                                                    FStar_Reflection_Data.C_Lemma
                                                                    (pre1,
                                                                    post1,
                                                                    patterns1))))))
                                                    uu___))) uu___))
                           | FStar_Reflection_Data.C_Eff
                               (us, eff_name, result, eff_args, decrs) ->
                               Obj.magic
                                 (FStar_Tactics_Effect.tac_bind
                                    (Prims.mk_range
                                       "experimental/FStar.InteractiveHelpers.Base.fst"
                                       (Prims.of_int (413))
                                       (Prims.of_int (17))
                                       (Prims.of_int (413))
                                       (Prims.of_int (29)))
                                    (Prims.mk_range
                                       "experimental/FStar.InteractiveHelpers.Base.fst"
                                       (Prims.of_int (414))
                                       (Prims.of_int (4))
                                       (Prims.of_int (416))
                                       (Prims.of_int (55)))
                                    (Obj.magic (subst1 result))
                                    (fun uu___ ->
                                       (fun result1 ->
                                          Obj.magic
                                            (FStar_Tactics_Effect.tac_bind
                                               (Prims.mk_range
                                                  "experimental/FStar.InteractiveHelpers.Base.fst"
                                                  (Prims.of_int (414))
                                                  (Prims.of_int (19))
                                                  (Prims.of_int (414))
                                                  (Prims.of_int (76)))
                                               (Prims.mk_range
                                                  "experimental/FStar.InteractiveHelpers.Base.fst"
                                                  (Prims.of_int (415))
                                                  (Prims.of_int (4))
                                                  (Prims.of_int (416))
                                                  (Prims.of_int (55)))
                                               (Obj.magic
                                                  (FStar_Tactics_Util.map
                                                     (fun uu___ ->
                                                        match uu___ with
                                                        | (x, a) ->
                                                            FStar_Tactics_Effect.tac_bind
                                                              (Prims.mk_range
                                                                 "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                 (Prims.of_int (414))
                                                                 (Prims.of_int (39))
                                                                 (Prims.of_int (414))
                                                                 (Prims.of_int (46)))
                                                              (Prims.mk_range
                                                                 "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                 (Prims.of_int (414))
                                                                 (Prims.of_int (38))
                                                                 (Prims.of_int (414))
                                                                 (Prims.of_int (66)))
                                                              (Obj.magic
                                                                 (subst1 x))
                                                              (fun uu___1 ->
                                                                 (fun uu___1
                                                                    ->
                                                                    Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (414))
                                                                    (Prims.of_int (48))
                                                                    (Prims.of_int (414))
                                                                    (Prims.of_int (65)))
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (414))
                                                                    (Prims.of_int (38))
                                                                    (Prims.of_int (414))
                                                                    (Prims.of_int (66)))
                                                                    (Obj.magic
                                                                    (subst_in_aqualv
                                                                    a))
                                                                    (fun
                                                                    uu___2 ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___3 ->
                                                                    (uu___1,
                                                                    uu___2)))))
                                                                   uu___1))
                                                     eff_args))
                                               (fun uu___ ->
                                                  (fun eff_args1 ->
                                                     Obj.magic
                                                       (FStar_Tactics_Effect.tac_bind
                                                          (Prims.mk_range
                                                             "experimental/FStar.InteractiveHelpers.Base.fst"
                                                             (Prims.of_int (415))
                                                             (Prims.of_int (16))
                                                             (Prims.of_int (415))
                                                             (Prims.of_int (31)))
                                                          (Prims.mk_range
                                                             "experimental/FStar.InteractiveHelpers.Base.fst"
                                                             (Prims.of_int (416))
                                                             (Prims.of_int (4))
                                                             (Prims.of_int (416))
                                                             (Prims.of_int (55)))
                                                          (Obj.magic
                                                             (FStar_Tactics_Util.map
                                                                subst1 decrs))
                                                          (fun decrs1 ->
                                                             FStar_Tactics_Effect.lift_div_tac
                                                               (fun uu___ ->
                                                                  FStar_Reflection_Builtins.pack_comp
                                                                    (
                                                                    FStar_Reflection_Data.C_Eff
                                                                    (us,
                                                                    eff_name,
                                                                    result1,
                                                                    eff_args1,
                                                                    decrs1))))))
                                                    uu___))) uu___))) uu___)))
               uu___)
let rec (deep_apply_subst :
  FStar_Reflection_Types.env ->
    FStar_Reflection_Types.term ->
      (FStar_Reflection_Types.bv * FStar_Reflection_Types.term) Prims.list ->
        (FStar_Reflection_Types.term, unit) FStar_Tactics_Effect.tac_repr)
  =
  fun e ->
    fun t ->
      fun subst ->
        FStar_Tactics_Effect.tac_bind
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (435)) (Prims.of_int (8)) (Prims.of_int (435))
             (Prims.of_int (17)))
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (435)) (Prims.of_int (2)) (Prims.of_int (508))
             (Prims.of_int (5)))
          (Obj.magic (FStar_Tactics_Builtins.inspect t))
          (fun uu___ ->
             (fun uu___ ->
                match uu___ with
                | FStar_Reflection_Data.Tv_Var b ->
                    Obj.magic
                      (Obj.repr
                         (FStar_Tactics_Effect.lift_div_tac
                            (fun uu___1 ->
                               match bind_map_get subst b with
                               | FStar_Pervasives_Native.None -> t
                               | FStar_Pervasives_Native.Some t' -> t')))
                | FStar_Reflection_Data.Tv_BVar b ->
                    Obj.magic
                      (Obj.repr
                         (FStar_Tactics_Effect.lift_div_tac
                            (fun uu___1 ->
                               match bind_map_get subst b with
                               | FStar_Pervasives_Native.None -> t
                               | FStar_Pervasives_Native.Some t' -> t')))
                | FStar_Reflection_Data.Tv_FVar uu___1 ->
                    Obj.magic
                      (Obj.repr
                         (FStar_Tactics_Effect.lift_div_tac (fun uu___2 -> t)))
                | FStar_Reflection_Data.Tv_App (hd, (a, qual)) ->
                    Obj.magic
                      (Obj.repr
                         (FStar_Tactics_Effect.tac_bind
                            (Prims.mk_range
                               "experimental/FStar.InteractiveHelpers.Base.fst"
                               (Prims.of_int (449)) (Prims.of_int (13))
                               (Prims.of_int (449)) (Prims.of_int (40)))
                            (Prims.mk_range
                               "experimental/FStar.InteractiveHelpers.Base.fst"
                               (Prims.of_int (450)) (Prims.of_int (4))
                               (Prims.of_int (451)) (Prims.of_int (30)))
                            (Obj.magic (deep_apply_subst e hd subst))
                            (fun uu___1 ->
                               (fun hd1 ->
                                  Obj.magic
                                    (FStar_Tactics_Effect.tac_bind
                                       (Prims.mk_range
                                          "experimental/FStar.InteractiveHelpers.Base.fst"
                                          (Prims.of_int (450))
                                          (Prims.of_int (12))
                                          (Prims.of_int (450))
                                          (Prims.of_int (38)))
                                       (Prims.mk_range
                                          "experimental/FStar.InteractiveHelpers.Base.fst"
                                          (Prims.of_int (451))
                                          (Prims.of_int (4))
                                          (Prims.of_int (451))
                                          (Prims.of_int (30)))
                                       (Obj.magic
                                          (deep_apply_subst e a subst))
                                       (fun uu___1 ->
                                          (fun a1 ->
                                             Obj.magic
                                               (FStar_Tactics_Builtins.pack
                                                  (FStar_Reflection_Data.Tv_App
                                                     (hd1, (a1, qual)))))
                                            uu___1))) uu___1)))
                | FStar_Reflection_Data.Tv_Abs (br, body) ->
                    Obj.magic
                      (Obj.repr
                         (FStar_Tactics_Effect.tac_bind
                            (Prims.mk_range
                               "experimental/FStar.InteractiveHelpers.Base.fst"
                               (Prims.of_int (453)) (Prims.of_int (15))
                               (Prims.of_int (453)) (Prims.of_int (44)))
                            (Prims.mk_range
                               "experimental/FStar.InteractiveHelpers.Base.fst"
                               (Prims.of_int (454)) (Prims.of_int (4))
                               (Prims.of_int (454)) (Prims.of_int (25)))
                            (Obj.magic (deep_apply_subst e body subst))
                            (fun uu___1 ->
                               (fun body1 ->
                                  Obj.magic
                                    (FStar_Tactics_Builtins.pack
                                       (FStar_Reflection_Data.Tv_Abs
                                          (br, body1)))) uu___1)))
                | FStar_Reflection_Data.Tv_Arrow (br, c) ->
                    Obj.magic
                      (Obj.repr
                         (FStar_Tactics_Effect.tac_bind
                            (Prims.mk_range
                               "experimental/FStar.InteractiveHelpers.Base.fst"
                               (Prims.of_int (456)) (Prims.of_int (20))
                               (Prims.of_int (456)) (Prims.of_int (57)))
                            (Prims.mk_range
                               "experimental/FStar.InteractiveHelpers.Base.fst"
                               (Prims.of_int (456)) (Prims.of_int (4))
                               (Prims.of_int (458)) (Prims.of_int (24)))
                            (Obj.magic
                               (deep_apply_subst_in_binder e br subst))
                            (fun uu___1 ->
                               (fun uu___1 ->
                                  match uu___1 with
                                  | (br1, subst1) ->
                                      Obj.magic
                                        (FStar_Tactics_Effect.tac_bind
                                           (Prims.mk_range
                                              "experimental/FStar.InteractiveHelpers.Base.fst"
                                              (Prims.of_int (457))
                                              (Prims.of_int (12))
                                              (Prims.of_int (457))
                                              (Prims.of_int (46)))
                                           (Prims.mk_range
                                              "experimental/FStar.InteractiveHelpers.Base.fst"
                                              (Prims.of_int (458))
                                              (Prims.of_int (4))
                                              (Prims.of_int (458))
                                              (Prims.of_int (24)))
                                           (Obj.magic
                                              (deep_apply_subst_in_comp e c
                                                 subst1))
                                           (fun uu___2 ->
                                              (fun c1 ->
                                                 Obj.magic
                                                   (FStar_Tactics_Builtins.pack
                                                      (FStar_Reflection_Data.Tv_Arrow
                                                         (br1, c1)))) uu___2)))
                                 uu___1)))
                | FStar_Reflection_Data.Tv_Type uu___1 ->
                    Obj.magic
                      (Obj.repr
                         (FStar_Tactics_Effect.lift_div_tac (fun uu___2 -> t)))
                | FStar_Reflection_Data.Tv_Refine (bv, ref) ->
                    Obj.magic
                      (Obj.repr
                         (FStar_Tactics_Effect.tac_bind
                            (Prims.mk_range
                               "experimental/FStar.InteractiveHelpers.Base.fst"
                               (Prims.of_int (461)) (Prims.of_int (20))
                               (Prims.of_int (461)) (Prims.of_int (53)))
                            (Prims.mk_range
                               "experimental/FStar.InteractiveHelpers.Base.fst"
                               (Prims.of_int (461)) (Prims.of_int (4))
                               (Prims.of_int (463)) (Prims.of_int (27)))
                            (Obj.magic (deep_apply_subst_in_bv e bv subst))
                            (fun uu___1 ->
                               (fun uu___1 ->
                                  match uu___1 with
                                  | (bv1, subst1) ->
                                      Obj.magic
                                        (FStar_Tactics_Effect.tac_bind
                                           (Prims.mk_range
                                              "experimental/FStar.InteractiveHelpers.Base.fst"
                                              (Prims.of_int (462))
                                              (Prims.of_int (14))
                                              (Prims.of_int (462))
                                              (Prims.of_int (42)))
                                           (Prims.mk_range
                                              "experimental/FStar.InteractiveHelpers.Base.fst"
                                              (Prims.of_int (463))
                                              (Prims.of_int (4))
                                              (Prims.of_int (463))
                                              (Prims.of_int (27)))
                                           (Obj.magic
                                              (deep_apply_subst e ref subst1))
                                           (fun uu___2 ->
                                              (fun ref1 ->
                                                 Obj.magic
                                                   (FStar_Tactics_Builtins.pack
                                                      (FStar_Reflection_Data.Tv_Refine
                                                         (bv1, ref1))))
                                                uu___2))) uu___1)))
                | FStar_Reflection_Data.Tv_Const uu___1 ->
                    Obj.magic
                      (Obj.repr
                         (FStar_Tactics_Effect.lift_div_tac (fun uu___2 -> t)))
                | FStar_Reflection_Data.Tv_Uvar (uu___1, uu___2) ->
                    Obj.magic
                      (Obj.repr
                         (FStar_Tactics_Effect.lift_div_tac (fun uu___3 -> t)))
                | FStar_Reflection_Data.Tv_Let (recf, attrs, bv, def, body)
                    ->
                    Obj.magic
                      (Obj.repr
                         (FStar_Tactics_Effect.tac_bind
                            (Prims.mk_range
                               "experimental/FStar.InteractiveHelpers.Base.fst"
                               (Prims.of_int (468)) (Prims.of_int (20))
                               (Prims.of_int (468)) (Prims.of_int (53)))
                            (Prims.mk_range
                               "experimental/FStar.InteractiveHelpers.Base.fst"
                               (Prims.of_int (468)) (Prims.of_int (4))
                               (Prims.of_int (471)) (Prims.of_int (37)))
                            (Obj.magic (deep_apply_subst_in_bv e bv subst))
                            (fun uu___1 ->
                               (fun uu___1 ->
                                  match uu___1 with
                                  | (bv1, subst1) ->
                                      Obj.magic
                                        (FStar_Tactics_Effect.tac_bind
                                           (Prims.mk_range
                                              "experimental/FStar.InteractiveHelpers.Base.fst"
                                              (Prims.of_int (469))
                                              (Prims.of_int (14))
                                              (Prims.of_int (469))
                                              (Prims.of_int (42)))
                                           (Prims.mk_range
                                              "experimental/FStar.InteractiveHelpers.Base.fst"
                                              (Prims.of_int (470))
                                              (Prims.of_int (4))
                                              (Prims.of_int (471))
                                              (Prims.of_int (37)))
                                           (Obj.magic
                                              (deep_apply_subst e def subst1))
                                           (fun uu___2 ->
                                              (fun def1 ->
                                                 Obj.magic
                                                   (FStar_Tactics_Effect.tac_bind
                                                      (Prims.mk_range
                                                         "experimental/FStar.InteractiveHelpers.Base.fst"
                                                         (Prims.of_int (470))
                                                         (Prims.of_int (15))
                                                         (Prims.of_int (470))
                                                         (Prims.of_int (44)))
                                                      (Prims.mk_range
                                                         "experimental/FStar.InteractiveHelpers.Base.fst"
                                                         (Prims.of_int (471))
                                                         (Prims.of_int (4))
                                                         (Prims.of_int (471))
                                                         (Prims.of_int (37)))
                                                      (Obj.magic
                                                         (deep_apply_subst e
                                                            body subst1))
                                                      (fun uu___2 ->
                                                         (fun body1 ->
                                                            Obj.magic
                                                              (FStar_Tactics_Builtins.pack
                                                                 (FStar_Reflection_Data.Tv_Let
                                                                    (recf,
                                                                    [], bv1,
                                                                    def1,
                                                                    body1))))
                                                           uu___2))) uu___2)))
                                 uu___1)))
                | FStar_Reflection_Data.Tv_Match
                    (scrutinee, ret_opt, branches) ->
                    Obj.magic
                      (Obj.repr
                         (FStar_Tactics_Effect.tac_bind
                            (Prims.mk_range
                               "experimental/FStar.InteractiveHelpers.Base.fst"
                               (Prims.of_int (473)) (Prims.of_int (20))
                               (Prims.of_int (473)) (Prims.of_int (54)))
                            (Prims.mk_range
                               "experimental/FStar.InteractiveHelpers.Base.fst"
                               (Prims.of_int (474)) (Prims.of_int (4))
                               (Prims.of_int (495)) (Prims.of_int (46)))
                            (Obj.magic (deep_apply_subst e scrutinee subst))
                            (fun uu___1 ->
                               (fun scrutinee1 ->
                                  Obj.magic
                                    (FStar_Tactics_Effect.tac_bind
                                       (Prims.mk_range
                                          "experimental/FStar.InteractiveHelpers.Base.fst"
                                          (Prims.of_int (474))
                                          (Prims.of_int (18))
                                          (Prims.of_int (486))
                                          (Prims.of_int (21)))
                                       (Prims.mk_range
                                          "experimental/FStar.InteractiveHelpers.Base.fst"
                                          (Prims.of_int (488))
                                          (Prims.of_int (4))
                                          (Prims.of_int (495))
                                          (Prims.of_int (46)))
                                       (Obj.magic
                                          (FStar_Tactics_Util.map_opt
                                             (fun uu___1 ->
                                                match uu___1 with
                                                | (b, asc) ->
                                                    FStar_Tactics_Effect.tac_bind
                                                      (Prims.mk_range
                                                         "experimental/FStar.InteractiveHelpers.Base.fst"
                                                         (Prims.of_int (475))
                                                         (Prims.of_int (21))
                                                         (Prims.of_int (475))
                                                         (Prims.of_int (57)))
                                                      (Prims.mk_range
                                                         "experimental/FStar.InteractiveHelpers.Base.fst"
                                                         (Prims.of_int (475))
                                                         (Prims.of_int (6))
                                                         (Prims.of_int (486))
                                                         (Prims.of_int (12)))
                                                      (Obj.magic
                                                         (deep_apply_subst_in_binder
                                                            e b subst))
                                                      (fun uu___2 ->
                                                         (fun uu___2 ->
                                                            match uu___2 with
                                                            | (b1, subst1) ->
                                                                Obj.magic
                                                                  (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (477))
                                                                    (Prims.of_int (8))
                                                                    (Prims.of_int (485))
                                                                    (Prims.of_int (16)))
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (486))
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (486))
                                                                    (Prims.of_int (12)))
                                                                    (match asc
                                                                    with
                                                                    | 
                                                                    (FStar_Pervasives.Inl
                                                                    t1,
                                                                    tacopt,
                                                                    use_eq)
                                                                    ->
                                                                    Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (479))
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (479))
                                                                    (Prims.of_int (42)))
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (479))
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (481))
                                                                    (Prims.of_int (16)))
                                                                    (Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (479))
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (479))
                                                                    (Prims.of_int (42)))
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (479))
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (479))
                                                                    (Prims.of_int (42)))
                                                                    (Obj.magic
                                                                    (deep_apply_subst
                                                                    e t1
                                                                    subst1))
                                                                    (fun
                                                                    uu___3 ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___4 ->
                                                                    FStar_Pervasives.Inl
                                                                    uu___3))))
                                                                    (fun
                                                                    uu___3 ->
                                                                    (fun
                                                                    uu___3 ->
                                                                    Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (480))
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (480))
                                                                    (Prims.of_int (66)))
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (479))
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (481))
                                                                    (Prims.of_int (16)))
                                                                    (Obj.magic
                                                                    (FStar_Tactics_Util.map_opt
                                                                    (fun tac
                                                                    ->
                                                                    deep_apply_subst
                                                                    e tac
                                                                    subst1)
                                                                    tacopt))
                                                                    (fun
                                                                    uu___4 ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___5 ->
                                                                    (uu___3,
                                                                    uu___4,
                                                                    use_eq)))))
                                                                    uu___3))
                                                                    | 
                                                                    (FStar_Pervasives.Inr
                                                                    c,
                                                                    tacopt,
                                                                    use_eq)
                                                                    ->
                                                                    Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (483))
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (483))
                                                                    (Prims.of_int (50)))
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (483))
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (485))
                                                                    (Prims.of_int (16)))
                                                                    (Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (483))
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (483))
                                                                    (Prims.of_int (50)))
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (483))
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (483))
                                                                    (Prims.of_int (50)))
                                                                    (Obj.magic
                                                                    (deep_apply_subst_in_comp
                                                                    e c
                                                                    subst1))
                                                                    (fun
                                                                    uu___3 ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___4 ->
                                                                    FStar_Pervasives.Inr
                                                                    uu___3))))
                                                                    (fun
                                                                    uu___3 ->
                                                                    (fun
                                                                    uu___3 ->
                                                                    Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (484))
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (484))
                                                                    (Prims.of_int (66)))
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (483))
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (485))
                                                                    (Prims.of_int (16)))
                                                                    (Obj.magic
                                                                    (FStar_Tactics_Util.map_opt
                                                                    (fun tac
                                                                    ->
                                                                    deep_apply_subst
                                                                    e tac
                                                                    subst1)
                                                                    tacopt))
                                                                    (fun
                                                                    uu___4 ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___5 ->
                                                                    (uu___3,
                                                                    uu___4,
                                                                    use_eq)))))
                                                                    uu___3)))
                                                                    (fun asc1
                                                                    ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___3 ->
                                                                    (b1,
                                                                    asc1)))))
                                                           uu___2)) ret_opt))
                                       (fun uu___1 ->
                                          (fun ret_opt1 ->
                                             Obj.magic
                                               (FStar_Tactics_Effect.tac_bind
                                                  (Prims.mk_range
                                                     "experimental/FStar.InteractiveHelpers.Base.fst"
                                                     (Prims.of_int (489))
                                                     (Prims.of_int (6))
                                                     (Prims.of_int (492))
                                                     (Prims.of_int (13)))
                                                  (Prims.mk_range
                                                     "experimental/FStar.InteractiveHelpers.Base.fst"
                                                     (Prims.of_int (494))
                                                     (Prims.of_int (4))
                                                     (Prims.of_int (495))
                                                     (Prims.of_int (46)))
                                                  (FStar_Tactics_Effect.lift_div_tac
                                                     (fun uu___1 ->
                                                        fun branch ->
                                                          FStar_Tactics_Effect.tac_bind
                                                            (Prims.mk_range
                                                               "experimental/FStar.InteractiveHelpers.Base.fst"
                                                               (Prims.of_int (489))
                                                               (Prims.of_int (20))
                                                               (Prims.of_int (489))
                                                               (Prims.of_int (26)))
                                                            (Prims.mk_range
                                                               "experimental/FStar.InteractiveHelpers.Base.fst"
                                                               (Prims.of_int (489))
                                                               (Prims.of_int (6))
                                                               (Prims.of_int (492))
                                                               (Prims.of_int (13)))
                                                            (FStar_Tactics_Effect.lift_div_tac
                                                               (fun uu___2 ->
                                                                  branch))
                                                            (fun uu___2 ->
                                                               (fun uu___2 ->
                                                                  match uu___2
                                                                  with
                                                                  | (pat, tm)
                                                                    ->
                                                                    Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (490))
                                                                    (Prims.of_int (23))
                                                                    (Prims.of_int (490))
                                                                    (Prims.of_int (62)))
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (490))
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (492))
                                                                    (Prims.of_int (13)))
                                                                    (Obj.magic
                                                                    (deep_apply_subst_in_pattern
                                                                    e pat
                                                                    subst))
                                                                    (fun
                                                                    uu___3 ->
                                                                    (fun
                                                                    uu___3 ->
                                                                    match uu___3
                                                                    with
                                                                    | 
                                                                    (pat1,
                                                                    subst1)
                                                                    ->
                                                                    Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (491))
                                                                    (Prims.of_int (15))
                                                                    (Prims.of_int (491))
                                                                    (Prims.of_int (42)))
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (492))
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (492))
                                                                    (Prims.of_int (13)))
                                                                    (Obj.magic
                                                                    (deep_apply_subst
                                                                    e tm
                                                                    subst1))
                                                                    (fun tm1
                                                                    ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___4 ->
                                                                    (pat1,
                                                                    tm1)))))
                                                                    uu___3)))
                                                                 uu___2)))
                                                  (fun uu___1 ->
                                                     (fun
                                                        deep_apply_subst_in_branch
                                                        ->
                                                        Obj.magic
                                                          (FStar_Tactics_Effect.tac_bind
                                                             (Prims.mk_range
                                                                "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                (Prims.of_int (494))
                                                                (Prims.of_int (19))
                                                                (Prims.of_int (494))
                                                                (Prims.of_int (58)))
                                                             (Prims.mk_range
                                                                "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                (Prims.of_int (495))
                                                                (Prims.of_int (4))
                                                                (Prims.of_int (495))
                                                                (Prims.of_int (46)))
                                                             (Obj.magic
                                                                (FStar_Tactics_Util.map
                                                                   deep_apply_subst_in_branch
                                                                   branches))
                                                             (fun uu___1 ->
                                                                (fun
                                                                   branches1
                                                                   ->
                                                                   Obj.magic
                                                                    (FStar_Tactics_Builtins.pack
                                                                    (FStar_Reflection_Data.Tv_Match
                                                                    (scrutinee1,
                                                                    ret_opt1,
                                                                    branches1))))
                                                                  uu___1)))
                                                       uu___1))) uu___1)))
                                 uu___1)))
                | FStar_Reflection_Data.Tv_AscribedT (exp, ty, tac, use_eq)
                    ->
                    Obj.magic
                      (Obj.repr
                         (FStar_Tactics_Effect.tac_bind
                            (Prims.mk_range
                               "experimental/FStar.InteractiveHelpers.Base.fst"
                               (Prims.of_int (497)) (Prims.of_int (14))
                               (Prims.of_int (497)) (Prims.of_int (42)))
                            (Prims.mk_range
                               "experimental/FStar.InteractiveHelpers.Base.fst"
                               (Prims.of_int (498)) (Prims.of_int (4))
                               (Prims.of_int (500)) (Prims.of_int (42)))
                            (Obj.magic (deep_apply_subst e exp subst))
                            (fun uu___1 ->
                               (fun exp1 ->
                                  Obj.magic
                                    (FStar_Tactics_Effect.tac_bind
                                       (Prims.mk_range
                                          "experimental/FStar.InteractiveHelpers.Base.fst"
                                          (Prims.of_int (498))
                                          (Prims.of_int (13))
                                          (Prims.of_int (498))
                                          (Prims.of_int (40)))
                                       (Prims.mk_range
                                          "experimental/FStar.InteractiveHelpers.Base.fst"
                                          (Prims.of_int (500))
                                          (Prims.of_int (4))
                                          (Prims.of_int (500))
                                          (Prims.of_int (42)))
                                       (Obj.magic
                                          (deep_apply_subst e ty subst))
                                       (fun uu___1 ->
                                          (fun ty1 ->
                                             Obj.magic
                                               (FStar_Tactics_Builtins.pack
                                                  (FStar_Reflection_Data.Tv_AscribedT
                                                     (exp1, ty1,
                                                       FStar_Pervasives_Native.None,
                                                       use_eq)))) uu___1)))
                                 uu___1)))
                | FStar_Reflection_Data.Tv_AscribedC (exp, c, tac, use_eq) ->
                    Obj.magic
                      (Obj.repr
                         (FStar_Tactics_Effect.tac_bind
                            (Prims.mk_range
                               "experimental/FStar.InteractiveHelpers.Base.fst"
                               (Prims.of_int (502)) (Prims.of_int (14))
                               (Prims.of_int (502)) (Prims.of_int (42)))
                            (Prims.mk_range
                               "experimental/FStar.InteractiveHelpers.Base.fst"
                               (Prims.of_int (503)) (Prims.of_int (4))
                               (Prims.of_int (505)) (Prims.of_int (41)))
                            (Obj.magic (deep_apply_subst e exp subst))
                            (fun uu___1 ->
                               (fun exp1 ->
                                  Obj.magic
                                    (FStar_Tactics_Effect.tac_bind
                                       (Prims.mk_range
                                          "experimental/FStar.InteractiveHelpers.Base.fst"
                                          (Prims.of_int (503))
                                          (Prims.of_int (12))
                                          (Prims.of_int (503))
                                          (Prims.of_int (46)))
                                       (Prims.mk_range
                                          "experimental/FStar.InteractiveHelpers.Base.fst"
                                          (Prims.of_int (505))
                                          (Prims.of_int (4))
                                          (Prims.of_int (505))
                                          (Prims.of_int (41)))
                                       (Obj.magic
                                          (deep_apply_subst_in_comp e c subst))
                                       (fun uu___1 ->
                                          (fun c1 ->
                                             Obj.magic
                                               (FStar_Tactics_Builtins.pack
                                                  (FStar_Reflection_Data.Tv_AscribedC
                                                     (exp1, c1,
                                                       FStar_Pervasives_Native.None,
                                                       use_eq)))) uu___1)))
                                 uu___1)))
                | uu___1 ->
                    Obj.magic
                      (Obj.repr
                         (FStar_Tactics_Effect.lift_div_tac (fun uu___2 -> t))))
               uu___)
and (deep_apply_subst_in_bv :
  FStar_Reflection_Types.env ->
    FStar_Reflection_Types.bv ->
      (FStar_Reflection_Types.bv * FStar_Reflection_Types.term) Prims.list ->
        ((FStar_Reflection_Types.bv * (FStar_Reflection_Types.bv *
           FStar_Reflection_Types.term) Prims.list),
          unit) FStar_Tactics_Effect.tac_repr)
  =
  fun e ->
    fun bv ->
      fun subst ->
        FStar_Tactics_Effect.tac_bind
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (511)) (Prims.of_int (12)) (Prims.of_int (511))
             (Prims.of_int (25)))
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (512)) (Prims.of_int (2)) (Prims.of_int (514))
             (Prims.of_int (37)))
          (FStar_Tactics_Effect.lift_div_tac
             (fun uu___ -> FStar_Reflection_Builtins.inspect_bv bv))
          (fun uu___ ->
             (fun bvv ->
                Obj.magic
                  (FStar_Tactics_Effect.tac_bind
                     (Prims.mk_range
                        "experimental/FStar.InteractiveHelpers.Base.fst"
                        (Prims.of_int (512)) (Prims.of_int (11))
                        (Prims.of_int (512)) (Prims.of_int (47)))
                     (Prims.mk_range
                        "experimental/FStar.InteractiveHelpers.Base.fst"
                        (Prims.of_int (513)) (Prims.of_int (2))
                        (Prims.of_int (514)) (Prims.of_int (37)))
                     (Obj.magic
                        (deep_apply_subst e bvv.FStar_Reflection_Data.bv_sort
                           subst))
                     (fun uu___ ->
                        (fun ty ->
                           Obj.magic
                             (FStar_Tactics_Effect.tac_bind
                                (Prims.mk_range
                                   "experimental/FStar.InteractiveHelpers.Base.fst"
                                   (Prims.of_int (513)) (Prims.of_int (12))
                                   (Prims.of_int (513)) (Prims.of_int (51)))
                                (Prims.mk_range
                                   "experimental/FStar.InteractiveHelpers.Base.fst"
                                   (Prims.of_int (514)) (Prims.of_int (2))
                                   (Prims.of_int (514)) (Prims.of_int (37)))
                                (Obj.magic
                                   (FStar_Tactics_Builtins.fresh_bv_named
                                      bvv.FStar_Reflection_Data.bv_ppname ty))
                                (fun uu___ ->
                                   (fun bv' ->
                                      Obj.magic
                                        (FStar_Tactics_Effect.tac_bind
                                           (Prims.mk_range
                                              "experimental/FStar.InteractiveHelpers.Base.fst"
                                              (Prims.of_int (514))
                                              (Prims.of_int (30))
                                              (Prims.of_int (514))
                                              (Prims.of_int (32)))
                                           (Prims.mk_range
                                              "experimental/FStar.InteractiveHelpers.Base.fst"
                                              (Prims.of_int (514))
                                              (Prims.of_int (2))
                                              (Prims.of_int (514))
                                              (Prims.of_int (37)))
                                           (Obj.magic
                                              (FStar_Tactics_Effect.tac_bind
                                                 (Prims.mk_range
                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                    (Prims.of_int (514))
                                                    (Prims.of_int (7))
                                                    (Prims.of_int (514))
                                                    (Prims.of_int (30)))
                                                 (Prims.mk_range
                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                    (Prims.of_int (514))
                                                    (Prims.of_int (30))
                                                    (Prims.of_int (514))
                                                    (Prims.of_int (32)))
                                                 (Obj.magic
                                                    (FStar_Tactics_Effect.tac_bind
                                                       (Prims.mk_range
                                                          "experimental/FStar.InteractiveHelpers.Base.fst"
                                                          (Prims.of_int (514))
                                                          (Prims.of_int (12))
                                                          (Prims.of_int (514))
                                                          (Prims.of_int (29)))
                                                       (Prims.mk_range
                                                          "experimental/FStar.InteractiveHelpers.Base.fst"
                                                          (Prims.of_int (514))
                                                          (Prims.of_int (7))
                                                          (Prims.of_int (514))
                                                          (Prims.of_int (30)))
                                                       (Obj.magic
                                                          (FStar_Tactics_Builtins.pack
                                                             (FStar_Reflection_Data.Tv_Var
                                                                bv')))
                                                       (fun uu___ ->
                                                          FStar_Tactics_Effect.lift_div_tac
                                                            (fun uu___1 ->
                                                               (bv, uu___)))))
                                                 (fun uu___ ->
                                                    FStar_Tactics_Effect.lift_div_tac
                                                      (fun uu___1 -> uu___ ::
                                                         subst))))
                                           (fun uu___ ->
                                              FStar_Tactics_Effect.lift_div_tac
                                                (fun uu___1 -> (bv', uu___)))))
                                     uu___))) uu___))) uu___)
and (deep_apply_subst_in_binder :
  FStar_Reflection_Types.env ->
    FStar_Reflection_Types.binder ->
      (FStar_Reflection_Types.bv * FStar_Reflection_Types.term) Prims.list ->
        ((FStar_Reflection_Types.binder * (FStar_Reflection_Types.bv *
           FStar_Reflection_Types.term) Prims.list),
          unit) FStar_Tactics_Effect.tac_repr)
  =
  fun e ->
    fun br ->
      fun subst ->
        FStar_Tactics_Effect.tac_bind
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (520)) (Prims.of_int (26)) (Prims.of_int (520))
             (Prims.of_int (43)))
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (520)) (Prims.of_int (2)) (Prims.of_int (522))
             (Prims.of_int (34)))
          (FStar_Tactics_Effect.lift_div_tac
             (fun uu___ -> FStar_Reflection_Builtins.inspect_binder br))
          (fun uu___ ->
             (fun uu___ ->
                match uu___ with
                | (bv, (qual, attrs)) ->
                    Obj.magic
                      (FStar_Tactics_Effect.tac_bind
                         (Prims.mk_range
                            "experimental/FStar.InteractiveHelpers.Base.fst"
                            (Prims.of_int (521)) (Prims.of_int (18))
                            (Prims.of_int (521)) (Prims.of_int (51)))
                         (Prims.mk_range
                            "experimental/FStar.InteractiveHelpers.Base.fst"
                            (Prims.of_int (521)) (Prims.of_int (2))
                            (Prims.of_int (522)) (Prims.of_int (34)))
                         (Obj.magic (deep_apply_subst_in_bv e bv subst))
                         (fun uu___1 ->
                            FStar_Tactics_Effect.lift_div_tac
                              (fun uu___2 ->
                                 match uu___1 with
                                 | (bv1, subst1) ->
                                     ((FStar_Reflection_Builtins.pack_binder
                                         bv1 qual attrs), subst1))))) uu___)
and (deep_apply_subst_in_comp :
  FStar_Reflection_Types.env ->
    FStar_Reflection_Types.comp ->
      (FStar_Reflection_Types.bv * FStar_Reflection_Types.term) Prims.list ->
        (FStar_Reflection_Types.comp, unit) FStar_Tactics_Effect.tac_repr)
  =
  fun e ->
    fun c ->
      fun subst ->
        FStar_Tactics_Effect.tac_bind
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (525)) (Prims.of_int (14)) (Prims.of_int (525))
             (Prims.of_int (51)))
          (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
             (Prims.of_int (526)) (Prims.of_int (2)) (Prims.of_int (548))
             (Prims.of_int (55)))
          (FStar_Tactics_Effect.lift_div_tac
             (fun uu___ -> fun x -> deep_apply_subst e x subst))
          (fun uu___ ->
             (fun subst1 ->
                Obj.magic
                  (FStar_Tactics_Effect.tac_bind
                     (Prims.mk_range
                        "experimental/FStar.InteractiveHelpers.Base.fst"
                        (Prims.of_int (527)) (Prims.of_int (4))
                        (Prims.of_int (530)) (Prims.of_int (34)))
                     (Prims.mk_range
                        "experimental/FStar.InteractiveHelpers.Base.fst"
                        (Prims.of_int (532)) (Prims.of_int (2))
                        (Prims.of_int (548)) (Prims.of_int (55)))
                     (FStar_Tactics_Effect.lift_div_tac
                        (fun uu___1 ->
                           fun uu___ ->
                             (fun uu___ ->
                                fun a ->
                                  match a with
                                  | FStar_Reflection_Data.Q_Implicit ->
                                      Obj.magic
                                        (Obj.repr
                                           (FStar_Tactics_Effect.lift_div_tac
                                              (fun uu___1 -> a)))
                                  | FStar_Reflection_Data.Q_Explicit ->
                                      Obj.magic
                                        (Obj.repr
                                           (FStar_Tactics_Effect.lift_div_tac
                                              (fun uu___1 -> a)))
                                  | FStar_Reflection_Data.Q_Meta t ->
                                      Obj.magic
                                        (Obj.repr
                                           (FStar_Tactics_Effect.tac_bind
                                              (Prims.mk_range
                                                 "experimental/FStar.InteractiveHelpers.Base.fst"
                                                 (Prims.of_int (530))
                                                 (Prims.of_int (25))
                                                 (Prims.of_int (530))
                                                 (Prims.of_int (34)))
                                              (Prims.mk_range
                                                 "experimental/FStar.InteractiveHelpers.Base.fst"
                                                 (Prims.of_int (530))
                                                 (Prims.of_int (18))
                                                 (Prims.of_int (530))
                                                 (Prims.of_int (34)))
                                              (Obj.magic (subst1 t))
                                              (fun uu___1 ->
                                                 FStar_Tactics_Effect.lift_div_tac
                                                   (fun uu___2 ->
                                                      FStar_Reflection_Data.Q_Meta
                                                        uu___1))))) uu___1
                               uu___))
                     (fun uu___ ->
                        (fun subst_in_aqualv ->
                           match FStar_Reflection_Builtins.inspect_comp c
                           with
                           | FStar_Reflection_Data.C_Total ret ->
                               Obj.magic
                                 (FStar_Tactics_Effect.tac_bind
                                    (Prims.mk_range
                                       "experimental/FStar.InteractiveHelpers.Base.fst"
                                       (Prims.of_int (534))
                                       (Prims.of_int (14))
                                       (Prims.of_int (534))
                                       (Prims.of_int (23)))
                                    (Prims.mk_range
                                       "experimental/FStar.InteractiveHelpers.Base.fst"
                                       (Prims.of_int (535))
                                       (Prims.of_int (4))
                                       (Prims.of_int (535))
                                       (Prims.of_int (27)))
                                    (Obj.magic (subst1 ret))
                                    (fun ret1 ->
                                       FStar_Tactics_Effect.lift_div_tac
                                         (fun uu___ ->
                                            FStar_Reflection_Builtins.pack_comp
                                              (FStar_Reflection_Data.C_Total
                                                 ret1))))
                           | FStar_Reflection_Data.C_GTotal ret ->
                               Obj.magic
                                 (FStar_Tactics_Effect.tac_bind
                                    (Prims.mk_range
                                       "experimental/FStar.InteractiveHelpers.Base.fst"
                                       (Prims.of_int (537))
                                       (Prims.of_int (14))
                                       (Prims.of_int (537))
                                       (Prims.of_int (23)))
                                    (Prims.mk_range
                                       "experimental/FStar.InteractiveHelpers.Base.fst"
                                       (Prims.of_int (538))
                                       (Prims.of_int (4))
                                       (Prims.of_int (538))
                                       (Prims.of_int (28)))
                                    (Obj.magic (subst1 ret))
                                    (fun ret1 ->
                                       FStar_Tactics_Effect.lift_div_tac
                                         (fun uu___ ->
                                            FStar_Reflection_Builtins.pack_comp
                                              (FStar_Reflection_Data.C_GTotal
                                                 ret1))))
                           | FStar_Reflection_Data.C_Lemma
                               (pre, post, patterns) ->
                               Obj.magic
                                 (FStar_Tactics_Effect.tac_bind
                                    (Prims.mk_range
                                       "experimental/FStar.InteractiveHelpers.Base.fst"
                                       (Prims.of_int (540))
                                       (Prims.of_int (14))
                                       (Prims.of_int (540))
                                       (Prims.of_int (23)))
                                    (Prims.mk_range
                                       "experimental/FStar.InteractiveHelpers.Base.fst"
                                       (Prims.of_int (541))
                                       (Prims.of_int (4))
                                       (Prims.of_int (543))
                                       (Prims.of_int (41)))
                                    (Obj.magic (subst1 pre))
                                    (fun uu___ ->
                                       (fun pre1 ->
                                          Obj.magic
                                            (FStar_Tactics_Effect.tac_bind
                                               (Prims.mk_range
                                                  "experimental/FStar.InteractiveHelpers.Base.fst"
                                                  (Prims.of_int (541))
                                                  (Prims.of_int (15))
                                                  (Prims.of_int (541))
                                                  (Prims.of_int (25)))
                                               (Prims.mk_range
                                                  "experimental/FStar.InteractiveHelpers.Base.fst"
                                                  (Prims.of_int (542))
                                                  (Prims.of_int (4))
                                                  (Prims.of_int (543))
                                                  (Prims.of_int (41)))
                                               (Obj.magic (subst1 post))
                                               (fun uu___ ->
                                                  (fun post1 ->
                                                     Obj.magic
                                                       (FStar_Tactics_Effect.tac_bind
                                                          (Prims.mk_range
                                                             "experimental/FStar.InteractiveHelpers.Base.fst"
                                                             (Prims.of_int (542))
                                                             (Prims.of_int (19))
                                                             (Prims.of_int (542))
                                                             (Prims.of_int (33)))
                                                          (Prims.mk_range
                                                             "experimental/FStar.InteractiveHelpers.Base.fst"
                                                             (Prims.of_int (543))
                                                             (Prims.of_int (4))
                                                             (Prims.of_int (543))
                                                             (Prims.of_int (41)))
                                                          (Obj.magic
                                                             (subst1 patterns))
                                                          (fun patterns1 ->
                                                             FStar_Tactics_Effect.lift_div_tac
                                                               (fun uu___ ->
                                                                  FStar_Reflection_Builtins.pack_comp
                                                                    (
                                                                    FStar_Reflection_Data.C_Lemma
                                                                    (pre1,
                                                                    post1,
                                                                    patterns1))))))
                                                    uu___))) uu___))
                           | FStar_Reflection_Data.C_Eff
                               (us, eff_name, result, eff_args, decrs) ->
                               Obj.magic
                                 (FStar_Tactics_Effect.tac_bind
                                    (Prims.mk_range
                                       "experimental/FStar.InteractiveHelpers.Base.fst"
                                       (Prims.of_int (545))
                                       (Prims.of_int (17))
                                       (Prims.of_int (545))
                                       (Prims.of_int (29)))
                                    (Prims.mk_range
                                       "experimental/FStar.InteractiveHelpers.Base.fst"
                                       (Prims.of_int (546))
                                       (Prims.of_int (4))
                                       (Prims.of_int (548))
                                       (Prims.of_int (55)))
                                    (Obj.magic (subst1 result))
                                    (fun uu___ ->
                                       (fun result1 ->
                                          Obj.magic
                                            (FStar_Tactics_Effect.tac_bind
                                               (Prims.mk_range
                                                  "experimental/FStar.InteractiveHelpers.Base.fst"
                                                  (Prims.of_int (546))
                                                  (Prims.of_int (19))
                                                  (Prims.of_int (546))
                                                  (Prims.of_int (76)))
                                               (Prims.mk_range
                                                  "experimental/FStar.InteractiveHelpers.Base.fst"
                                                  (Prims.of_int (547))
                                                  (Prims.of_int (4))
                                                  (Prims.of_int (548))
                                                  (Prims.of_int (55)))
                                               (Obj.magic
                                                  (FStar_Tactics_Util.map
                                                     (fun uu___ ->
                                                        match uu___ with
                                                        | (x, a) ->
                                                            FStar_Tactics_Effect.tac_bind
                                                              (Prims.mk_range
                                                                 "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                 (Prims.of_int (546))
                                                                 (Prims.of_int (39))
                                                                 (Prims.of_int (546))
                                                                 (Prims.of_int (46)))
                                                              (Prims.mk_range
                                                                 "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                 (Prims.of_int (546))
                                                                 (Prims.of_int (38))
                                                                 (Prims.of_int (546))
                                                                 (Prims.of_int (66)))
                                                              (Obj.magic
                                                                 (subst1 x))
                                                              (fun uu___1 ->
                                                                 (fun uu___1
                                                                    ->
                                                                    Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (546))
                                                                    (Prims.of_int (48))
                                                                    (Prims.of_int (546))
                                                                    (Prims.of_int (65)))
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (546))
                                                                    (Prims.of_int (38))
                                                                    (Prims.of_int (546))
                                                                    (Prims.of_int (66)))
                                                                    (Obj.magic
                                                                    (subst_in_aqualv
                                                                    a))
                                                                    (fun
                                                                    uu___2 ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___3 ->
                                                                    (uu___1,
                                                                    uu___2)))))
                                                                   uu___1))
                                                     eff_args))
                                               (fun uu___ ->
                                                  (fun eff_args1 ->
                                                     Obj.magic
                                                       (FStar_Tactics_Effect.tac_bind
                                                          (Prims.mk_range
                                                             "experimental/FStar.InteractiveHelpers.Base.fst"
                                                             (Prims.of_int (547))
                                                             (Prims.of_int (16))
                                                             (Prims.of_int (547))
                                                             (Prims.of_int (31)))
                                                          (Prims.mk_range
                                                             "experimental/FStar.InteractiveHelpers.Base.fst"
                                                             (Prims.of_int (548))
                                                             (Prims.of_int (4))
                                                             (Prims.of_int (548))
                                                             (Prims.of_int (55)))
                                                          (Obj.magic
                                                             (FStar_Tactics_Util.map
                                                                subst1 decrs))
                                                          (fun decrs1 ->
                                                             FStar_Tactics_Effect.lift_div_tac
                                                               (fun uu___ ->
                                                                  FStar_Reflection_Builtins.pack_comp
                                                                    (
                                                                    FStar_Reflection_Data.C_Eff
                                                                    (us,
                                                                    eff_name,
                                                                    result1,
                                                                    eff_args1,
                                                                    decrs1))))))
                                                    uu___))) uu___))) uu___)))
               uu___)
and (deep_apply_subst_in_pattern :
  FStar_Reflection_Types.env ->
    FStar_Reflection_Data.pattern ->
      (FStar_Reflection_Types.bv * FStar_Reflection_Types.term) Prims.list ->
        ((FStar_Reflection_Data.pattern * (FStar_Reflection_Types.bv *
           FStar_Reflection_Types.term) Prims.list),
          unit) FStar_Tactics_Effect.tac_repr)
  =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun e ->
           fun pat ->
             fun subst ->
               match pat with
               | FStar_Reflection_Data.Pat_Constant uu___ ->
                   Obj.magic
                     (Obj.repr
                        (FStar_Tactics_Effect.lift_div_tac
                           (fun uu___1 -> (pat, subst))))
               | FStar_Reflection_Data.Pat_Cons (fv, us, patterns) ->
                   Obj.magic
                     (Obj.repr
                        (FStar_Tactics_Effect.tac_bind
                           (Prims.mk_range
                              "experimental/FStar.InteractiveHelpers.Base.fst"
                              (Prims.of_int (557)) (Prims.of_int (6))
                              (Prims.of_int (559)) (Prims.of_int (69)))
                           (Prims.mk_range
                              "experimental/FStar.InteractiveHelpers.Base.fst"
                              (Prims.of_int (556)) (Prims.of_int (4))
                              (Prims.of_int (561)) (Prims.of_int (34)))
                           (Obj.magic
                              (FStar_Tactics_Util.fold_right
                                 (fun uu___ ->
                                    fun uu___1 ->
                                      match (uu___, uu___1) with
                                      | ((pat1, b), (pats, subst1)) ->
                                          FStar_Tactics_Effect.tac_bind
                                            (Prims.mk_range
                                               "experimental/FStar.InteractiveHelpers.Base.fst"
                                               (Prims.of_int (558))
                                               (Prims.of_int (39))
                                               (Prims.of_int (558))
                                               (Prims.of_int (78)))
                                            (Prims.mk_range
                                               "experimental/FStar.InteractiveHelpers.Base.fst"
                                               (Prims.of_int (558))
                                               (Prims.of_int (22))
                                               (Prims.of_int (559))
                                               (Prims.of_int (47)))
                                            (Obj.magic
                                               (deep_apply_subst_in_pattern e
                                                  pat1 subst1))
                                            (fun uu___2 ->
                                               FStar_Tactics_Effect.lift_div_tac
                                                 (fun uu___3 ->
                                                    match uu___2 with
                                                    | (pat2, subst2) ->
                                                        (((pat2, b) :: pats),
                                                          subst2)))) patterns
                                 ([], subst)))
                           (fun uu___ ->
                              FStar_Tactics_Effect.lift_div_tac
                                (fun uu___1 ->
                                   match uu___ with
                                   | (patterns1, subst1) ->
                                       ((FStar_Reflection_Data.Pat_Cons
                                           (fv, us, patterns1)), subst1)))))
               | FStar_Reflection_Data.Pat_Var bv ->
                   Obj.magic
                     (Obj.repr
                        (FStar_Tactics_Effect.tac_bind
                           (Prims.mk_range
                              "experimental/FStar.InteractiveHelpers.Base.fst"
                              (Prims.of_int (563)) (Prims.of_int (20))
                              (Prims.of_int (563)) (Prims.of_int (53)))
                           (Prims.mk_range
                              "experimental/FStar.InteractiveHelpers.Base.fst"
                              (Prims.of_int (563)) (Prims.of_int (4))
                              (Prims.of_int (564)) (Prims.of_int (21)))
                           (Obj.magic (deep_apply_subst_in_bv e bv subst))
                           (fun uu___ ->
                              FStar_Tactics_Effect.lift_div_tac
                                (fun uu___1 ->
                                   match uu___ with
                                   | (bv1, subst1) ->
                                       ((FStar_Reflection_Data.Pat_Var bv1),
                                         subst1)))))
               | FStar_Reflection_Data.Pat_Wild bv ->
                   Obj.magic
                     (Obj.repr
                        (FStar_Tactics_Effect.tac_bind
                           (Prims.mk_range
                              "experimental/FStar.InteractiveHelpers.Base.fst"
                              (Prims.of_int (566)) (Prims.of_int (20))
                              (Prims.of_int (566)) (Prims.of_int (53)))
                           (Prims.mk_range
                              "experimental/FStar.InteractiveHelpers.Base.fst"
                              (Prims.of_int (566)) (Prims.of_int (4))
                              (Prims.of_int (567)) (Prims.of_int (22)))
                           (Obj.magic (deep_apply_subst_in_bv e bv subst))
                           (fun uu___ ->
                              FStar_Tactics_Effect.lift_div_tac
                                (fun uu___1 ->
                                   match uu___ with
                                   | (bv1, subst1) ->
                                       ((FStar_Reflection_Data.Pat_Wild bv1),
                                         subst1)))))
               | FStar_Reflection_Data.Pat_Dot_Term eopt ->
                   Obj.magic
                     (Obj.repr
                        (FStar_Tactics_Effect.tac_bind
                           (Prims.mk_range
                              "experimental/FStar.InteractiveHelpers.Base.fst"
                              (Prims.of_int (569)) (Prims.of_int (4))
                              (Prims.of_int (569)) (Prims.of_int (69)))
                           (Prims.mk_range
                              "experimental/FStar.InteractiveHelpers.Base.fst"
                              (Prims.of_int (569)) (Prims.of_int (4))
                              (Prims.of_int (569)) (Prims.of_int (76)))
                           (Obj.magic
                              (FStar_Tactics_Effect.tac_bind
                                 (Prims.mk_range
                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                    (Prims.of_int (569)) (Prims.of_int (17))
                                    (Prims.of_int (569)) (Prims.of_int (69)))
                                 (Prims.mk_range
                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                    (Prims.of_int (569)) (Prims.of_int (4))
                                    (Prims.of_int (569)) (Prims.of_int (69)))
                                 (Obj.magic
                                    (FStar_Tactics_Util.map_opt
                                       (fun t -> deep_apply_subst e t subst)
                                       eopt))
                                 (fun uu___ ->
                                    FStar_Tactics_Effect.lift_div_tac
                                      (fun uu___1 ->
                                         FStar_Reflection_Data.Pat_Dot_Term
                                           uu___))))
                           (fun uu___ ->
                              FStar_Tactics_Effect.lift_div_tac
                                (fun uu___1 -> (uu___, subst)))))) uu___2
          uu___1 uu___
let (apply_subst :
  FStar_Reflection_Types.env ->
    FStar_Reflection_Types.term ->
      (FStar_Reflection_Types.bv * FStar_Reflection_Types.term) Prims.list ->
        (FStar_Reflection_Types.term, unit) FStar_Tactics_Effect.tac_repr)
  = norm_apply_subst
let (apply_subst_in_comp :
  FStar_Reflection_Types.env ->
    FStar_Reflection_Types.comp ->
      (FStar_Reflection_Types.bv * FStar_Reflection_Types.term) Prims.list ->
        (FStar_Reflection_Types.comp, unit) FStar_Tactics_Effect.tac_repr)
  = norm_apply_subst_in_comp
let (opt_apply_subst :
  FStar_Reflection_Types.env ->
    FStar_Reflection_Types.term FStar_Pervasives_Native.option ->
      (FStar_Reflection_Types.bv * FStar_Reflection_Types.term) Prims.list ->
        (FStar_Reflection_Types.term FStar_Pervasives_Native.option, 
          unit) FStar_Tactics_Effect.tac_repr)
  =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun e ->
           fun opt_t ->
             fun subst ->
               match opt_t with
               | FStar_Pervasives_Native.None ->
                   Obj.magic
                     (Obj.repr
                        (FStar_Tactics_Effect.lift_div_tac
                           (fun uu___ -> FStar_Pervasives_Native.None)))
               | FStar_Pervasives_Native.Some t ->
                   Obj.magic
                     (Obj.repr
                        (FStar_Tactics_Effect.tac_bind
                           (Prims.mk_range
                              "experimental/FStar.InteractiveHelpers.Base.fst"
                              (Prims.of_int (585)) (Prims.of_int (19))
                              (Prims.of_int (585)) (Prims.of_int (42)))
                           (Prims.mk_range
                              "experimental/FStar.InteractiveHelpers.Base.fst"
                              (Prims.of_int (585)) (Prims.of_int (14))
                              (Prims.of_int (585)) (Prims.of_int (42)))
                           (Obj.magic (apply_subst e t subst))
                           (fun uu___ ->
                              FStar_Tactics_Effect.lift_div_tac
                                (fun uu___1 ->
                                   FStar_Pervasives_Native.Some uu___)))))
          uu___2 uu___1 uu___
let rec (_generate_shadowed_subst :
  genv ->
    FStar_Reflection_Types.term ->
      FStar_Reflection_Types.bv Prims.list ->
        ((genv * (FStar_Reflection_Types.bv * FStar_Reflection_Types.bv)
           Prims.list),
          unit) FStar_Tactics_Effect.tac_repr)
  =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun ge ->
           fun t ->
             fun bvl ->
               match bvl with
               | [] ->
                   Obj.magic
                     (Obj.repr
                        (FStar_Tactics_Effect.lift_div_tac
                           (fun uu___ -> (ge, []))))
               | old_bv::bvl' ->
                   Obj.magic
                     (Obj.repr
                        (FStar_Tactics_Effect.tac_bind
                           (Prims.mk_range
                              "experimental/FStar.InteractiveHelpers.Base.fst"
                              (Prims.of_int (604)) (Prims.of_int (10))
                              (Prims.of_int (604)) (Prims.of_int (19)))
                           (Prims.mk_range
                              "experimental/FStar.InteractiveHelpers.Base.fst"
                              (Prims.of_int (604)) (Prims.of_int (4))
                              (Prims.of_int (618)) (Prims.of_int (55)))
                           (Obj.magic (FStar_Tactics_Builtins.inspect t))
                           (fun uu___ ->
                              (fun uu___ ->
                                 match uu___ with
                                 | FStar_Reflection_Data.Tv_Abs (b, uu___1)
                                     ->
                                     Obj.magic
                                       (FStar_Tactics_Effect.tac_bind
                                          (Prims.mk_range
                                             "experimental/FStar.InteractiveHelpers.Base.fst"
                                             (Prims.of_int (607))
                                             (Prims.of_int (18))
                                             (Prims.of_int (607))
                                             (Prims.of_int (34)))
                                          (Prims.mk_range
                                             "experimental/FStar.InteractiveHelpers.Base.fst"
                                             (Prims.of_int (607))
                                             (Prims.of_int (6))
                                             (Prims.of_int (617))
                                             (Prims.of_int (34)))
                                          (FStar_Tactics_Effect.lift_div_tac
                                             (fun uu___2 ->
                                                FStar_Reflection_Builtins.inspect_binder
                                                  b))
                                          (fun uu___2 ->
                                             (fun uu___2 ->
                                                match uu___2 with
                                                | (bv, uu___3) ->
                                                    Obj.magic
                                                      (FStar_Tactics_Effect.tac_bind
                                                         (Prims.mk_range
                                                            "experimental/FStar.InteractiveHelpers.Base.fst"
                                                            (Prims.of_int (608))
                                                            (Prims.of_int (16))
                                                            (Prims.of_int (608))
                                                            (Prims.of_int (29)))
                                                         (Prims.mk_range
                                                            "experimental/FStar.InteractiveHelpers.Base.fst"
                                                            (Prims.of_int (609))
                                                            (Prims.of_int (6))
                                                            (Prims.of_int (617))
                                                            (Prims.of_int (34)))
                                                         (FStar_Tactics_Effect.lift_div_tac
                                                            (fun uu___4 ->
                                                               FStar_Reflection_Builtins.inspect_bv
                                                                 bv))
                                                         (fun uu___4 ->
                                                            (fun bvv ->
                                                               Obj.magic
                                                                 (FStar_Tactics_Effect.tac_bind
                                                                    (
                                                                    Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (609))
                                                                    (Prims.of_int (15))
                                                                    (Prims.of_int (609))
                                                                    (Prims.of_int (26)))
                                                                    (
                                                                    Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (610))
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (617))
                                                                    (Prims.of_int (34)))
                                                                    (
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___4 ->
                                                                    bvv.FStar_Reflection_Data.bv_sort))
                                                                    (
                                                                    fun
                                                                    uu___4 ->
                                                                    (fun ty
                                                                    ->
                                                                    Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (610))
                                                                    (Prims.of_int (17))
                                                                    (Prims.of_int (610))
                                                                    (Prims.of_int (30)))
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (611))
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (617))
                                                                    (Prims.of_int (34)))
                                                                    (FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___4 ->
                                                                    bvv.FStar_Reflection_Data.bv_ppname))
                                                                    (fun
                                                                    uu___4 ->
                                                                    (fun name
                                                                    ->
                                                                    Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (611))
                                                                    (Prims.of_int (23))
                                                                    (Prims.of_int (611))
                                                                    (Prims.of_int (61)))
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (611))
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (617))
                                                                    (Prims.of_int (34)))
                                                                    (Obj.magic
                                                                    (genv_push_fresh_bv
                                                                    ge
                                                                    (Prims.strcat
                                                                    "__" name)
                                                                    ty))
                                                                    (fun
                                                                    uu___4 ->
                                                                    (fun
                                                                    uu___4 ->
                                                                    match uu___4
                                                                    with
                                                                    | 
                                                                    (ge1,
                                                                    fresh) ->
                                                                    Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (612))
                                                                    (Prims.of_int (15))
                                                                    (Prims.of_int (612))
                                                                    (Prims.of_int (47)))
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (613))
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (617))
                                                                    (Prims.of_int (34)))
                                                                    (Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (612))
                                                                    (Prims.of_int (26))
                                                                    (Prims.of_int (612))
                                                                    (Prims.of_int (47)))
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (612))
                                                                    (Prims.of_int (15))
                                                                    (Prims.of_int (612))
                                                                    (Prims.of_int (47)))
                                                                    (Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (612))
                                                                    (Prims.of_int (27))
                                                                    (Prims.of_int (612))
                                                                    (Prims.of_int (46)))
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (612))
                                                                    (Prims.of_int (26))
                                                                    (Prims.of_int (612))
                                                                    (Prims.of_int (47)))
                                                                    (Obj.magic
                                                                    (FStar_Tactics_Builtins.pack
                                                                    (FStar_Reflection_Data.Tv_Var
                                                                    fresh)))
                                                                    (fun
                                                                    uu___5 ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___6 ->
                                                                    [uu___5]))))
                                                                    (fun
                                                                    uu___5 ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___6 ->
                                                                    FStar_Reflection_Derived.mk_e_app
                                                                    t uu___5))))
                                                                    (fun
                                                                    uu___5 ->
                                                                    (fun t1
                                                                    ->
                                                                    Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (613))
                                                                    (Prims.of_int (15))
                                                                    (Prims.of_int (613))
                                                                    (Prims.of_int (42)))
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (615))
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (617))
                                                                    (Prims.of_int (34)))
                                                                    (Obj.magic
                                                                    (FStar_Tactics_Builtins.norm_term_env
                                                                    ge1.env
                                                                    [] t1))
                                                                    (fun
                                                                    uu___5 ->
                                                                    (fun t2
                                                                    ->
                                                                    Obj.magic
                                                                    (FStar_Tactics_Effect.tac_bind
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (615))
                                                                    (Prims.of_int (22))
                                                                    (Prims.of_int (615))
                                                                    (Prims.of_int (58)))
                                                                    (Prims.mk_range
                                                                    "experimental/FStar.InteractiveHelpers.Base.fst"
                                                                    (Prims.of_int (615))
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (617))
                                                                    (Prims.of_int (34)))
                                                                    (Obj.magic
                                                                    (_generate_shadowed_subst
                                                                    ge1 t2
                                                                    bvl'))
                                                                    (fun
                                                                    uu___5 ->
                                                                    FStar_Tactics_Effect.lift_div_tac
                                                                    (fun
                                                                    uu___6 ->
                                                                    match uu___5
                                                                    with
                                                                    | 
                                                                    (ge2,
                                                                    nbvl) ->
                                                                    (ge2,
                                                                    ((old_bv,
                                                                    fresh) ::
                                                                    nbvl))))))
                                                                    uu___5)))
                                                                    uu___5)))
                                                                    uu___4)))
                                                                    uu___4)))
                                                                    uu___4)))
                                                              uu___4)))
                                               uu___2))
                                 | uu___1 ->
                                     Obj.magic
                                       (mfail
                                          "_subst_with_fresh_vars: not a Tv_Abs"))
                                uu___)))) uu___2 uu___1 uu___
let (generate_shadowed_subst :
  genv ->
    ((genv * (FStar_Reflection_Types.bv * FStar_Reflection_Types.bv)
       Prims.list),
      unit) FStar_Tactics_Effect.tac_repr)
  =
  fun ge ->
    FStar_Tactics_Effect.tac_bind
      (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
         (Prims.of_int (622)) (Prims.of_int (12)) (Prims.of_int (622))
         (Prims.of_int (33)))
      (Prims.mk_range "experimental/FStar.InteractiveHelpers.Base.fst"
         (Prims.of_int (623)) (Prims.of_int (2)) (Prims.of_int (625))
         (Prims.of_int (39)))
      (FStar_Tactics_Effect.lift_div_tac
         (fun uu___ -> FStar_List_Tot_Base.rev ge.svars))
      (fun uu___ ->
         (fun bvl ->
            Obj.magic
              (FStar_Tactics_Effect.tac_bind
                 (Prims.mk_range
                    "experimental/FStar.InteractiveHelpers.Base.fst"
                    (Prims.of_int (623)) (Prims.of_int (11))
                    (Prims.of_int (623)) (Prims.of_int (37)))
                 (Prims.mk_range
                    "experimental/FStar.InteractiveHelpers.Base.fst"
                    (Prims.of_int (624)) (Prims.of_int (2))
                    (Prims.of_int (625)) (Prims.of_int (39)))
                 (FStar_Tactics_Effect.lift_div_tac
                    (fun uu___ ->
                       FStar_List_Tot_Base.map
                         FStar_Reflection_Derived.mk_binder bvl))
                 (fun uu___ ->
                    (fun bl ->
                       Obj.magic
                         (FStar_Tactics_Effect.tac_bind
                            (Prims.mk_range
                               "experimental/FStar.InteractiveHelpers.Base.fst"
                               (Prims.of_int (624)) (Prims.of_int (14))
                               (Prims.of_int (624)) (Prims.of_int (29)))
                            (Prims.mk_range
                               "experimental/FStar.InteractiveHelpers.Base.fst"
                               (Prims.of_int (625)) (Prims.of_int (2))
                               (Prims.of_int (625)) (Prims.of_int (39)))
                            (Obj.magic
                               (FStar_Tactics_Derived.mk_abs bl
                                  (FStar_Reflection_Builtins.pack_ln
                                     (FStar_Reflection_Data.Tv_Const
                                        FStar_Reflection_Data.C_Unit))))
                            (fun uu___ ->
                               (fun dummy ->
                                  Obj.magic
                                    (_generate_shadowed_subst ge dummy bvl))
                                 uu___))) uu___))) uu___)