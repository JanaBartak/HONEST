# 0. Set work directory ----
> setwd("/Volumes/research$/HONEST Team/Data/aim_1_processed_data/")
> # 1. Load data ----
> load("01_clean_raw_data.RData")

> ### NEW ma_funktion.f ----
> personal$ma_funktion.f <- as.factor(personal$MA_FUNKTION)
> levels(personal$ma_funktion.f)<-c("AChef","ALeitung","ASpital","AOber","AAss","AUnterA","PDiplS","PDipl","PSekII","PAss","PSonst","Hebamme","MTTechOP","MTRadio","MTBiomedA","MTMTSekII","MTRettung","MTTransport","MTAkadPers","MTPPhysio","MTPErgo","MTPErnährung","MTPLogo","MTPAktivierung","MTPPsychol","MTPMasseur","MTPSekII","MTPAndere","AndereSozial","AndereHaus","AndereTechnik","AndereAdmin","ExtArzt","ExtHebamme","ExtMedPers")
> personal_test <- personal[personal$ma_ende_jahr.f %in% c("Yes"), ]
> ### NEW ma_ende_jahr.f ----
> # changing 1 and 2 in yes, no
  > personal$ma_ende_jahr.f <- NA
  > personal$ma_ende_jahr.f  [personal$MA_ENDE_JAHR %in% "1"] <- "Yes"
  > personal$ma_ende_jahr.f [personal$MA_ENDE_JAHR %in% "2"] <- "No"
  > personal$ma_ende_jahr.f <- as.factor(personal$ma_ende_jahr.f)
  > personal_test <- personal[personal$ma_ende_jahr.f %in% c("Yes"), ]
  > table(personal_test$MA_FUNKTION)
  
  1      2      3      4      5      6      7      8      9     10     11     12     13 
  12536  31968   8609  51062  83365  11057 108275 316182  76073  46023  58191  18983  18003 
  14     15     16     17     18     19     20     21     22     23     24     25     26 
  26645  24439  20057   9681   1501  18545  33623  10166   5879   3298   3581  24332   1652 
  27     28     29     30     31     32 
  5354  18516 167195  35609 231943   3764 
  > table(personal_test$ma_funktion.f)
  
  AChef       ALeitung        ASpital          AOber           AAss        AUnterA 
  12536          31968           8609          51062          83365          11057 
  PDiplS          PDipl         PSekII           PAss         PSonst        Hebamme 
  108275         316182          76073          46023          58191          18983 
  MTTechOP        MTRadio      MTBiomedA      MTMTSekII      MTRettung    MTTransport 
  18003          26645          24439          20057           9681           1501 
  MTAkadPers      MTPPhysio        MTPErgo   MTPErnährung        MTPLogo MTPAktivierung 
  18545          33623          10166           5879           3298           3581 
  MTPPsychol     MTPMasseur       MTPSekII      MTPAndere   AndereSozial     AndereHaus 
  24332           1652           5354          18516         167195          35609 
  AndereTechnik    AndereAdmin        ExtArzt     ExtHebamme     ExtMedPers 
  231943           3764              0              0              0 
  > # 2. Select data of interest - selecting only acute care hospitals (allg, leist, lohn datasets) ----
  > ## 2.1 allg  ----
  > allg_akut <- allg[allg$activity.f %in% c ("Akutpflege"), ]
  > # drop the levels of typologie.f that are not used!
    > allg_akut$typologie.f <- droplevels(allg_akut$typologie.f)
  Error in UseMethod("droplevels") : 
    no applicable method for 'droplevels' applied to an object of class "NULL"
  > # 0. Install/load packages ----
  > # install.packages("tidyverse")
    > # install.packages("table1")
    > library(tidyverse)
  ── Attaching core tidyverse packages ───────────────────────────────────────── tidyverse 2.0.0 ──
  ✔ dplyr     1.1.4     ✔ readr     2.1.5
  ✔ forcats   1.0.0     ✔ stringr   1.5.1
  ✔ ggplot2   3.5.1     ✔ tibble    3.2.1
  ✔ lubridate 1.9.3     ✔ tidyr     1.3.1
  ✔ purrr     1.0.2     
  ── Conflicts ─────────────────────────────────────────────────────────── tidyverse_conflicts() ──
  ✖ dplyr::filter() masks stats::filter()
  ✖ dplyr::lag()    masks stats::lag()
  ℹ Use the conflicted package to force all conflicts to become errors
  > # 2. Select data of interest - selecting only acute care hospitals (allg, leist, lohn datasets) ----
  > ## 2.1 allg  ----
  > allg_akut <- allg[allg$activity.f %in% c ("Akutpflege"), ]
  > # drop the levels of typologie.f that are not used!
    > allg_akut$typologie.f <- droplevels(allg_akut$typologie.f)
  Error in UseMethod("droplevels") : 
    no applicable method for 'droplevels' applied to an object of class "NULL"
  > ### NEW activity.f ----
  > allg$activity.f <- NA
  > allg$activity.f [allg$TYPOL99 %in% 'K111'] <- "Akutpflege"
  > allg$activity.f [allg$TYPOL99 %in% 'K112'] <- "Akutpflege"
  > allg$activity.f [allg$TYPOL99 %in% 'K121'] <- "Akutpflege"
  > allg$activity.f [allg$TYPOL99 %in% 'K122'] <- "Akutpflege"
  > allg$activity.f [allg$TYPOL99 %in% 'K123'] <- "Akutpflege"
  > allg$activity.f [allg$TYPOL99 %in% 'K211'] <- "Psychiatrie"
  > allg$activity.f [allg$TYPOL99 %in% 'K212'] <- "Psychiatrie"
  > allg$activity.f [allg$TYPOL99 %in% 'K221'] <- "Rehabilitation / Geriatrie"
  > allg$activity.f [allg$TYPOL99 %in% 'K231'] <- "Akutpflege"
  > allg$activity.f [allg$TYPOL99 %in% 'K232'] <- "Geburtshaus"
  > allg$activity.f [allg$TYPOL99 %in% 'K233'] <- "Akutpflege"
  > allg$activity.f [allg$TYPOL99 %in% 'K234'] <- "Akutpflege"
  > allg$activity.f [allg$TYPOL99 %in% 'K235'] <- "Akutpflege"
  > # 2. Select data of interest - selecting only acute care hospitals (allg, leist, lohn datasets) ----
  > ## 2.1 allg  ----
  > allg_akut <- allg[allg$activity.f %in% c ("Akutpflege"), ]
  > # drop the levels of typologie.f that are not used!
    > allg_akut$typologie.f <- droplevels(allg_akut$typologie.f)
  Error in UseMethod("droplevels") : 
    no applicable method for 'droplevels' applied to an object of class "NULL"
  > View(allg_akut)
  > personal_test <- left_join(personal_test, allg_akut, by = c("BUR_ALEAT_T", "JAHR"))
  > # choose only personal working in acute care
    > personal_test <- personal_test[personal_test$activity.f %in% c("Akutpflege"), 
                                     + # choose only personal working in acute care
                                       + personal_test <- personal_test[personal_test$activity.f %in% c("Akutpflege"), 
                                                                        + personal_test <- personal_test[personal_test$activity.f %in% c("Akutpflege"),
                                                                                                         + 
                                                                                                           + 
                                                                                                           + 
                                                                                                           + 
                                                                                                           + 
                                                                                                           + 
                                                                                                           > personal_akut <- personal_akut[personal_akut$activity.f %in% c("Akutpflege"), 
                                                                                                                                            + 
                                                                                                                                              > personal_akut <- personal_akut[personal_akut$activity.f %in% c("Akutpflege"),]
                                                                                                                                            Error: object 'personal_akut' not found
                                                                                                                                            > personal_test <- personal_test[personal_test$activity.f %in% c("Akutpflege"),]
                                                                                                                                            > table(personal_test$activity.f)
                                                                                                                                            
                                                                                                                                            Akutpflege 
                                                                                                                                            1263000 
                                                                                                                                            > table(personal_test$ma_funktion.f)
                                                                                                                                            
                                                                                                                                            AChef       ALeitung        ASpital          AOber           AAss        AUnterA 
                                                                                                                                            11053          29726           7535          45053          74658          10481 
                                                                                                                                            PDiplS          PDipl         PSekII           PAss         PSonst        Hebamme 
                                                                                                                                            102189         266342          62915          40881          49006          18159 
                                                                                                                                            MTTechOP        MTRadio      MTBiomedA      MTMTSekII      MTRettung    MTTransport 
                                                                                                                                            17957          26416          23994          18714           9680           1489 
                                                                                                                                            MTAkadPers      MTPPhysio        MTPErgo   MTPErnährung        MTPLogo MTPAktivierung 
                                                                                                                                            16983          24904           5757           5176           1944            809 
                                                                                                                                            MTPPsychol     MTPMasseur       MTPSekII      MTPAndere   AndereSozial     AndereHaus 
                                                                                                                                            8803            506           3032          11293         132087          29970 
                                                                                                                                            AndereTechnik    AndereAdmin        ExtArzt     ExtHebamme     ExtMedPers 
                                                                                                                                            203740           1748              0              0              0 
                                                                                                                                            > group_counts <- table(personal_test$ma_funktion.f)
                                                                                                                                            > 
                                                                                                                                              > group_percentage <- (group_counts / sum(group_counts)) * 100
                                                                                                                                            > group_percentage
                                                                                                                                            
                                                                                                                                            AChef       ALeitung        ASpital          AOber           AAss        AUnterA 
                                                                                                                                            0.87513856     2.35360253     0.59659541     3.56714173     5.91116390     0.82984956 
                                                                                                                                            PDiplS          PDipl         PSekII           PAss         PSonst        Hebamme 
                                                                                                                                            8.09097387    21.08804434     4.98139351     3.23681710     3.88012668     1.43776722 
                                                                                                                                            MTTechOP        MTRadio      MTBiomedA      MTMTSekII      MTRettung    MTTransport 
                                                                                                                                            1.42177356     2.09152811     1.89976247     1.48171021     0.76642914     0.11789390 
                                                                                                                                            MTAkadPers      MTPPhysio        MTPErgo   MTPErnährung        MTPLogo MTPAktivierung 
                                                                                                                                            1.34465558     1.97181314     0.45581948     0.40981789     0.15391924     0.06405384 
                                                                                                                                            MTPPsychol     MTPMasseur       MTPSekII      MTPAndere   AndereSozial     AndereHaus 
                                                                                                                                            0.69699129     0.04006334     0.24006334     0.89414093    10.45819477     2.37292162 
                                                                                                                                            AndereTechnik    AndereAdmin        ExtArzt     ExtHebamme     ExtMedPers 
                                                                                                                                            16.13143310     0.13840063     0.00000000     0.00000000     0.00000000 
                                                                                                                                            > doc_test <- personal_test[personal_test$ma_funktion.f %in% c("AChef", "ALeitung", "ASpital", "AOber", "Aass", "AUnterA"),]
                                                                                                                                            > View(doc_test)
                                                                                                                                            > table(doc_test$ma_funktion.f)
                                                                                                                                            
                                                                                                                                            AChef       ALeitung        ASpital          AOber           AAss        AUnterA 
                                                                                                                                            11053          29726           7535          45053              0          10481 
                                                                                                                                            PDiplS          PDipl         PSekII           PAss         PSonst        Hebamme 
                                                                                                                                            0              0              0              0              0              0 
                                                                                                                                            MTTechOP        MTRadio      MTBiomedA      MTMTSekII      MTRettung    MTTransport 
                                                                                                                                            0              0              0              0              0              0 
                                                                                                                                            MTAkadPers      MTPPhysio        MTPErgo   MTPErnährung        MTPLogo MTPAktivierung 
                                                                                                                                            0              0              0              0              0              0 
                                                                                                                                            MTPPsychol     MTPMasseur       MTPSekII      MTPAndere   AndereSozial     AndereHaus 
                                                                                                                                            0              0              0              0              0              0 
                                                                                                                                            AndereTechnik    AndereAdmin        ExtArzt     ExtHebamme     ExtMedPers 
                                                                                                                                            0              0              0              0              0 
                                                                                                                                            > doc_test <- personal_test[personal_test$ma_funktion.f %in% c("AChef", "ALeitung", "ASpital", "AOber", "AAss", "AUnterA"),]
                                                                                                                                            > table(doc_test$ma_funktion.f)
                                                                                                                                            
                                                                                                                                            AChef       ALeitung        ASpital          AOber           AAss        AUnterA 
                                                                                                                                            11053          29726           7535          45053          74658          10481 
                                                                                                                                            PDiplS          PDipl         PSekII           PAss         PSonst        Hebamme 
                                                                                                                                            0              0              0              0              0              0 
                                                                                                                                            MTTechOP        MTRadio      MTBiomedA      MTMTSekII      MTRettung    MTTransport 
                                                                                                                                            0              0              0              0              0              0 
                                                                                                                                            MTAkadPers      MTPPhysio        MTPErgo   MTPErnährung        MTPLogo MTPAktivierung 
                                                                                                                                            0              0              0              0              0              0 
                                                                                                                                            MTPPsychol     MTPMasseur       MTPSekII      MTPAndere   AndereSozial     AndereHaus 
                                                                                                                                            0              0              0              0              0              0 
                                                                                                                                            AndereTechnik    AndereAdmin        ExtArzt     ExtHebamme     ExtMedPers 
                                                                                                                                            0              0              0              0              0 
                                                                                                                                            > group_counts <- table(doc_test$ma_funktion.f)
                                                                                                                                            > 
                                                                                                                                              > group_counts <- table(doc_test$ma_funktion.f)
                                                                                                                                            > 
                                                                                                                                              > group_percentage <- (group_counts / sum(group_counts)) * 100
                                                                                                                                            > group_percentage
                                                                                                                                            
                                                                                                                                            AChef       ALeitung        ASpital          AOber           AAss        AUnterA 
                                                                                                                                            6.191949      16.652662       4.221147      25.238928      41.823804       5.871511 
                                                                                                                                            PDiplS          PDipl         PSekII           PAss         PSonst        Hebamme 
                                                                                                                                            0.000000       0.000000       0.000000       0.000000       0.000000       0.000000 
                                                                                                                                            MTTechOP        MTRadio      MTBiomedA      MTMTSekII      MTRettung    MTTransport 
                                                                                                                                            0.000000       0.000000       0.000000       0.000000       0.000000       0.000000 
                                                                                                                                            MTAkadPers      MTPPhysio        MTPErgo   MTPErnährung        MTPLogo MTPAktivierung 
                                                                                                                                            0.000000       0.000000       0.000000       0.000000       0.000000       0.000000 
                                                                                                                                            MTPPsychol     MTPMasseur       MTPSekII      MTPAndere   AndereSozial     AndereHaus 
                                                                                                                                            0.000000       0.000000       0.000000       0.000000       0.000000       0.000000 
                                                                                                                                            AndereTechnik    AndereAdmin        ExtArzt     ExtHebamme     ExtMedPers 
                                                                                                                                            0.000000       0.000000       0.000000       0.000000       0.000000 
                                                                                                                                            > 