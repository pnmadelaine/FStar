
let binderIsExp = (fun ( bn ) -> (Microsoft_FStar_Absyn_Print.is_inr (Support.Prims.fst bn)))

let rec argIsExp = (fun ( k ) ( typeName ) -> (match ((let _65_24865 = (Microsoft_FStar_Absyn_Util.compress_kind k)
in _65_24865.Microsoft_FStar_Absyn_Syntax.n)) with
| Microsoft_FStar_Absyn_Syntax.Kind_type -> begin
[]
end
| Microsoft_FStar_Absyn_Syntax.Kind_arrow ((bs, r)) -> begin
(let _65_24867 = (Support.List.map binderIsExp bs)
in (let _65_24866 = (argIsExp r typeName)
in (Support.List.append _65_24867 _65_24866)))
end
| Microsoft_FStar_Absyn_Syntax.Kind_delayed ((k, _, _)) -> begin
(failwith ("extraction.numIndices : expected a compressed argument"))
end
| Microsoft_FStar_Absyn_Syntax.Kind_abbrev ((_, k)) -> begin
(argIsExp k typeName)
end
| _ -> begin
(failwith ((Support.String.strcat "unexpected signature of inductive type" typeName)))
end))

let numIndices = (fun ( k ) ( typeName ) -> (let _65_24872 = (argIsExp k typeName)
in (Support.List.length _65_24872)))

let mlty_of_isExp = (fun ( b ) -> (match (b) with
| true -> begin
Microsoft_FStar_Backends_ML_Env.erasedContent
end
| false -> begin
Microsoft_FStar_Backends_ML_Env.unknownType
end))

let delta_norm_eff = (let cache = (Support.Microsoft.FStar.Util.smap_create 20)
in (let rec delta_norm_eff = (fun ( g ) ( l ) -> (match ((Support.Microsoft.FStar.Util.smap_try_find cache l.Microsoft_FStar_Absyn_Syntax.str)) with
| Some (l) -> begin
l
end
| None -> begin
(let res = (match ((Microsoft_FStar_Tc_Env.lookup_effect_abbrev g.Microsoft_FStar_Backends_ML_Env.tcenv l)) with
| None -> begin
l
end
| Some ((_, c)) -> begin
(delta_norm_eff g (Microsoft_FStar_Absyn_Util.comp_effect_name c))
end)
in (let _60_42 = (Support.Microsoft.FStar.Util.smap_add cache l.Microsoft_FStar_Absyn_Syntax.str res)
in res))
end))
in delta_norm_eff))

let translate_eff = (fun ( g ) ( l ) -> (let l = (delta_norm_eff g l)
in (match ((Microsoft_FStar_Absyn_Syntax.lid_equals l Microsoft_FStar_Absyn_Const.effect_PURE_lid)) with
| true -> begin
Microsoft_FStar_Backends_ML_Syntax.E_PURE
end
| false -> begin
Microsoft_FStar_Backends_ML_Syntax.E_IMPURE
end)))

let rec curry = (fun ( inp ) ( f ) ( out ) -> (match (inp) with
| [] -> begin
out
end
| h::[] -> begin
Microsoft_FStar_Backends_ML_Syntax.MLTY_Fun ((h, f, out))
end
| h1::h2::tl -> begin
(let _65_24892 = (let _65_24891 = (curry ((h2)::tl) f out)
in (h1, Microsoft_FStar_Backends_ML_Syntax.E_PURE, _65_24891))
in Microsoft_FStar_Backends_ML_Syntax.MLTY_Fun (_65_24892))
end))

type context =
Microsoft_FStar_Backends_ML_Env.env

let extendContextWithRepAsTyVar = (fun ( b ) ( c ) -> (match (b) with
| (Support.Microsoft.FStar.Util.Inl (bt), Support.Microsoft.FStar.Util.Inl (btr)) -> begin
(Microsoft_FStar_Backends_ML_Env.extend_ty c btr (Some (Microsoft_FStar_Backends_ML_Syntax.MLTY_Var ((Microsoft_FStar_Backends_ML_Env.btvar_as_mlident bt)))))
end
| (Support.Microsoft.FStar.Util.Inr (bv), Support.Microsoft.FStar.Util.Inr (_)) -> begin
(Microsoft_FStar_Backends_ML_Env.extend_bv c bv ([], Microsoft_FStar_Backends_ML_Env.erasedContent) false)
end
| _ -> begin
(failwith ("Impossible case"))
end))

let extendContextWithRepAsTyVars = (fun ( b ) ( c ) -> (Support.List.fold_right extendContextWithRepAsTyVar b c))

let extendContextAsTyvar = (fun ( availableInML ) ( b ) ( c ) -> (match (b) with
| Support.Microsoft.FStar.Util.Inl (bt) -> begin
(Microsoft_FStar_Backends_ML_Env.extend_ty c bt (Some ((match (availableInML) with
| true -> begin
Microsoft_FStar_Backends_ML_Syntax.MLTY_Var ((Microsoft_FStar_Backends_ML_Env.btvar_as_mlident bt))
end
| false -> begin
Microsoft_FStar_Backends_ML_Env.unknownType
end))))
end
| Support.Microsoft.FStar.Util.Inr (bv) -> begin
(Microsoft_FStar_Backends_ML_Env.extend_bv c bv ([], Microsoft_FStar_Backends_ML_Env.erasedContent) false)
end))

let extendContext = (fun ( c ) ( tyVars ) -> (Support.List.fold_right (extendContextAsTyvar true) tyVars c))

let isTypeScheme = (fun ( i ) ( c ) -> true)

let preProcType = (fun ( c ) ( ft ) -> (let ft = (Microsoft_FStar_Absyn_Util.compress_typ ft)
in (Microsoft_FStar_Tc_Normalize.norm_typ ((Microsoft_FStar_Tc_Normalize.Beta)::[]) c.Microsoft_FStar_Backends_ML_Env.tcenv ft)))

let extractTyVar = (fun ( c ) ( btv ) -> (Microsoft_FStar_Backends_ML_Env.lookup_tyvar c btv))

let rec extractTyp = (fun ( c ) ( ft ) -> (let ft = (preProcType c ft)
in (match (ft.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Typ_btvar (btv) -> begin
(extractTyVar c btv)
end
| Microsoft_FStar_Absyn_Syntax.Typ_const (ftv) -> begin
(extractTyConstApp c ftv [])
end
| Microsoft_FStar_Absyn_Syntax.Typ_fun ((bs, codomain)) -> begin
(let _60_104 = (extractBindersTypes c bs)
in (match (_60_104) with
| (bts, newC) -> begin
(let _60_107 = (extractComp newC codomain)
in (match (_60_107) with
| (codomainML, erase) -> begin
(curry bts erase codomainML)
end))
end))
end
| Microsoft_FStar_Absyn_Syntax.Typ_refine ((bv, _)) -> begin
(extractTyp c bv.Microsoft_FStar_Absyn_Syntax.sort)
end
| Microsoft_FStar_Absyn_Syntax.Typ_app ((ty, arrgs)) -> begin
(let ty = (preProcType c ty)
in (let res = (match (ty.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Typ_btvar (btv) -> begin
(extractTyVar c btv)
end
| Microsoft_FStar_Absyn_Syntax.Typ_const (ftv) -> begin
(extractTyConstApp c ftv arrgs)
end
| Microsoft_FStar_Absyn_Syntax.Typ_app ((tyin, argsin)) -> begin
(let _65_24944 = (Microsoft_FStar_Backends_ML_Util.mkTypApp tyin (Support.List.append argsin arrgs) ty)
in (extractTyp c _65_24944))
end
| _ -> begin
Microsoft_FStar_Backends_ML_Env.unknownType
end)
in res))
end
| Microsoft_FStar_Absyn_Syntax.Typ_lam ((bs, ty)) -> begin
(let _60_135 = (extractBindersTypes c bs)
in (match (_60_135) with
| (bts, c) -> begin
(extractTyp c ty)
end))
end
| Microsoft_FStar_Absyn_Syntax.Typ_ascribed ((ty, _)) -> begin
(extractTyp c ty)
end
| Microsoft_FStar_Absyn_Syntax.Typ_meta (mt) -> begin
(extractMeta c mt)
end
| Microsoft_FStar_Absyn_Syntax.Typ_uvar (_) -> begin
Microsoft_FStar_Backends_ML_Env.unknownType
end
| Microsoft_FStar_Absyn_Syntax.Typ_delayed (_) -> begin
(failwith ("expected the argument to be compressed"))
end
| _ -> begin
(failwith ("NYI. replace this with unknownType if you know the consequences"))
end)))
and getTypeFromArg = (fun ( c ) ( a ) -> (match ((Support.Prims.fst a)) with
| Support.Microsoft.FStar.Util.Inl (ty) -> begin
(extractTyp c ty)
end
| Support.Microsoft.FStar.Util.Inr (_) -> begin
Microsoft_FStar_Backends_ML_Env.erasedContent
end))
and extractMeta = (fun ( c ) ( mt ) -> (match (mt) with
| (Microsoft_FStar_Absyn_Syntax.Meta_pattern ((t, _))) | (Microsoft_FStar_Absyn_Syntax.Meta_named ((t, _))) | (Microsoft_FStar_Absyn_Syntax.Meta_labeled ((t, _, _, _))) | (Microsoft_FStar_Absyn_Syntax.Meta_refresh_label ((t, _, _))) | (Microsoft_FStar_Absyn_Syntax.Meta_slack_formula ((t, _, _))) -> begin
(extractTyp c t)
end))
and extractTyConstApp = (fun ( c ) ( ftv ) ( ags ) -> (match ((isTypeScheme ftv.Microsoft_FStar_Absyn_Syntax.v c)) with
| true -> begin
(let mlargs = (Support.List.map (getTypeFromArg c) ags)
in (let k = ftv.Microsoft_FStar_Absyn_Syntax.sort
in (let ar = (argIsExp k ftv.Microsoft_FStar_Absyn_Syntax.v.Microsoft_FStar_Absyn_Syntax.str)
in (let _60_198 = (Support.Microsoft.FStar.Util.first_N (Support.List.length mlargs) ar)
in (match (_60_198) with
| (_, missingArgs) -> begin
(let argCompletion = (Support.List.map mlty_of_isExp missingArgs)
in (let _65_24953 = (let _65_24952 = (Microsoft_FStar_Backends_ML_Syntax.mlpath_of_lident ftv.Microsoft_FStar_Absyn_Syntax.v)
in ((Support.List.append mlargs argCompletion), _65_24952))
in Microsoft_FStar_Backends_ML_Syntax.MLTY_Named (_65_24953)))
end)))))
end
| false -> begin
(failwith ("this case was not anticipated"))
end))
and extractBinderType = (fun ( c ) ( bn ) -> (match (bn) with
| (Support.Microsoft.FStar.Util.Inl (btv), _) -> begin
(let _65_24957 = (extractKind c btv.Microsoft_FStar_Absyn_Syntax.sort)
in (let _65_24956 = (extendContextAsTyvar false (Support.Microsoft.FStar.Util.Inl (btv)) c)
in (_65_24957, _65_24956)))
end
| (Support.Microsoft.FStar.Util.Inr (bvv), _) -> begin
(let _65_24959 = (extractTyp c bvv.Microsoft_FStar_Absyn_Syntax.sort)
in (let _65_24958 = (extendContextAsTyvar false (Support.Microsoft.FStar.Util.Inr (bvv)) c)
in (_65_24959, _65_24958)))
end))
and extractBindersTypes = (fun ( c ) ( bs ) -> (let _65_24965 = (Support.List.fold_left (fun ( _60_216 ) ( b ) -> (match (_60_216) with
| (lt, cp) -> begin
(let _60_220 = (extractBinderType cp b)
in (match (_60_220) with
| (nt, nc) -> begin
((nt)::lt, nc)
end))
end)) ([], c) bs)
in ((fun ( _60_223 ) -> (match (_60_223) with
| (x, c) -> begin
((Support.List.rev x), c)
end)) _65_24965)))
and extractKind = (fun ( c ) ( ft ) -> Microsoft_FStar_Backends_ML_Env.erasedContent)
and extractComp = (fun ( c ) ( ft ) -> (extractComp' c ft.Microsoft_FStar_Absyn_Syntax.n))
and extractComp' = (fun ( c ) ( ft ) -> (match (ft) with
| Microsoft_FStar_Absyn_Syntax.Total (ty) -> begin
(let _65_24972 = (extractTyp c ty)
in (_65_24972, Microsoft_FStar_Backends_ML_Syntax.E_PURE))
end
| Microsoft_FStar_Absyn_Syntax.Comp (cm) -> begin
(let _65_24974 = (extractTyp c cm.Microsoft_FStar_Absyn_Syntax.result_typ)
in (let _65_24973 = (translate_eff c cm.Microsoft_FStar_Absyn_Syntax.effect_name)
in (_65_24974, _65_24973)))
end))

let binderPPnames = (fun ( bn ) -> (match (bn) with
| (Support.Microsoft.FStar.Util.Inl (btv), _) -> begin
btv.Microsoft_FStar_Absyn_Syntax.v.Microsoft_FStar_Absyn_Syntax.ppname
end
| (Support.Microsoft.FStar.Util.Inr (bvv), _) -> begin
bvv.Microsoft_FStar_Absyn_Syntax.v.Microsoft_FStar_Absyn_Syntax.ppname
end))

let binderRealnames = (fun ( bn ) -> (match (bn) with
| (Support.Microsoft.FStar.Util.Inl (btv), _) -> begin
btv.Microsoft_FStar_Absyn_Syntax.v.Microsoft_FStar_Absyn_Syntax.realname
end
| (Support.Microsoft.FStar.Util.Inr (bvv), _) -> begin
bvv.Microsoft_FStar_Absyn_Syntax.v.Microsoft_FStar_Absyn_Syntax.realname
end))

let mlsymbolOfLident = (fun ( id ) -> id.Microsoft_FStar_Absyn_Syntax.ident.Microsoft_FStar_Absyn_Syntax.idText)

type inductiveConstructor =
{cname : Microsoft_FStar_Absyn_Syntax.lident; ctype : Microsoft_FStar_Absyn_Syntax.typ}

let is_MkinductiveConstructor = (fun ( _ ) -> (failwith ("Not yet implemented")))

type inductiveTypeFam =
{tyName : Microsoft_FStar_Absyn_Syntax.lident; k : Microsoft_FStar_Absyn_Syntax.knd; tyBinders : Microsoft_FStar_Absyn_Syntax.binders; constructors : inductiveConstructor list; qualifiers : Microsoft_FStar_Absyn_Syntax.qualifier list}

let is_MkinductiveTypeFam = (fun ( _ ) -> (failwith ("Not yet implemented")))

type typeAbbrev =
{abTyName : Microsoft_FStar_Absyn_Syntax.lident; abTyBinders : Microsoft_FStar_Absyn_Syntax.binders; abBody : Microsoft_FStar_Absyn_Syntax.typ}

let is_MktypeAbbrev = (fun ( _ ) -> (failwith ("Not yet implemented")))

let lookupDataConType = (fun ( c ) ( sigb ) ( l ) -> (let tr = (Support.Microsoft.FStar.Util.find_map sigb (fun ( s ) -> (match (s) with
| Microsoft_FStar_Absyn_Syntax.Sig_datacon ((l', t, tc, quals, lids, _)) -> begin
(match ((l = l')) with
| true -> begin
Some (t)
end
| false -> begin
None
end)
end
| _ -> begin
None
end)))
in (Support.Microsoft.FStar.Util.must tr)))

let parseInductiveConstructors = (fun ( c ) ( cnames ) ( sigb ) -> (Support.List.map (fun ( h ) -> (let _65_25028 = (lookupDataConType c sigb h)
in {cname = h; ctype = _65_25028})) cnames))

let rec parseInductiveTypesFromSigBundle = (fun ( c ) ( sigs ) -> (match (sigs) with
| [] -> begin
([], [], [])
end
| Microsoft_FStar_Absyn_Syntax.Sig_tycon ((l, bs, kk, _, constrs, qs, _))::tlsig -> begin
(let indConstrs = (parseInductiveConstructors c constrs tlsig)
in (let _60_310 = (parseInductiveTypesFromSigBundle c tlsig)
in (match (_60_310) with
| (inds, abbs, exns) -> begin
(({tyName = l; k = kk; tyBinders = bs; constructors = indConstrs; qualifiers = qs})::inds, abbs, exns)
end)))
end
| Microsoft_FStar_Absyn_Syntax.Sig_datacon ((l, t, tc, quals, lids, _))::tlsig -> begin
(match ((Support.List.contains Microsoft_FStar_Absyn_Syntax.ExceptionConstructor quals)) with
| true -> begin
(let t = (Microsoft_FStar_Tc_Env.lookup_datacon c.Microsoft_FStar_Backends_ML_Env.tcenv l)
in (let _60_323 = ()
in ([], [], ({cname = l; ctype = t})::[])))
end
| false -> begin
([], [], [])
end)
end
| Microsoft_FStar_Absyn_Syntax.Sig_typ_abbrev ((l, bs, _, t, _, _))::tlsig -> begin
(let _60_341 = (parseInductiveTypesFromSigBundle c tlsig)
in (match (_60_341) with
| (inds, abbs, exns) -> begin
(inds, ({abTyName = l; abTyBinders = bs; abBody = t})::abbs, exns)
end))
end
| se::tlsig -> begin
(let _65_25034 = (let _65_25033 = (Microsoft_FStar_Absyn_Print.sigelt_to_string se)
in (Support.Microsoft.FStar.Util.format1 "unexpected content in a  sig bundle : %s\n" _65_25033))
in (failwith (_65_25034)))
end))

let rec argTypes = (fun ( t ) -> (match (t) with
| Microsoft_FStar_Backends_ML_Syntax.MLTY_Fun ((a, _, b)) -> begin
(let _65_25037 = (argTypes b)
in (a)::_65_25037)
end
| _ -> begin
[]
end))

let lident2mlsymbol = (fun ( l ) -> l.Microsoft_FStar_Absyn_Syntax.ident.Microsoft_FStar_Absyn_Syntax.idText)

let totalType_of_comp = (fun ( ft ) -> (match (ft.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Total (ty) -> begin
ty
end
| _ -> begin
(failwith ("expected a total type. constructors of inductive types were assumed to be total"))
end))

let allBindersOfFuntype = (fun ( c ) ( t ) -> (let t = (preProcType c t)
in (match (t.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Typ_fun ((lb, cp)) -> begin
lb
end
| _ -> begin
[]
end)))

let bindersOfFuntype = (fun ( c ) ( n ) ( t ) -> (let t = (preProcType c t)
in (match (t.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Typ_fun ((lb, cp)) -> begin
(let _60_379 = (Support.Microsoft.FStar.Util.first_N n lb)
in (match (_60_379) with
| (ll, lr) -> begin
(match ((Support.List.isEmpty lr)) with
| true -> begin
(let _65_25052 = (totalType_of_comp cp)
in (ll, _65_25052))
end
| false -> begin
(let _65_25053 = (Microsoft_FStar_Backends_ML_Util.mkTypFun lr cp t)
in (ll, _65_25053))
end)
end))
end
| _ -> begin
(let _60_382 = ()
in ([], t))
end)))

let rec zipUnequal = (fun ( la ) ( lb ) -> (match ((la, lb)) with
| (ha::ta, hb::tb) -> begin
(let _65_25058 = (zipUnequal ta tb)
in ((ha, hb))::_65_25058)
end
| _ -> begin
[]
end))

let mlTyIdentOfBinder = (fun ( b ) -> (Microsoft_FStar_Backends_ML_Env.prependTick (Microsoft_FStar_Backends_ML_Env.convIdent (binderPPnames b))))

let extractCtor = (fun ( tyBinders ) ( c ) ( ctor ) -> (let _60_403 = (bindersOfFuntype c (Support.List.length tyBinders) ctor.ctype)
in (match (_60_403) with
| (lb, tr) -> begin
(let _60_404 = ()
in (let lp = (Support.List.zip tyBinders lb)
in (let newC = (let _65_25068 = (Support.List.map (fun ( _60_409 ) -> (match (_60_409) with
| (x, y) -> begin
((Support.Prims.fst x), (Support.Prims.fst y))
end)) lp)
in (extendContextWithRepAsTyVars _65_25068 c))
in (let mlt = (extractTyp newC tr)
in (let tys = (let _65_25069 = (Support.List.map mlTyIdentOfBinder tyBinders)
in (_65_25069, mlt))
in (let fvv = (Microsoft_FStar_Backends_ML_Env.mkFvvar ctor.cname ctor.ctype)
in (let _65_25072 = (Microsoft_FStar_Backends_ML_Env.extend_fv c fvv tys false)
in (let _65_25071 = (let _65_25070 = (argTypes mlt)
in ((lident2mlsymbol ctor.cname), _65_25070))
in (_65_25072, _65_25071)))))))))
end)))

let dummyIdent = (fun ( n ) -> (let _65_25076 = (let _65_25075 = (Support.Microsoft.FStar.Util.string_of_int n)
in (Support.String.strcat "\'dummyV" _65_25075))
in (_65_25076, 0)))

let rec firstNNats = (fun ( n ) -> (match ((0 < n)) with
| true -> begin
(let _65_25079 = (firstNNats (n - 1))
in (n)::_65_25079)
end
| false -> begin
[]
end))

let dummyIndexIdents = (fun ( n ) -> (let _65_25082 = (firstNNats n)
in (Support.List.map dummyIdent _65_25082)))

let extractInductive = (fun ( c ) ( ind ) -> (let newContext = c
in (let nIndices = (numIndices ind.k ind.tyName.Microsoft_FStar_Absyn_Syntax.ident.Microsoft_FStar_Absyn_Syntax.idText)
in (let _60_423 = (Support.Microsoft.FStar.Util.fold_map (extractCtor ind.tyBinders) newContext ind.constructors)
in (match (_60_423) with
| (nc, tyb) -> begin
(let mlbs = (let _65_25088 = (Support.List.map mlTyIdentOfBinder ind.tyBinders)
in (let _65_25087 = (dummyIndexIdents nIndices)
in (Support.List.append _65_25088 _65_25087)))
in (let tbody = (match ((Support.Microsoft.FStar.Util.find_opt (fun ( _60_1 ) -> (match (_60_1) with
| Microsoft_FStar_Absyn_Syntax.RecordType (_) -> begin
true
end
| _ -> begin
false
end)) ind.qualifiers)) with
| Some (Microsoft_FStar_Absyn_Syntax.RecordType (ids)) -> begin
(let _60_434 = ()
in (let _60_439 = (Support.List.hd tyb)
in (match (_60_439) with
| (_, c_ty) -> begin
(let _60_440 = ()
in (let fields = (Support.List.map2 (fun ( lid ) ( ty ) -> (lid.Microsoft_FStar_Absyn_Syntax.ident.Microsoft_FStar_Absyn_Syntax.idText, ty)) ids c_ty)
in Microsoft_FStar_Backends_ML_Syntax.MLTD_Record (fields)))
end)))
end
| _ -> begin
Microsoft_FStar_Backends_ML_Syntax.MLTD_DType (tyb)
end)
in (nc, ((lident2mlsymbol ind.tyName), mlbs, Some (tbody)))))
end)))))

let mfst = (fun ( x ) -> (Support.List.map Support.Prims.fst x))

let rec headBinders = (fun ( c ) ( t ) -> (let t = (preProcType c t)
in (match (t.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Typ_lam ((bs, t)) -> begin
(let _60_459 = (let _65_25098 = (let _65_25097 = (mfst bs)
in (extendContext c _65_25097))
in (headBinders _65_25098 t))
in (match (_60_459) with
| (c, rb, rresidualType) -> begin
(c, (Support.List.append bs rb), rresidualType)
end))
end
| _ -> begin
(c, [], t)
end)))

let extractTypeAbbrev = (fun ( c ) ( tyab ) -> (let bs = tyab.abTyBinders
in (let t = tyab.abBody
in (let l = tyab.abTyName
in (let c = (let _65_25103 = (mfst bs)
in (extendContext c _65_25103))
in (let _60_471 = (headBinders c t)
in (match (_60_471) with
| (c, headBinders, residualType) -> begin
(let bs = (Support.List.append bs headBinders)
in (let t = residualType
in (let tyDecBody = (let _65_25104 = (extractTyp c t)
in Microsoft_FStar_Backends_ML_Syntax.MLTD_Abbrev (_65_25104))
in (let td = (let _65_25105 = (Support.List.map mlTyIdentOfBinder bs)
in ((mlsymbolOfLident l), _65_25105, Some (tyDecBody)))
in (let c = (Microsoft_FStar_Backends_ML_Env.extend_tydef c ((td)::[]))
in (c, td))))))
end)))))))

let extractExn = (fun ( c ) ( exnConstr ) -> (let mlt = (extractTyp c exnConstr.ctype)
in (let tys = ([], mlt)
in (let fvv = (Microsoft_FStar_Backends_ML_Env.mkFvvar exnConstr.cname exnConstr.ctype)
in (let ex_decl = (let _65_25111 = (let _65_25110 = (argTypes mlt)
in ((lident2mlsymbol exnConstr.cname), _65_25110))
in Microsoft_FStar_Backends_ML_Syntax.MLM_Exn (_65_25111))
in (let _65_25112 = (Microsoft_FStar_Backends_ML_Env.extend_fv c fvv tys false)
in (_65_25112, ex_decl)))))))

let rec extractSigElt = (fun ( c ) ( s ) -> (match (s) with
| Microsoft_FStar_Absyn_Syntax.Sig_typ_abbrev ((l, bs, _, t, _, _)) -> begin
(let _60_498 = (extractTypeAbbrev c {abTyName = l; abTyBinders = bs; abBody = t})
in (match (_60_498) with
| (c, tds) -> begin
(c, (Microsoft_FStar_Backends_ML_Syntax.MLM_Ty ((tds)::[]))::[])
end))
end
| Microsoft_FStar_Absyn_Syntax.Sig_bundle ((sigs, Microsoft_FStar_Absyn_Syntax.ExceptionConstructor::[], _, _)) -> begin
(let _60_513 = (parseInductiveTypesFromSigBundle c sigs)
in (match (_60_513) with
| (_, _, exConstrs) -> begin
(let _60_514 = ()
in (let _60_518 = (let _65_25117 = (Support.List.hd exConstrs)
in (extractExn c _65_25117))
in (match (_60_518) with
| (c, exDecl) -> begin
(c, (exDecl)::[])
end)))
end))
end
| Microsoft_FStar_Absyn_Syntax.Sig_bundle ((sigs, _, _, _)) -> begin
(let _60_532 = (parseInductiveTypesFromSigBundle c sigs)
in (match (_60_532) with
| (inds, abbs, _) -> begin
(let _60_535 = (Support.Microsoft.FStar.Util.fold_map extractInductive c inds)
in (match (_60_535) with
| (c, indDecls) -> begin
(let _60_538 = (Support.Microsoft.FStar.Util.fold_map extractTypeAbbrev c abbs)
in (match (_60_538) with
| (c, tyAbDecls) -> begin
(c, (Microsoft_FStar_Backends_ML_Syntax.MLM_Ty ((Support.List.append indDecls tyAbDecls)))::[])
end))
end))
end))
end
| Microsoft_FStar_Absyn_Syntax.Sig_tycon ((_, _, _, _, _, quals, _)) -> begin
(match (((Support.Prims.pipe_right quals (Support.List.contains Microsoft_FStar_Absyn_Syntax.Assumption)) && (not ((Support.Prims.pipe_right quals (Support.Microsoft.FStar.Util.for_some (fun ( _60_2 ) -> (match (_60_2) with
| (Microsoft_FStar_Absyn_Syntax.Projector (_)) | (Microsoft_FStar_Absyn_Syntax.Discriminator (_)) -> begin
true
end
| _ -> begin
false
end)))))))) with
| true -> begin
(extractSigElt c (Microsoft_FStar_Absyn_Syntax.Sig_bundle (((s)::[], (Microsoft_FStar_Absyn_Syntax.Assumption)::[], [], (Microsoft_FStar_Absyn_Util.range_of_sigelt s)))))
end
| false -> begin
(c, [])
end)
end
| _ -> begin
(c, [])
end))




