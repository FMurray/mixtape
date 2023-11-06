#!/usr/bin/env python
import sys
import os
sys.path.append(os.path.abspath(__file__ + '/../../../../dspplot/dspplot'))
sys.path.append(os.path.abspath(__file__ + '/../../../dspplot/dspplot'))
import dspplotting as dspplot

data = [
  0.2156132273375988,
  14.540945294643631,
  63.631047149346116,
  97.306244866374016,
  33.904380642412654,
  21.744309969209485,
  16.356801814081976,
  13.245521381317946,
  11.194947889124574,
   9.724892777161914,
  8.6079541223803151,
  7.7432762278743779,
  7.0348992109080779,
  6.4504868396465609,
   5.960594273503979,
  5.5457387184565725,
  5.1823126354751698,
  4.8665738548493973,
  4.5848444636795405,
  4.3412269962640471,
  4.1229496627395568,
  3.9262961853883209,
  3.7484577937329941,
  3.5892162563970458,
  3.4377503049432101,
  3.3069324280127153,
  3.1672332342740948,
  3.0492308413239928,
  2.9459691371115126,
  2.8489280583296623,
  2.7463938705188795,
  2.6741762846681412,
  2.5939476085958777,
  2.5197389254397544,
  2.4412058957867084,
  2.3785828532823103,
   2.316541642141944,
  2.2601301153853575,
  2.1981221493897589,
   2.151454709014307,
  2.0999859653927828,
  2.0527967507689002,
  2.0059056129228034,
  1.9655398904984556,
  1.9228261701581761,
  1.8858420584244975,
  1.8459159165865711,
  1.8124370191695185,
  1.7772448761750899,
  1.7477937451652903,
  1.7156934896029099,
  1.6880248835192915,
  1.6573651884068621,
  1.6382657404050704,
  1.6025169540579094,
  1.5799042679063426,
  1.5565153141681867,
  1.5354646492196811,
  1.5043917970109046,
  1.4922773764962507,
  1.4695522867206248,
  1.4526448493230333,
  1.4268240713971041,
  1.4140143195753159,
  1.3966698860215108,
  1.3772226136430492,
  1.3599692772903971,
  1.3512030377427275,
  1.3331431613163276,
  1.3163541322455203,
  1.3061693903957103,
  1.2909074675077015,
  1.2757267326574184,
  1.2630252106841178,
  1.2510966507649746,
  1.2381411734545991,
    1.22569391996511,
   1.217122202169532,
  1.2075452659509818,
  1.1982388977860383,
  1.1865133570666719,
  1.1809562306978583,
  1.1656073673054415,
  1.1584724746121466,
  1.1499607411717492,
  1.1435538837892596,
  1.1328506917739511,
  1.1257008845152046,
  1.1182166038491566,
  1.1098171002785417,
  1.1041528581683651,
  1.0964041728614036,
   1.095516645139633,
  1.0899094674530931,
  1.0739793006498519,
  1.0705244436766757,
  1.0661676601154999,
  1.0598148335107296,
  1.0526556737428761,
  1.0590641833402465,
  1.0475026902118487,
  1.0438473704618165,
  1.0381893349028828,
  1.0336362721154335,
  1.0275464190685504,
  1.0267842221301988,
  1.0217153243664008,
  1.0251212609299625,
   1.014984400104928,
   1.017457575668175,
  1.0101706729027908,
  1.0093689511490285,
  1.0003993332648142,
  1.0059711276514682,
 0.99429502132283953,
 0.98327908266932462,
 0.99958614249341649,
 0.99744254833809021,
 0.99546384445386404,
 0.99739876183426801,
  1.0074014418402901,
 0.98545459674293312,
 0.98724534361024607,
 0.98383831541621292,
   0.987729805500285,
 0.98281526788292295,
 0.98683644799758929,
 0.98479702736024777,
 0.99023348465561867,
 0.98479702736024755,
 0.98683644799759163,
 0.98281526788292184,
 0.98772980550028344,
  0.9838383154162107,
 0.98724534361024563,
 0.98545459674293479,
  1.0074014418402892,
 0.99739876183426812,
 0.99546384445386515,
 0.99744254833809232,
 0.99958614249341715,
 0.98327908266932706,
 0.99429502132283809,
  1.0059711276514682,
  1.0003993332648142,
  1.0093689511490271,
  1.0101706729027904,
  1.0174575756681745,
  1.0149844001049269,
  1.0251212609299623,
  1.0217153243664006,
  1.0267842221302019,
   1.027546419068551,
  1.0336362721154346,
  1.0381893349028843,
  1.0438473704618159,
  1.0475026902118516,
  1.0590641833402483,
  1.0526556737428752,
  1.0598148335107285,
  1.0661676601154997,
  1.0705244436766759,
   1.073979300649849,
  1.0899094674530929,
  1.0955166451396343,
  1.0964041728614007,
  1.1041528581683675,
  1.1098171002785402,
  1.1182166038491577,
   1.125700884515205,
  1.1328506917739505,
  1.1435538837892596,
  1.1499607411717487,
  1.1584724746121446,
  1.1656073673054421,
  1.1809562306978594,
  1.1865133570666719,
  1.1982388977860365,
  1.2075452659509818,
   1.217122202169534,
  1.2256939199651096,
  1.2381411734545966,
  1.2510966507649717,
  1.2630252106841213,
  1.2757267326574173,
  1.2909074675077017,
  1.3061693903957143,
  1.3163541322455237,
  1.3331431613163278,
   1.351203037742732,
  1.3599692772903926,
   1.377222613643051,
  1.3966698860215108,
  1.4140143195753192,
  1.4268240713971034,
  1.4526448493230339,
  1.4695522867206245,
  1.4922773764962523,
  1.5043917970109029,
  1.5354646492196786,
  1.5565153141681853,
   1.579904267906342,
  1.6025169540579114,
  1.6382657404050671,
  1.6573651884068612,
  1.6880248835192966,
  1.7156934896029095,
  1.7477937451652912,
  1.7772448761750896,
  1.8124370191695194,
  1.8459159165865715,
   1.885842058424493,
  1.9228261701581753,
  1.9655398904984589,
  2.0059056129228043,
  2.0527967507688984,
  2.0999859653927824,
  2.1514547090143101,
  2.1981221493897611,
  2.2601301153853548,
  2.3165416421419422,
  2.3785828532823112,
  2.4412058957867067,
  2.5197389254397526,
  2.5939476085958777,
  2.6741762846681394,
  2.7463938705188817,
  2.8489280583296597,
  2.9459691371115135,
   3.049230841323995,
  3.1672332342740939,
  3.3069324280127148,
  3.4377503049432097,
  3.5892162563970458,
  3.7484577937329946,
  3.9262961853883218,
  4.1229496627395577,
  4.3412269962640471,
  4.5848444636795387,
  4.8665738548493964,
  5.1823126354751698,
  5.5457387184565761,
  5.9605942735039825,
  6.4504868396465564,
  7.0348992109080761,
  7.7432762278743752,
  8.6079541223803133,
  9.7248927771619122,
  11.194947889124572,
  13.245521381317946,
  16.356801814081972,
  21.744309969209478,
  33.904380642412654,
  97.306244866374016,
  63.631047149346116,
  14.540945294643638,
]
dspplot.plot(data, title='name', div_by_N=True, file='../svg/name.svg')