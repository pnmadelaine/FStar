open Prims
exception Not_a_wp_implication of Prims.string 
let (uu___is_Not_a_wp_implication : Prims.exn -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | Not_a_wp_implication uu____10 -> true
    | uu____11 -> false
  
let (__proj__Not_a_wp_implication__item__uu___ : Prims.exn -> Prims.string) =
  fun projectee  ->
    match projectee with | Not_a_wp_implication uu____18 -> uu____18
  
type label = FStar_SMTEncoding_Term.error_label
type labels = FStar_SMTEncoding_Term.error_labels
let (sort_labels :
  (FStar_SMTEncoding_Term.error_label,Prims.bool)
    FStar_Pervasives_Native.tuple2 Prims.list ->
    ((FStar_SMTEncoding_Term.fv,Prims.string,FStar_Range.range)
       FStar_Pervasives_Native.tuple3,Prims.bool)
      FStar_Pervasives_Native.tuple2 Prims.list)
  =
  fun l  ->
    FStar_List.sortWith
      (fun uu____68  ->
         fun uu____69  ->
           match (uu____68, uu____69) with
           | (((uu____110,uu____111,r1),uu____113),((uu____114,uu____115,r2),uu____117))
               -> FStar_Range.compare r1 r2) l
  
let (remove_dups :
  labels ->
    (FStar_SMTEncoding_Term.fv,Prims.string,FStar_Range.range)
      FStar_Pervasives_Native.tuple3 Prims.list)
  =
  fun l  ->
    FStar_Util.remove_dups
      (fun uu____177  ->
         fun uu____178  ->
           match (uu____177, uu____178) with
           | ((uu____203,m1,r1),(uu____206,m2,r2)) -> (r1 = r2) && (m1 = m2))
      l
  
type msg = (Prims.string,FStar_Range.range) FStar_Pervasives_Native.tuple2
type ranges =
  (Prims.string FStar_Pervasives_Native.option,FStar_Range.range)
    FStar_Pervasives_Native.tuple2 Prims.list
let (fresh_label :
  Prims.string ->
    FStar_Range.range ->
      FStar_SMTEncoding_Term.term ->
        (label,FStar_SMTEncoding_Term.term) FStar_Pervasives_Native.tuple2)
  =
  let ctr = FStar_Util.mk_ref (Prims.parse_int "0")  in
  fun message  ->
    fun range  ->
      fun t  ->
        let l =
          FStar_Util.incr ctr;
          (let uu____290 =
             let uu____291 = FStar_ST.op_Bang ctr  in
             FStar_Util.string_of_int uu____291  in
           FStar_Util.format1 "label_%s" uu____290)
           in
        let lvar = (l, FStar_SMTEncoding_Term.Bool_sort)  in
        let label = (lvar, message, range)  in
        let lterm = FStar_SMTEncoding_Util.mkFreeV lvar  in
        let lt1 = FStar_SMTEncoding_Term.mkOr (lterm, t) range  in
        (label, lt1)
  
let (label_goals :
  (unit -> Prims.string) FStar_Pervasives_Native.option ->
    FStar_Range.range ->
      FStar_SMTEncoding_Term.term ->
        (labels,FStar_SMTEncoding_Term.term) FStar_Pervasives_Native.tuple2)
  =
  fun use_env_msg  ->
    fun r  ->
      fun q  ->
        let rec is_a_post_condition post_name_opt tm =
          match (post_name_opt, (tm.FStar_SMTEncoding_Term.tm)) with
          | (FStar_Pervasives_Native.None ,uu____400) -> false
          | (FStar_Pervasives_Native.Some nm,FStar_SMTEncoding_Term.FreeV
             (nm',uu____405)) -> nm = nm'
          | (uu____408,FStar_SMTEncoding_Term.App
             (FStar_SMTEncoding_Term.Var "Valid",tm1::[])) ->
              is_a_post_condition post_name_opt tm1
          | (uu____416,FStar_SMTEncoding_Term.App
             (FStar_SMTEncoding_Term.Var "ApplyTT",tm1::uu____418)) ->
              is_a_post_condition post_name_opt tm1
          | uu____427 -> false  in
        let conjuncts t =
          match t.FStar_SMTEncoding_Term.tm with
          | FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.And ,cs) -> cs
          | uu____449 -> [t]  in
        let is_guard_free tm =
          match tm.FStar_SMTEncoding_Term.tm with
          | FStar_SMTEncoding_Term.Quant
              (FStar_SMTEncoding_Term.Forall
               ,({
                   FStar_SMTEncoding_Term.tm = FStar_SMTEncoding_Term.App
                     (FStar_SMTEncoding_Term.Var "Prims.guard_free",p::[]);
                   FStar_SMTEncoding_Term.freevars = uu____457;
                   FStar_SMTEncoding_Term.rng = uu____458;_}::[])::[],iopt,uu____460,
               {
                 FStar_SMTEncoding_Term.tm = FStar_SMTEncoding_Term.App
                   (FStar_SMTEncoding_Term.Imp ,l::r1::[]);
                 FStar_SMTEncoding_Term.freevars = uu____463;
                 FStar_SMTEncoding_Term.rng = uu____464;_})
              -> true
          | uu____501 -> false  in
        let is_a_named_continuation lhs =
          FStar_All.pipe_right (conjuncts lhs)
            (FStar_Util.for_some is_guard_free)
           in
        let uu____510 =
          match use_env_msg with
          | FStar_Pervasives_Native.None  -> (false, "")
          | FStar_Pervasives_Native.Some f ->
              let uu____529 = f ()  in (true, uu____529)
           in
        match uu____510 with
        | (flag,msg_prefix) ->
            let fresh_label1 msg ropt rng t =
              let msg1 =
                if flag
                then
                  Prims.strcat "Failed to verify implicit argument: "
                    (Prims.strcat msg_prefix (Prims.strcat " :: " msg))
                else msg  in
              let rng1 =
                match ropt with
                | FStar_Pervasives_Native.None  -> rng
                | FStar_Pervasives_Native.Some r1 ->
                    let uu____569 =
                      let uu____570 = FStar_Range.use_range rng  in
                      let uu____571 = FStar_Range.use_range r1  in
                      FStar_Range.rng_included uu____570 uu____571  in
                    if uu____569
                    then rng
                    else
                      (let uu____573 = FStar_Range.def_range rng  in
                       FStar_Range.set_def_range r1 uu____573)
                 in
              fresh_label msg1 rng1 t  in
            let rec aux default_msg ropt post_name_opt labels q1 =
              match q1.FStar_SMTEncoding_Term.tm with
              | FStar_SMTEncoding_Term.BoundV uu____624 -> (labels, q1)
              | FStar_SMTEncoding_Term.Integer uu____627 -> (labels, q1)
              | FStar_SMTEncoding_Term.LblPos uu____630 ->
                  failwith "Impossible"
              | FStar_SMTEncoding_Term.Labeled
                  (arg,"could not prove post-condition",uu____642) ->
                  let fallback msg =
                    aux default_msg ropt post_name_opt labels arg  in
                  (try
                     match arg.FStar_SMTEncoding_Term.tm with
                     | FStar_SMTEncoding_Term.Quant
                         (FStar_SMTEncoding_Term.Forall
                          ,pats,iopt,post::sorts,{
                                                   FStar_SMTEncoding_Term.tm
                                                     =
                                                     FStar_SMTEncoding_Term.App
                                                     (FStar_SMTEncoding_Term.Imp
                                                      ,lhs::rhs::[]);
                                                   FStar_SMTEncoding_Term.freevars
                                                     = uu____703;
                                                   FStar_SMTEncoding_Term.rng
                                                     = rng;_})
                         ->
                         let post_name =
                           let uu____732 =
                             let uu____733 = FStar_Syntax_Syntax.next_id ()
                                in
                             FStar_All.pipe_left FStar_Util.string_of_int
                               uu____733
                              in
                           Prims.strcat "^^post_condition_" uu____732  in
                         let names1 =
                           let uu____741 =
                             FStar_List.mapi
                               (fun i  ->
                                  fun s  ->
                                    let uu____757 =
                                      let uu____758 =
                                        FStar_Util.string_of_int i  in
                                      Prims.strcat "^^" uu____758  in
                                    (uu____757, s)) sorts
                              in
                           (post_name, post) :: uu____741  in
                         let instantiation =
                           FStar_List.map FStar_SMTEncoding_Util.mkFreeV
                             names1
                            in
                         let uu____770 =
                           let uu____775 =
                             FStar_SMTEncoding_Term.inst instantiation lhs
                              in
                           let uu____776 =
                             FStar_SMTEncoding_Term.inst instantiation rhs
                              in
                           (uu____775, uu____776)  in
                         (match uu____770 with
                          | (lhs1,rhs1) ->
                              let uu____785 =
                                match lhs1.FStar_SMTEncoding_Term.tm with
                                | FStar_SMTEncoding_Term.App
                                    (FStar_SMTEncoding_Term.And ,clauses_lhs)
                                    ->
                                    let uu____803 =
                                      FStar_Util.prefix clauses_lhs  in
                                    (match uu____803 with
                                     | (req,ens) ->
                                         (match ens.FStar_SMTEncoding_Term.tm
                                          with
                                          | FStar_SMTEncoding_Term.Quant
                                              (FStar_SMTEncoding_Term.Forall
                                               ,pats_ens,iopt_ens,sorts_ens,
                                               {
                                                 FStar_SMTEncoding_Term.tm =
                                                   FStar_SMTEncoding_Term.App
                                                   (FStar_SMTEncoding_Term.Imp
                                                    ,ensures_conjuncts::post1::[]);
                                                 FStar_SMTEncoding_Term.freevars
                                                   = uu____833;
                                                 FStar_SMTEncoding_Term.rng =
                                                   rng_ens;_})
                                              ->
                                              let uu____861 =
                                                is_a_post_condition
                                                  (FStar_Pervasives_Native.Some
                                                     post_name) post1
                                                 in
                                              if uu____861
                                              then
                                                let uu____868 =
                                                  aux
                                                    "could not prove post-condition"
                                                    FStar_Pervasives_Native.None
                                                    (FStar_Pervasives_Native.Some
                                                       post_name) labels
                                                    ensures_conjuncts
                                                   in
                                                (match uu____868 with
                                                 | (labels1,ensures_conjuncts1)
                                                     ->
                                                     let pats_ens1 =
                                                       match pats_ens with
                                                       | [] -> [[post1]]
                                                       | []::[] -> [[post1]]
                                                       | uu____910 ->
                                                           pats_ens
                                                        in
                                                     let ens1 =
                                                       let uu____916 =
                                                         let uu____917 =
                                                           let uu____936 =
                                                             FStar_SMTEncoding_Term.mk
                                                               (FStar_SMTEncoding_Term.App
                                                                  (FStar_SMTEncoding_Term.Imp,
                                                                    [ensures_conjuncts1;
                                                                    post1]))
                                                               rng_ens
                                                              in
                                                           (FStar_SMTEncoding_Term.Forall,
                                                             pats_ens1,
                                                             iopt_ens,
                                                             sorts_ens,
                                                             uu____936)
                                                            in
                                                         FStar_SMTEncoding_Term.Quant
                                                           uu____917
                                                          in
                                                       FStar_SMTEncoding_Term.mk
                                                         uu____916
                                                         ens.FStar_SMTEncoding_Term.rng
                                                        in
                                                     let lhs2 =
                                                       FStar_SMTEncoding_Term.mk
                                                         (FStar_SMTEncoding_Term.App
                                                            (FStar_SMTEncoding_Term.And,
                                                              (FStar_List.append
                                                                 req 
                                                                 [ens1])))
                                                         lhs1.FStar_SMTEncoding_Term.rng
                                                        in
                                                     let uu____950 =
                                                       FStar_SMTEncoding_Term.abstr
                                                         names1 lhs2
                                                        in
                                                     (labels1, uu____950))
                                              else
                                                (let uu____954 =
                                                   let uu____955 =
                                                     let uu____956 =
                                                       let uu____957 =
                                                         let uu____958 =
                                                           FStar_SMTEncoding_Term.print_smt_term
                                                             post1
                                                            in
                                                         Prims.strcat
                                                           "  ... " uu____958
                                                          in
                                                       Prims.strcat post_name
                                                         uu____957
                                                        in
                                                     Prims.strcat
                                                       "Ensures clause doesn't match post name:  "
                                                       uu____956
                                                      in
                                                   Not_a_wp_implication
                                                     uu____955
                                                    in
                                                 FStar_Exn.raise uu____954)
                                          | uu____965 ->
                                              let uu____966 =
                                                let uu____967 =
                                                  let uu____968 =
                                                    let uu____969 =
                                                      let uu____970 =
                                                        FStar_SMTEncoding_Term.print_smt_term
                                                          ens
                                                         in
                                                      Prims.strcat "  ... "
                                                        uu____970
                                                       in
                                                    Prims.strcat post_name
                                                      uu____969
                                                     in
                                                  Prims.strcat
                                                    "Ensures clause doesn't have the expected shape for post-condition "
                                                    uu____968
                                                   in
                                                Not_a_wp_implication
                                                  uu____967
                                                 in
                                              FStar_Exn.raise uu____966))
                                | uu____977 ->
                                    let uu____978 =
                                      let uu____979 =
                                        let uu____980 =
                                          FStar_SMTEncoding_Term.print_smt_term
                                            lhs1
                                           in
                                        Prims.strcat "LHS not a conjunct: "
                                          uu____980
                                         in
                                      Not_a_wp_implication uu____979  in
                                    FStar_Exn.raise uu____978
                                 in
                              (match uu____785 with
                               | (labels1,lhs2) ->
                                   let uu____999 =
                                     let uu____1006 =
                                       aux default_msg
                                         FStar_Pervasives_Native.None
                                         (FStar_Pervasives_Native.Some
                                            post_name) labels1 rhs1
                                        in
                                     match uu____1006 with
                                     | (labels2,rhs2) ->
                                         let uu____1025 =
                                           FStar_SMTEncoding_Term.abstr
                                             names1 rhs2
                                            in
                                         (labels2, uu____1025)
                                      in
                                   (match uu____999 with
                                    | (labels2,rhs2) ->
                                        let body =
                                          FStar_SMTEncoding_Term.mkImp
                                            (lhs2, rhs2) rng
                                           in
                                        let uu____1041 =
                                          FStar_SMTEncoding_Term.mk
                                            (FStar_SMTEncoding_Term.Quant
                                               (FStar_SMTEncoding_Term.Forall,
                                                 pats, iopt, (post :: sorts),
                                                 body))
                                            q1.FStar_SMTEncoding_Term.rng
                                           in
                                        (labels2, uu____1041))))
                     | uu____1052 ->
                         let uu____1053 =
                           let uu____1054 =
                             FStar_SMTEncoding_Term.print_smt_term arg  in
                           Prims.strcat "arg not a quant: " uu____1054  in
                         fallback uu____1053
                   with | Not_a_wp_implication msg -> fallback msg)
              | FStar_SMTEncoding_Term.Labeled (arg,reason,r1) ->
                  aux reason (FStar_Pervasives_Native.Some r1) post_name_opt
                    labels arg
              | FStar_SMTEncoding_Term.Quant
                  (FStar_SMTEncoding_Term.Forall
                   ,[],FStar_Pervasives_Native.None
                   ,sorts,{
                            FStar_SMTEncoding_Term.tm =
                              FStar_SMTEncoding_Term.App
                              (FStar_SMTEncoding_Term.Imp ,lhs::rhs::[]);
                            FStar_SMTEncoding_Term.freevars = uu____1071;
                            FStar_SMTEncoding_Term.rng = rng;_})
                  when is_a_named_continuation lhs ->
                  let uu____1095 = FStar_Util.prefix sorts  in
                  (match uu____1095 with
                   | (sorts',post) ->
                       let new_post_name =
                         let uu____1115 =
                           let uu____1116 = FStar_Syntax_Syntax.next_id ()
                              in
                           FStar_All.pipe_left FStar_Util.string_of_int
                             uu____1116
                            in
                         Prims.strcat "^^post_condition_" uu____1115  in
                       let names1 =
                         let uu____1124 =
                           FStar_List.mapi
                             (fun i  ->
                                fun s  ->
                                  let uu____1140 =
                                    let uu____1141 =
                                      FStar_Util.string_of_int i  in
                                    Prims.strcat "^^" uu____1141  in
                                  (uu____1140, s)) sorts'
                            in
                         FStar_List.append uu____1124 [(new_post_name, post)]
                          in
                       let instantiation =
                         FStar_List.map FStar_SMTEncoding_Util.mkFreeV names1
                          in
                       let uu____1161 =
                         let uu____1166 =
                           FStar_SMTEncoding_Term.inst instantiation lhs  in
                         let uu____1167 =
                           FStar_SMTEncoding_Term.inst instantiation rhs  in
                         (uu____1166, uu____1167)  in
                       (match uu____1161 with
                        | (lhs1,rhs1) ->
                            let uu____1176 =
                              FStar_Util.fold_map
                                (fun labels1  ->
                                   fun tm  ->
                                     match tm.FStar_SMTEncoding_Term.tm with
                                     | FStar_SMTEncoding_Term.Quant
                                         (FStar_SMTEncoding_Term.Forall
                                          ,({
                                              FStar_SMTEncoding_Term.tm =
                                                FStar_SMTEncoding_Term.App
                                                (FStar_SMTEncoding_Term.Var
                                                 "Prims.guard_free",p::[]);
                                              FStar_SMTEncoding_Term.freevars
                                                = uu____1214;
                                              FStar_SMTEncoding_Term.rng =
                                                uu____1215;_}::[])::[],iopt,sorts1,
                                          {
                                            FStar_SMTEncoding_Term.tm =
                                              FStar_SMTEncoding_Term.App
                                              (FStar_SMTEncoding_Term.Imp
                                               ,l0::r1::[]);
                                            FStar_SMTEncoding_Term.freevars =
                                              uu____1220;
                                            FStar_SMTEncoding_Term.rng =
                                              uu____1221;_})
                                         ->
                                         let uu____1258 =
                                           is_a_post_condition
                                             (FStar_Pervasives_Native.Some
                                                new_post_name) r1
                                            in
                                         if uu____1258
                                         then
                                           let uu____1265 =
                                             aux default_msg
                                               FStar_Pervasives_Native.None
                                               post_name_opt labels1 l0
                                              in
                                           (match uu____1265 with
                                            | (labels2,l) ->
                                                let uu____1284 =
                                                  let uu____1285 =
                                                    let uu____1286 =
                                                      let uu____1305 =
                                                        FStar_SMTEncoding_Util.norng
                                                          FStar_SMTEncoding_Term.mk
                                                          (FStar_SMTEncoding_Term.App
                                                             (FStar_SMTEncoding_Term.Imp,
                                                               [l; r1]))
                                                         in
                                                      (FStar_SMTEncoding_Term.Forall,
                                                        [[p]],
                                                        (FStar_Pervasives_Native.Some
                                                           (Prims.parse_int "0")),
                                                        sorts1, uu____1305)
                                                       in
                                                    FStar_SMTEncoding_Term.Quant
                                                      uu____1286
                                                     in
                                                  FStar_SMTEncoding_Term.mk
                                                    uu____1285
                                                    q1.FStar_SMTEncoding_Term.rng
                                                   in
                                                (labels2, uu____1284))
                                         else (labels1, tm)
                                     | uu____1325 -> (labels1, tm)) labels
                                (conjuncts lhs1)
                               in
                            (match uu____1176 with
                             | (labels1,lhs_conjs) ->
                                 let uu____1344 =
                                   aux default_msg
                                     FStar_Pervasives_Native.None
                                     (FStar_Pervasives_Native.Some
                                        new_post_name) labels1 rhs1
                                    in
                                 (match uu____1344 with
                                  | (labels2,rhs2) ->
                                      let body =
                                        let uu____1364 =
                                          let uu____1365 =
                                            let uu____1370 =
                                              FStar_SMTEncoding_Term.mk_and_l
                                                lhs_conjs
                                                lhs1.FStar_SMTEncoding_Term.rng
                                               in
                                            (uu____1370, rhs2)  in
                                          FStar_SMTEncoding_Term.mkImp
                                            uu____1365 rng
                                           in
                                        FStar_All.pipe_right uu____1364
                                          (FStar_SMTEncoding_Term.abstr
                                             names1)
                                         in
                                      let q2 =
                                        FStar_SMTEncoding_Term.mk
                                          (FStar_SMTEncoding_Term.Quant
                                             (FStar_SMTEncoding_Term.Forall,
                                               [],
                                               FStar_Pervasives_Native.None,
                                               sorts, body))
                                          q1.FStar_SMTEncoding_Term.rng
                                         in
                                      (labels2, q2)))))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Imp ,lhs::rhs::[]) ->
                  let uu____1388 =
                    aux default_msg ropt post_name_opt labels rhs  in
                  (match uu____1388 with
                   | (labels1,rhs1) ->
                       let uu____1407 =
                         FStar_SMTEncoding_Util.mkImp (lhs, rhs1)  in
                       (labels1, uu____1407))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.And ,conjuncts1) ->
                  let uu____1415 =
                    FStar_Util.fold_map (aux default_msg ropt post_name_opt)
                      labels conjuncts1
                     in
                  (match uu____1415 with
                   | (labels1,conjuncts2) ->
                       let uu____1442 =
                         FStar_SMTEncoding_Term.mk_and_l conjuncts2
                           q1.FStar_SMTEncoding_Term.rng
                          in
                       (labels1, uu____1442))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.ITE ,hd1::q11::q2::[]) ->
                  let uu____1450 =
                    aux default_msg ropt post_name_opt labels q11  in
                  (match uu____1450 with
                   | (labels1,q12) ->
                       let uu____1469 =
                         aux default_msg ropt post_name_opt labels1 q2  in
                       (match uu____1469 with
                        | (labels2,q21) ->
                            let uu____1488 =
                              FStar_SMTEncoding_Term.mkITE (hd1, q12, q21)
                                q1.FStar_SMTEncoding_Term.rng
                               in
                            (labels2, uu____1488)))
              | FStar_SMTEncoding_Term.Quant
                  (FStar_SMTEncoding_Term.Exists
                   ,uu____1491,uu____1492,uu____1493,uu____1494)
                  ->
                  let uu____1511 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1511 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Iff ,uu____1526) ->
                  let uu____1531 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1531 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Or ,uu____1546) ->
                  let uu____1551 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1551 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Var uu____1566,uu____1567) when
                  is_a_post_condition post_name_opt q1 -> (labels, q1)
              | FStar_SMTEncoding_Term.FreeV uu____1574 ->
                  let uu____1579 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1579 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.TrueOp ,uu____1594) ->
                  let uu____1599 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1599 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.FalseOp ,uu____1614) ->
                  let uu____1619 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1619 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Not ,uu____1634) ->
                  let uu____1639 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1639 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Eq ,uu____1654) ->
                  let uu____1659 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1659 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.LT ,uu____1674) ->
                  let uu____1679 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1679 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.LTE ,uu____1694) ->
                  let uu____1699 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1699 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.GT ,uu____1714) ->
                  let uu____1719 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1719 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.GTE ,uu____1734) ->
                  let uu____1739 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1739 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvUlt ,uu____1754) ->
                  let uu____1759 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1759 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Var uu____1774,uu____1775) ->
                  let uu____1780 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1780 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Add ,uu____1795) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Sub ,uu____1806) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Div ,uu____1817) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Mul ,uu____1828) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Minus ,uu____1839) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Mod ,uu____1850) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvAnd ,uu____1861) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvXor ,uu____1872) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvOr ,uu____1883) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvAdd ,uu____1894) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvSub ,uu____1905) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvShl ,uu____1916) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvShr ,uu____1927) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvUdiv ,uu____1938) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvMod ,uu____1949) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvMul ,uu____1960) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvUext uu____1971,uu____1972) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvToNat ,uu____1983) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.NatToBv uu____1994,uu____1995) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.ITE ,uu____2006) ->
                  failwith "Impossible: arity mismatch"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Imp ,uu____2017) ->
                  failwith "Impossible: arity mismatch"
              | FStar_SMTEncoding_Term.Quant
                  (FStar_SMTEncoding_Term.Forall ,pats,iopt,sorts,body) ->
                  let uu____2048 =
                    aux default_msg ropt post_name_opt labels body  in
                  (match uu____2048 with
                   | (labels1,body1) ->
                       let uu____2067 =
                         FStar_SMTEncoding_Term.mk
                           (FStar_SMTEncoding_Term.Quant
                              (FStar_SMTEncoding_Term.Forall, pats, iopt,
                                sorts, body1)) q1.FStar_SMTEncoding_Term.rng
                          in
                       (labels1, uu____2067))
              | FStar_SMTEncoding_Term.Let (es,body) ->
                  let uu____2084 =
                    aux default_msg ropt post_name_opt labels body  in
                  (match uu____2084 with
                   | (labels1,body1) ->
                       let uu____2103 =
                         FStar_SMTEncoding_Term.mkLet (es, body1)
                           q1.FStar_SMTEncoding_Term.rng
                          in
                       (labels1, uu____2103))
               in
            aux "assertion failed" FStar_Pervasives_Native.None
              FStar_Pervasives_Native.None [] q
  
let (detail_errors :
  Prims.bool ->
    FStar_TypeChecker_Env.env ->
      labels ->
        (FStar_SMTEncoding_Term.decls_t -> FStar_SMTEncoding_Z3.z3result) ->
          unit)
  =
  fun hint_replay  ->
    fun env  ->
      fun all_labels  ->
        fun askZ3  ->
          let print_banner uu____2138 =
            let msg =
              let uu____2140 =
                let uu____2141 = FStar_TypeChecker_Env.get_range env  in
                FStar_Range.string_of_range uu____2141  in
              let uu____2142 = FStar_Util.string_of_int (Prims.parse_int "5")
                 in
              let uu____2143 =
                FStar_Util.string_of_int (FStar_List.length all_labels)  in
              FStar_Util.format4
                "Detailed %s report follows for %s\nTaking %s seconds per proof obligation (%s proofs in total)\n"
                (if hint_replay then "hint replay" else "error") uu____2140
                uu____2142 uu____2143
               in
            FStar_Util.print_error msg  in
          let print_result uu____2160 =
            match uu____2160 with
            | ((uu____2171,msg,r),success) ->
                if success
                then
                  let uu____2181 = FStar_Range.string_of_range r  in
                  FStar_Util.print1
                    "OK: proof obligation at %s was proven in isolation\n"
                    uu____2181
                else
                  if hint_replay
                  then
                    FStar_Errors.log_issue r
                      (FStar_Errors.Warning_HintFailedToReplayProof,
                        (Prims.strcat
                           "Hint failed to replay this sub-proof: " msg))
                  else
                    (let uu____2184 =
                       let uu____2189 =
                         let uu____2190 = FStar_Range.string_of_range r  in
                         FStar_Util.format2
                           "XX: proof obligation at %s failed\n\t%s\n"
                           uu____2190 msg
                          in
                       (FStar_Errors.Error_ProofObligationFailed, uu____2189)
                        in
                     FStar_Errors.log_issue r uu____2184)
             in
          let elim labs =
            FStar_All.pipe_right labs
              (FStar_List.map
                 (fun uu____2252  ->
                    match uu____2252 with
                    | (l,uu____2264,uu____2265) ->
                        let a =
                          let uu____2275 =
                            let uu____2276 =
                              let uu____2281 =
                                FStar_SMTEncoding_Util.mkFreeV l  in
                              (uu____2281, FStar_SMTEncoding_Util.mkTrue)  in
                            FStar_SMTEncoding_Util.mkEq uu____2276  in
                          {
                            FStar_SMTEncoding_Term.assumption_term =
                              uu____2275;
                            FStar_SMTEncoding_Term.assumption_caption =
                              (FStar_Pervasives_Native.Some "Disabling label");
                            FStar_SMTEncoding_Term.assumption_name =
                              (Prims.strcat "@disable_label_"
                                 (FStar_Pervasives_Native.fst l));
                            FStar_SMTEncoding_Term.assumption_fact_ids = []
                          }  in
                        FStar_SMTEncoding_Term.Assume a))
             in
          let rec linear_check eliminated errors active =
            FStar_SMTEncoding_Z3.refresh ();
            (match active with
             | [] ->
                 let results =
                   let uu____2342 =
                     FStar_List.map (fun x  -> (x, true)) eliminated  in
                   let uu____2355 =
                     FStar_List.map (fun x  -> (x, false)) errors  in
                   FStar_List.append uu____2342 uu____2355  in
                 sort_labels results
             | hd1::tl1 ->
                 ((let uu____2377 =
                     FStar_Util.string_of_int (FStar_List.length active)  in
                   FStar_Util.print1 "%s, " uu____2377);
                  (let decls =
                     FStar_All.pipe_left elim
                       (FStar_List.append eliminated
                          (FStar_List.append errors tl1))
                      in
                   let result = askZ3 decls  in
                   match result.FStar_SMTEncoding_Z3.z3result_status with
                   | FStar_SMTEncoding_Z3.UNSAT uu____2404 ->
                       linear_check (hd1 :: eliminated) errors tl1
                   | uu____2405 ->
                       linear_check eliminated (hd1 :: errors) tl1)))
             in
          print_banner ();
          FStar_Options.set_option "z3rlimit"
            (FStar_Options.Int (Prims.parse_int "5"));
          (let res = linear_check [] [] all_labels  in
           FStar_Util.print_string "\n";
           FStar_All.pipe_right res (FStar_List.iter print_result);
           (let uu____2445 =
              FStar_Util.for_all FStar_Pervasives_Native.snd res  in
            if uu____2445
            then
              FStar_Util.print_string
                "Failed: the heuristic of trying each proof in isolation failed to identify a precise error\n"
            else ()))
  