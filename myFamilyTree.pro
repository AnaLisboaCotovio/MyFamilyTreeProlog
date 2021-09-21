/*----------------------------------------------------------------------------------------|
|                                          Facts                                          |
|-----------------------------------------------------------------------------------------|

|-----------------------------------------------------------------------------------------|
|                                      Female & Male                                      |
|-----------------------------------------------------------------------------------------|
|female(Name)                                                                             |
|male(Name)                                                                               |
|----------------------------------------------------------------------------------------*/
female(me).
female(analúcia).
female(beatriz).
female(catarina).
female(luísa).
female(maria).
female(paula).
female(carla).
female(mónica).
female(olga).
female(susana).
female(rosa).
female(fátima).
female(odete).
female(isaura).
female(esmeralda).
female(anita).
female(bela).
female(olgatiaavó).
female(madalenatiaavó).
female(zureka).
female(carminda).
female(ermínia).
female(emília).
female(olgabisavó).
female(madalena).

male(carlos).
male(salvador).
male(andré).
male(francisco).
male(nuno).
male(josé).
male(carlostio).
male(mário).
male(miguel).
male(antónio).
male(maridorosa).
male(hélder).
male(nini).
male(álvaro).
male(paulo).
male(avôsemnome).
male(aníbal).
male(elídio).
male(antóniobisavô).
male(laurentino).

/*----------------------------------------------------------------------------------------|
|                                       Passed Away                                       |
|-----------------------------------------------------------------------------------------|
|passed_away(Name)                                                                        |
|----------------------------------------------------------------------------------------*/
passed_away(josé).
passed_away(hélder).
passed_away(maridorosa).
passed_away(esmeralda).
passed_away(avôsemnome).
passed_away(aníbal).
passed_away(olgabisavó).
passed_away(elídio).
passed_away(emília).
passed_away(antóniobisavô).
passed_away(ermínia).
passed_away(laurentino).
passed_away(carminda).

/*----------------------------------------------------------------------------------------|
|                                      Blood Parents                                      |
|-----------------------------------------------------------------------------------------|
|blood_parents(Parent, Kid)                                          blood related parents|
|----------------------------------------------------------------------------------------*/
blood_parents(analúcia, me).
blood_parents(carlos, me).
blood_parents(mário, beatriz).
blood_parents(luísa, beatriz).
blood_parents(paula, catarina).
blood_parents(miguel, catarina).
blood_parents(nuno, salvador).
blood_parents(carla, salvador).
blood_parents(josé, andré).
blood_parents(olga, andré).
blood_parents(olga, francisco).
blood_parents(carlostio, francisco).
blood_parents(fátima, nuno).
blood_parents(fátima, olga).
blood_parents(hélder, nuno).
blood_parents(hélder, olga).
blood_parents(hélder, analúcia).
blood_parents(rosa, analúcia).
blood_parents(rosa, susana).
blood_parents(maridorosa, susana).
blood_parents(antónio, carlos).
blood_parents(antónio, mário).
blood_parents(antónio, paula).
blood_parents(odete, carlos).
blood_parents(odete, mário).
blood_parents(odete, paula).
blood_parents(aníbal, nini).
blood_parents(madelena, nini).
blood_parents(aníbal, hélder).
blood_parents(olgabisavó, hélder).
blood_parents(zureka, rosa).
blood_parents(zureka, madalenatiaavó).
blood_parents(zureka, álvaro).
blood_parents(zureka, olgatiaavó).
blood_parents(avôsemnome, madalenatiaavó).
blood_parents(avôsemnome, rosa).
blood_parents(avôsemnome, álvaro).
blood_parents(avôsemnome, olgatiaavó).
blood_parents(antóniobisavô, bela).
blood_parents(antóniobisavô, antónio).
blood_parents(antóniobisavô, paulo).
blood_parents(antóniobisavô, anita).
blood_parents(ermínia, bela).
blood_parents(ermínia, antónio).
blood_parents(ermínia, paulo).
blood_parents(ermínia, anita).
blood_parents(laurentino, odete).
blood_parents(laurentino, isaura).
blood_parents(laurentino, esmeralda).
blood_parents(carminda, odete).
blood_parents(carminda, isaura).
blood_parents(carminda, esmeralda).

/*----------------------------------------------------------------------------------------|
|                                         Adopted                                         |
|-----------------------------------------------------------------------------------------|
|adoptive_parents(Parent, Kid)                                                            |
|----------------------------------------------------------------------------------------*/
adoptive_parents(emília, analúcia).
adoptive_parents(elídio, analúcia).

/*----------------------------------------------------------------------------------------|
|                                         Married                                         |
|-----------------------------------------------------------------------------------------|
|married(Lady, Gentleman)                                                                 |
|----------------------------------------------------------------------------------------*/
together(paula, miguel).
together(maria, mário).
together(mónica, nuno).
together(odete, antónio).
together(rosa, maridorosa).
together(fátima, hélder).
together(zureka, avôsemnome).
together(carminda, laurentino).
together(erminia, antóniobisavô).
together(emília, elídio).
together(madalena, aníbal).





/*----------------------------------------------------------------------------------------|
|                                          Rules                                          |
|-----------------------------------------------------------------------------------------|
 
|-----------------------------------------------------------------------------------------|
|                                                                                         |
|                                      PARENTS RULES                                      |
|                                                                                         |
|-----------------------------------------------------------------------------------------|
|-----------------------------------------------------------------------------------------|
| Blood Related Parents (BMom, BDad)                                                      |
|----------------------------------------------------------------------------------------*/
/* Female blood related parent*/
blood_mother(BMom, Kid) :- blood_parents(BMom, Kid), female(BMom).
/* Male blood related parent*/
blood_father(BDad, Kid) :- blood_parents(BDad, Kid), male(BDad).

/*----------------------------------------------------------------------------------------|
| Step Parents (SMom, SDad, SPar)                                                         |
|-----------------------------------------------------------------------------------------|
|                                                                  Married to one's parent|
|----------------------------------------------------------------------------------------*/
/* Female step-parent */
step_mother(SMom, Kid) :- blood_mother(BMom, Kid), blood_father(BDad, Kid),
                          together(SMom, BDad), BMom \= SMom.
/* Male step-parent */                          
step_father(SDad, Kid) :- blood_mother(BMom, Kid), blood_father(BDad, Kid),
                          together(BMom, SDad), BDad \= SDad.
/* All step-parents */
step_parents(SPar, Kid) :- step_mother(SPar, Kid).
step_parents(SPar, Kid) :- step_father(SPar, Kid).

/*----------------------------------------------------------------------------------------|
| Adoptive Parents (AMom, ADad, APar)                                                     |
|-----------------------------------------------------------------------------------------|
|                                                                 One that adopted a child|
|----------------------------------------------------------------------------------------*/
/* Female adoptive parent */
adoptive_mother(AMom, Kid) :- adoptive_parent(AMom, Kid), female(AMom).
/* Male adoptive parent */
adoptive_father(ADad, Kid) :- adoptive_parent(ADad, Kid), male(ADad).

/*----------------------------------------------------------------------------------------|
| All Parents (Par, Mom, Dad)                                                             |
|-----------------------------------------------------------------------------------------|
|                                 Blood related parents, Step-parents and Adoptive parents|
|----------------------------------------------------------------------------------------*/
/* all parents */
all_parents(Par, Kid) :- blood_parents(Par, Kid).
all_parents(Par, Kid) :- step_parents(Par, Kid).
all_parents(Par, Kid) :- adoptive_parents(Par, Kid).
/* all mothers */
all_mothers(Mom, Kid) :- all_parents(Mom, Kid), female(Mom).
/* all fathers */
all_fathers(Dad, Kid) :- all_parents(Dad, Kid), male(Dad).

/*----------------------------------------------------------------------------------------|
| No Blood Related Parents (NBP, NBM, NBD)                                                |
|-----------------------------------------------------------------------------------------|
|                                                        Step-parents and Adoptive parents|
|----------------------------------------------------------------------------------------*/
/* No blood related parents */
no_blood_parents(NBP, Kid) :- step_parents(NBP, Kid).
no_blood_parents(NBP, Kid) :- adoptive_parents(NBP, Kid).
/* No blood related mother */
no_blood__mothers(NBM, Kid) :- no_blood_parents(NBM, Kid), female(NBM).
/* No blood related father */
no_blood__fathers(NBD, Kid) :- no_blood_parents(NBD, Kid), male(NBD).





/*----------------------------------------------------------------------------------------|
|                                                                                         |
|                                     CHILDREN RULES                                      |
|                                                                                         |
|-----------------------------------------------------------------------------------------|
|-----------------------------------------------------------------------------------------|
| Blood Related Children (BDau, BSon)                                                     |
|-----------------------------------------------------------------------------------------|
|                                                                   Blood related children|
|----------------------------------------------------------------------------------------*/
/* Female blood related children */
blood_daughter(BDau, Par) :- blood_parents(Par, BDau), female(BDau).
/* Male blood related children */
blood_son(BSon, Par) :- blood_parents(Par, BSon), male(BSon).

/*----------------------------------------------------------------------------------------|
| Step-Children (SDau, SSon)                                                              |
|-----------------------------------------------------------------------------------------|
|                                                                  Child of a love partner|
|----------------------------------------------------------------------------------------*/
/* Female step-children */
step_daughter(SDau, Par) :- step_parents(Par, SDau), female(SDau).
/* Male step-children */
step_son(SSon, Par) :- step_parents(Par, SSon), male(SSon).

/*----------------------------------------------------------------------------------------|
| Adoptive Children (ADau, ASon)                                                          |
|-----------------------------------------------------------------------------------------|
|                                                                   Child that was adopted|
|----------------------------------------------------------------------------------------*/
/* Female adoptive children */
adoptive_daughter(ADau, Par) :- adoptive_parents(Par, ADau), female(ADau).
/* Male adoptive children */
adoptive_son(ASon, Par) :- adoptive_parents(Par, ASon), male(ASon).

/*----------------------------------------------------------------------------------------|
| All Children (Dau, Son)                                                                 |
|-----------------------------------------------------------------------------------------|
|                              Blood related children, step-children and adoptive children|
|----------------------------------------------------------------------------------------*/
/* Female all children */
all_daughters(Dau, Par) :- all_parents(Par, Dau), female(Dau).
/* Male all children */
all_sons(Son, Par) :- all_parents(Par, Son), male(Son).

/*----------------------------------------------------------------------------------------|
| No Blood Related Children (NBDau, NBSon)                                                |
|-----------------------------------------------------------------------------------------|
|                                                      Step-children and adoptive children|
|----------------------------------------------------------------------------------------*/
/* Female No blood related children */
no_blood_daughters(NBDau, Par) :- no_blood_parents(Par, NBDau), female(NBDau).
/* Male No blood related children */
no_blood_sons(NBSon, Par) :- no_blood_parents(Par, NBSon), male(NBSon).





/*----------------------------------------------------------------------------------------|
|                                                                                         |
|                                     SIBLINGS RULES                                      |
|                                                                                         |
|-----------------------------------------------------------------------------------------|
|-----------------------------------------------------------------------------------------|
| Blood Related Siblings (BSib, BSis, BBro)                                               |
|-----------------------------------------------------------------------------------------|
|                                                             Children of the same parents|
|----------------------------------------------------------------------------------------*/
/* Blood related siblings */
blood_siblings(BSib, Sib) :- blood_mother(Mom, BSib), blood_mother(Mom, Sib), 
                             blood_father(Dad, BSib), blood_father(Dad, Sib),
                             BSib \= Sib.
/* Female blood related siblings */
blood_sister(BSis, Sib) :- blood_siblings(BSis, Sib), female(BSis).
/* Male blood related siblings */
blood_brother(BBro, Sib) :- blood_siblings(BBro, Sib), male(BBro).

/*----------------------------------------------------------------------------------------|
| Step-Siblings (SSib, SSis, SBro)                                                        |
|-----------------------------------------------------------------------------------------|
|                                                    Children of only one parent in common|
|----------------------------------------------------------------------------------------*/
/* Step-siblings */
step_siblings(SSib, Sib) :- father(Dad, SSib), father(Dad, Sib), 
                            mother(Mom1, SSib), mother(Mom2, Sib), 
                            Mom1 \= Mom2.
step_siblings(SSib, Sib) :- father(Dad1, SSib), father(Dad2, Sib), 
                            mother(Mom, SSib), mother(Mom, Sib), 
                            Dad1 \= Dad2.
/* Female step-siblings */
step_sister(SSis, Sib) :- step_siblings(SSis, Sib), female(SSis).
/* Male step-siblings */
step_brother(SBro, Sib) :- step_siblings(SBro, Sib), male(SBro).

/*----------------------------------------------------------------------------------------|
| All Siblings (SSib, SSis, SBro)                                                         |
|-----------------------------------------------------------------------------------------|
|                                                 blood related siblings and step-siblings|
|----------------------------------------------------------------------------------------*/
/* All siblings */
all_siblings(ASib, Sib) :- blood_siblings(ASib, Sib).
all_siblings(ASib, Sib) :- step_siblings(ASib, Sib).
/* All female siblings */
all_sisters(ASis, Sib) :- all_siblings(ASis, Sib), female(ASis).
/* All male siblings */
all_brothers(ABro, Sib) :- all_siblings(ABro, Sib), male(ABro).





/*----------------------------------------------------------------------------------------|
|                                                                                         |
|                                  AUNTS AND UNCLES RULES                                 |
|                                                                                         |
|-----------------------------------------------------------------------------------------|
|-----------------------------------------------------------------------------------------|
| Aunts and Uncles Siblings of Parents (PAUn, PAu, PUn)                                   |
|-----------------------------------------------------------------------------------------|
|                                 All types of  siblings of 1 of the parents of that child|
|----------------------------------------------------------------------------------------*/
/* Parent related aunts and uncles */
parents_aunts_uncles(PAUn, Kid) :- all_siblings(PAUn, Par), all_parents(Par, Kid).
/* Female parent related aunts and uncles */
parents_aunt(PAu, Kid) :- parents_aunts_uncles(PAu, Kid), female(PAu).
/* Male parent related aunts and uncles */
parents_uncle(PUn, Kid) :- parents_aunts_uncles(PUn, Kid), male(PUn).

/*----------------------------------------------------------------------------------------|
| Aunts and Ucnles Together with Parents' Siblings (TAUn, TAu, TUn)                       |
|-----------------------------------------------------------------------------------------|
|         Aunts and Uncles that are together with uncles and aunts siblings of the parents|
|----------------------------------------------------------------------------------------*/
/* Aunts and Uncles together with uncles and aunts */
together_aunts_uncles(TAUn, Kid) :- parents_aunts_uncles(AuUn, Kid), together(TAUn, AuUn).
together_aunts_uncles(TAUn, Kid) :- parents_aunts_uncles(AuUn, Kid), together(AuUn, TAUn).
/* Female aunts and Uncles together with uncles and aunts */
together_aunt(TAu, Kid) :- together_aunts_uncles(TAu, Kid), female(TAu).
/* Male aunts and Uncles together with uncles and aunts */
together_uncle(TUn, Kid) :- together_aunts_uncles(TUn, Kid), male(TUn).

/*----------------------------------------------------------------------------------------|
| Cousins Aunts and Uncles(CAUn, CAu, CUn)                                                |
|-----------------------------------------------------------------------------------------|
|                                        Aunts and Uncles that are only parents of cousins|
|----------------------------------------------------------------------------------------*/
/* Cousins aunts and uncles */
cousins_aunts_uncles(CAUn, Kid) :- blood_parents(CAUn, Cous), blood_parents(PAUn, Cous),
                                   CAUn \= PAUn, not(together(CAUn, PAUn)), 
                                   all_siblings(PAUn, Par), blood_parents(Par, Kid).
cousins_aunts_uncles(CAUn, Kid) :- blood_parents(CAUn, Cous), blood_parents(PAUn, Cous),
                                   CAUn \= PAUn, not(together(PAUn, CAUn)), 
                                   all_siblings(PAUn, Par), blood_parents(Par, Kid).
/* Female cousins aunts and uncles */
cousins_aunt(CAu, Kid) :- cousins_aunts_uncles(CAu, Kid), female(CAu).
/* Male cousins aunts and uncles */
cousins_uncle(CUn, Kid) :- cousins_aunts_uncles(CUn, Kid), male(CUn).

/*----------------------------------------------------------------------------------------|
| No Blood Related Aunts and Uncles (NBAU, NBAu, NBUn)                                    |
|-----------------------------------------------------------------------------------------|
|                                                    together and cousins aunts and uncles|
|----------------------------------------------------------------------------------------*/
/* No blood related aunts and uncles */
no_blood_aunts_uncles(NBAU, Kid) :- together_aunts_uncles(NBAU, Kid).
no_blood_aunts_uncles(NBAU, Kid) :- cousins_aunts_uncles(NBAU, Kid).
/* Female no blood related aunts and uncles */
no_blood_aunts(NBAu, Kid) :- no_blood_aunts_uncles(NBAu, Kid), female(NBAu).
/* Male no blood related aunts and uncles */
no_blood_uncles(NBUn, Kid) :- no_blood_aunts_uncles(NBUn, Kid), male(NBUn).

/*----------------------------------------------------------------------------------------|
| All Aunts and Uncles (AuUn, AAu, AUn)                                                   |
|-----------------------------------------------------------------------------------------|
|                                     blood related, together and cousins aunts and uncles|
|----------------------------------------------------------------------------------------*/
/* All aunts and uncles */
all_aunts_uncles(AuUn, Kid) :- no_blood_aunts_uncles(AuUn, Kid), 
                               parents_aunts_uncles(AuUn, Kid).
/* All female aunts and uncles */
all_aunts(Aau, Kid) :- all_aunts_uncles(Aau, Kid), female(Aau).
/* All male aunts and uncles */
all_uncles(AUn, Kid) :- all_aunts_uncles(AUn, Kid), male(AUn).





/*----------------------------------------------------------------------------------------|
|                                                                                         |
|                                      NIBLINGS RULES                                     |
|                                                                                         |
|-----------------------------------------------------------------------------------------|
|-----------------------------------------------------------------------------------------|
| Niblings from Siblings Children (SNie, SNep)                                            |
|-----------------------------------------------------------------------------------------|
|                                                      Niblings that are Siblings Children|
|----------------------------------------------------------------------------------------*/
/* Female niblings from siblings */
sibling_niece(SNie, AuUn) :- parent_aunts_uncles(AuUn, SNie), female(SNie).
/* Male niblings from siblings */
sibling_nephew(SNep, AuUn) :- parent_aunts_uncles(AuUn, SNep), male(SNep).

/*----------------------------------------------------------------------------------------|
| Niblings from Partner (PNie, PNep)                                                      |
|-----------------------------------------------------------------------------------------|
|                                                    Niblings that are niblings of partner|
|----------------------------------------------------------------------------------------*/
/* Female niblings from partner */
partner_niece(PNie, AuUn) :- together_aunts_uncles(AuUn, PNie), female(PNie).
/* Male niblings from partner */
partner_nephew(PNep, AuUn) :- together_aunts_uncles(AuUn, PNep), male(PNep).

/*----------------------------------------------------------------------------------------|
| Niblings from Children (CNie, CNep)                                                     |
|-----------------------------------------------------------------------------------------|
|                                           Niblings from beings cousins of their children|
|----------------------------------------------------------------------------------------*/
/* Female niblings from children */
children_niece(CNie, AuUn) :- cousins_aunts_uncles(AuUn, CNie), female(CNie).
/* Male niblings from children */
children_nephew(CNep, AuUn) :- cousins_aunts_uncles(AuUn, CNep), male(CNep).

/*----------------------------------------------------------------------------------------|
| All Niblings (Nie, Nep)                                                                 |
|-----------------------------------------------------------------------------------------|
|                            Niblings from siblings,  partner and cousin of their children|
|----------------------------------------------------------------------------------------*/
/* All female niblings */
all_nieces(Nie, AuUn) :- all_aunts_uncles(AuUn, Nie), female(Nie).
/* All male niblings */
all_nephews(Nep, AuUn) :- all_aunts_uncles(AuUn, Nep), male(Nep).





/*----------------------------------------------------------------------------------------|
|                                                                                         |
|                                   GRANDPARENTS RULES                                    |
|                                                                                         |
|-----------------------------------------------------------------------------------------|
|-----------------------------------------------------------------------------------------|
| Grand-Parents (GPar, GMom, GDad)                                                        |
|-----------------------------------------------------------------------------------------|
|                                                                       Parents of parents|
|----------------------------------------------------------------------------------------*/
/* All parents' parents */
grand_parents(GPar, GChi) :- all_parents(GPar, Par), all_parents(Par, GChi).
/* Female parents' parents */
grand_mother(GMom, GChi) :- all_mothers(GMom, Par), all_parents(Par, GChi).
/* Male parents' parents */
grand_father(GDad, GChi) :- all_fathers(GDad, Par), all_parents(Par, GDad).

/*----------------------------------------------------------------------------------------|
| Grand-Children (GDau, GSon)                                                             |
|-----------------------------------------------------------------------------------------|
|                                                               Children of their children|
|----------------------------------------------------------------------------------------*/
/* All female grand-children */
grand_daughters(GDau, GPar) :- grand_parents(GPar, GDau), female(GDau).
/* All male grand-children */
grand_son(GSon, GPar) :- grand_parents(GPar, GSon), male(GSon).





/*----------------------------------------------------------------------------------------|
|                                                                                         |
|                  GREAT-AUNTS', GREAT-UNCLES' AND GREAT-NIBLINGS' RULES                  |
|                                                                                         |
|-----------------------------------------------------------------------------------------|
|-----------------------------------------------------------------------------------------|
| Grand-Aunts and Great-Uncles (GAU, GAu, GUn)                                            |
|-----------------------------------------------------------------------------------------|
|                                                            Siblings of the grand-parents|
|----------------------------------------------------------------------------------------*/
/* All great-aunts and great-uncles */
great_aunts_uncles(GAU, GNib) :- grand_parents(GPar, GNib), all_siblings(GAU, GPar).
/* Female great-aunts and great-uncles */
great_aunts(GAu, GNib) :- great_aunts_uncles(GAu, GNib), female(GAu).
/* Male great-aunts and great-uncles */
great_uncles(GUn, GNib) :- great_aunts_uncles(GUn, GNib), male(GUn).

/*----------------------------------------------------------------------------------------|
| Great-Niblings (GNi, GNe)                                                               |
|-----------------------------------------------------------------------------------------|
|                                                                     Children of niblings|
|----------------------------------------------------------------------------------------*/
/* All female great-niblings */
great-niece(GNi, GAU) :- great_aunts_uncles(GAU, GNi), female(GNi).
/* All male great-niblings */
great-nephew(GNe, GAU) :- great_aunts_uncles(GAU, GNe), male(GNe).





/*----------------------------------------------------------------------------------------|
|                                                                                         |
|                   GREAT-GRAND-PARENTS' AND GREAT-GRAND-CHILDREN' RULES                  |
|                                                                                         |
|-----------------------------------------------------------------------------------------|
|-----------------------------------------------------------------------------------------|
| Great-Grand-Parents (GGP, GGM, GGF)                                                     |
|-----------------------------------------------------------------------------------------|
|                                                                 Parents of grand-parents|
|----------------------------------------------------------------------------------------*/
/* All great-grand-parents */
great_grand_parents(GGP, GGC) :- all_parents(GGP, Par), all_parents(Par, GGC).
/* Female great-grand-parents */
great_grand_mother(GGM, GGC) :- great_grand_parents(GGM, GGC), female(GGM).
/* Male great-grand-parents */
great_grand_father(GGF, GGC) :- great_grand_parents(GGF, GGC), male(GGF).

/*----------------------------------------------------------------------------------------|
| Great-Grand-Children (GGD, GGS)                                                         |
|-----------------------------------------------------------------------------------------|
|                                                                     Children of children|
|----------------------------------------------------------------------------------------*/
/* All female great-grand-children */
great_grand_daughter(GGD, GGP) :- great_grand_parents(GGP, GGD), female(GGD).
/* All male great-grand-children */
great_grand_son(GGS, GGP) :- great_grand_parents(GGP, GGS), male(GGS).





/*----------------------------------------------------------------------------------------|
|                                                                                         |
|                                 LOVE RELATIONSHIPS' RULES                               |
|                                                                                         |
|-----------------------------------------------------------------------------------------|
|-----------------------------------------------------------------------------------------|
| Exes and Widowed Lovers (ExL, Wid)                                                      |
|-----------------------------------------------------------------------------------------|
|                              People that are not together now, but have a child together|
|                                    People that are not together, because one of the died|
|----------------------------------------------------------------------------------------*/
/* Live separation - exes */
exes(ExL, ExG) :- not(together(ExL, ExG)), blood_parents(ExL, Kid), 
                  blood_parents(ExG, Kid), ExL \= ExG, female(ExL), male(ExG).
exes(ExL, ExG) :- not(together(ExL, ExG)), adoptive_parents(ExL, Kid), 
                  adoptive_parents(ExG, Kid), ExL \= ExG, female(ExL), male(ExG).
/* Death separation - widow */
widow(Wid, PsA) :- together(Wid, PsA), passed_away(PsA).




/*----------------------------------------------------------------------------------------|
|                                                                                         |
|                                       IN LAWS' RULES                                    |
|                                                                                         |
|-----------------------------------------------------------------------------------------|
|-----------------------------------------------------------------------------------------|
| Siblings-In-Law (SiL, SsL, BiL)                                                         |
|-----------------------------------------------------------------------------------------|
|                                                     Love relationship with one's sibling|
|----------------------------------------------------------------------------------------*/
/* All siblings-in-law */
siblings_in_law(SiL, Sib) :- all_siblings(Sib, Per), together(Per, SiL).
siblings_in_law(SiL, Sib) :- all_siblings(Sib, Per), together(SiL, Per).
/* Female siblings-in-law */
sister_in_law(SsL, Sib) :- sibling_in_law(SsL, Sib), female(SsL).
/* Male siblings-in-law */
brother_in_law(BiL, Sib) :- sibling_in_law(BiL, Sib), male(BiL).

/*----------------------------------------------------------------------------------------|
| Parents-In-Law (PiL, MiL, FiL)                                                          |
|-----------------------------------------------------------------------------------------|
|                                                              Parents of the love partner|
|----------------------------------------------------------------------------------------*/
/* All parents-in-law */
parents_in_law(PiL, Kid) :- together(Kid, Chi), all_parents(PiL, Chi).
parents_in_law(PiL, Kid) :- together(Chi, Kid), all_parents(PiL, Chi).
/* Female parents-in-law */
mother_in_law(MiL, Kid) :- parents_in_law(MiL, Kid), female(MiL).
/* Male parents-in-law */
father_in_law(FiL, Kid) :- parents_in_law(FiL, Kid), male(FiL).

/*----------------------------------------------------------------------------------------|
| Children-In-Law (DiL, SiL)                                                              |
|-----------------------------------------------------------------------------------------|
|                                                                Love partners of children|
|----------------------------------------------------------------------------------------*/
/* Female children-in-law */
daughter_in_law(DiL, PiL) :- parents_in_law(PiL, DiL), female(DiL).
/* Male children-in-law */
son_in_law(SiL, PiL) :- parents_in_law(PiL, SiL), male(SiL).





/*----------------------------------------------------------------------------------------|
|                                                                                         |
|                                          EXTRA RULES                                    |
|                                                                                         |
|-----------------------------------------------------------------------------------------|
|-----------------------------------------------------------------------------------------|
| Descendants/Ascendants and Single-Children (Des, SChi)                                  |
|-----------------------------------------------------------------------------------------|
|                                             Recursiveness of parenthood and not siblings|
|----------------------------------------------------------------------------------------*/
/* Descendants and Ascendants */
descendant(Des, Anc) :- parent(Anc, Des).
descendant(Des, Anc) :- parent(Anc, Per), descendant(Des, Per).
/* Single-Children */
single_child(SChi) :- not(all_siblings(SChi)).





