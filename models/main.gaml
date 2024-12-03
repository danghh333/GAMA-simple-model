model customshpfile

global {
    file road_shapefile <- file("../includes/road.shp");
    geometry shape <- envelope(road_shapefile);
    graph road_network;
    
    // Network cleaning params
    float tolerance <- 1.0;
    bool split_lines <- true;
    bool keep_main_connected <- true;

    int nb_farmer <- 100;
    int nb_station <- 5;
    int nb_waste <- 200;
    int nb_crop <- 5; 
    float speed <- 3 #km/#h;
    
    // Crop params
    float waste_prob <- 0.05;
    float max_distance_from_crop <- 10.0;
    
    list<geometry> custom_crop_areas <- [
    	polygon ([{3965.481152929196,1604.3381889015966,0.0},{3965.459065174209,1604.3891411532122,0.0},{3942.319238195371,1651.3137442587206,0.0},{3974.293500112332,1683.95974547817,0.0},{3974.4068483290525,1684.0857368570942,0.0},{3974.9459055950497,1684.7385534095697,0.0},{3975.048180284728,1684.8736886516358,0.0},{3982.1555247128053,1695.1413154205452,0.0},{3982.231921960442,1695.2604842543624,0.0},{3982.5923568776643,1695.8690917377337,0.0},{3982.6601335969167,1695.993365897265,0.0},{3990.5387519141073,1711.7409141491435,0.0},{3990.6462372277524,1711.9995970545172,0.0},{3991.0906710557247,1713.3242124268443,0.0},{3991.1609592732684,1713.5953756704014,0.0},{3992.362201363937,1720.0665940184165,0.0},{3992.3928079781886,1720.3223744969985,0.0},{3992.4630143558857,1721.6058076767272,0.0},{3992.460490292713,1721.8634004700368,0.0},{3990.8808525136865,1743.100528449195,0.0},{3991.360786331877,1747.0895377311829,0.0},{3994.362632128414,1761.2647929114444,0.0},{3997.0402037862023,1765.9267098182095,0.0},{4011.72128698218,1785.556558368745,0.0},{4011.731914075215,1785.570900694717,0.0},{4011.784728464765,1785.6428480166737,0.0},{4011.79522712755,1785.6572846194845,0.0},{4014.104795268904,1788.8631275102612,0.0},{4014.1200541816947,1788.884604819137,0.0},{4014.1956381509895,1788.9924892072281,0.0},{4014.2106128259165,1789.0141656535889,0.0},{4045.3909283049798,1834.7907570177347,0.0},{4047.504435085385,1837.5948476777248,0.0},{4060.3756249087937,1851.272885584482,0.0},{4080.441934733426,1833.5845782799634,0.0},{4112.433218461808,1800.2798751805285,0.0},{4112.572790958236,1800.147889348791,0.0},{4113.300699776946,1799.5229576013373,0.0},{4113.614501918324,1799.3020712820671,0.0},{4114.4483665991775,1798.8276657262836,0.0},{4114.798579179976,1798.6707781926063,0.0},{4115.707700463162,1798.3643643714593,0.0},{4116.081430183963,1798.2772515379409,0.0},{4117.032338189883,1798.1501102715927,0.0},{4117.415825952764,1798.1359792527335,0.0},{4118.373512396984,1798.1927913279565,0.0},{4118.752639855483,1798.2521623662237,0.0},{4119.681846901038,1798.490836210251,0.0},{4120.04265623608,1798.6215235230225,0.0},{4120.909174533226,1799.0332722061337,0.0},{4121.078518867636,1799.1239542768092,0.0},{4159.244882216666,1821.985233402524,0.0},{4190.458129408678,1840.3507870861158,0.0},{4190.566356561554,1840.419222901794,0.0},{4191.095989459099,1840.7783654311659,0.0},{4191.199615465241,1840.8535866272364,0.0},{4196.8757611893925,1845.2580507702314,0.0},{4231.074461362293,1791.58678659433,0.0},{4180.193642680006,1767.2351366642722,0.0},{4180.098692615426,1767.1865401373634,0.0},{4179.6307569242135,1766.9310751302805,0.0},{4179.538532712308,1766.877485654356,0.0},{4154.641289270527,1751.5078603467364,0.0},{4154.479538344345,1751.396690096661,0.0},{4153.699972375744,1750.8025412260588,0.0},{4153.412942226882,1750.5354617427258,0.0},{4152.764268094265,1749.8006435002237,0.0},{4152.534857771635,1749.4826990701026,0.0},{4152.04200365814,1748.6354501086696,0.0},{4151.879029271788,1748.2788591579047,0.0},{4151.5609352845995,1747.3517387799852,0.0},{4151.470659848795,1746.9702048988354,0.0},{4151.339550161452,1745.9988418206185,0.0},{4151.325442910567,1745.607027142173,0.0},{4151.386355994827,1744.6287503020071,0.0},{4151.4489590626,1744.2417120446212,0.0},{4151.699554062795,1743.2941160728506,0.0},{4151.836461648441,1742.9267278997065,0.0},{4152.267108339249,1742.0462283781083,0.0},{4152.47305916103,1741.7126088106634,0.0},{4153.067208031632,1740.9330428420624,0.0},{4153.334287514966,1740.6460126931986,0.0},{4154.069105757468,1739.9973385605829,0.0},{4154.387050187588,1739.7679282379536,0.0},{4155.234299149021,1739.2750741244586,0.0},{4155.590890099786,1739.112099738106,0.0},{4156.518010477705,1738.794005750918,0.0},{4156.899544358854,1738.7037303151135,0.0},{4157.870907437071,1738.5726206277707,0.0},{4158.262722115518,1738.5585133768852,0.0},{4159.240998955684,1738.619426461145,0.0},{4159.628037213069,1738.6820295289183,0.0},{4160.575633184839,1738.9326245291131,0.0},{4160.943021357983,1739.0695321147589,0.0},{4161.823520879581,1739.5001788055663,0.0},{4161.9953895208455,1739.594959377272,0.0},{4186.574625256763,1754.7682714144898,0.0},{4238.498189917338,1779.6189814164338,0.0},{4318.999273806514,1645.3753773644057,0.0},{4312.967945074434,1641.903420064378,0.0},{4312.957519062701,1641.897376398271,0.0},{4312.9054805173655,1641.8670012873347,0.0},{4312.895091110964,1641.8608949090672,0.0},{4282.74222119791,1624.016089458703,0.0},{4116.900717770434,1527.4048890836623,0.0},{4116.898293186382,1527.4034743589066,0.0},{4116.886175236351,1527.3963922309742,0.0},{4116.883752640391,1527.3949741045571,0.0},{4076.9205083903535,1503.9638300903318,0.0},{4026.9039853701893,1474.6429602123706,0.0},{3965.5073556015177,1604.2892254373646,0.0},{3965.481152929196,1604.3381889015966,0.0}]),
    	polygon ([{2355.310452181124,1242.3130871720812,0.0},{2218.3695020998516,1609.9235663185307,0.0},{2206.3152549122096,1659.0279270168544,0.0},{2206.3108629695835,1659.0454749640644,0.0},{2206.2885069239323,1659.1331135982598,0.0},{2206.283956448298,1659.1506211047279,0.0},{2196.2592753463955,1697.0154373591984,0.0},{2196.169086932647,1697.2798528196383,0.0},{2195.6282317926466,1698.5640625158796,0.0},{2195.502078150395,1698.8133309339362,0.0},{2129.244161481965,1809.74726656314,0.0},{2129.1990412195273,1809.8192887165962,0.0},{2128.9658921701102,1810.1744446239952,0.0},{2128.9177528127807,1810.2444848334987,0.0},{2093.960704428541,1858.8590499330883,0.0},{2093.871460948712,1858.9740832101338,0.0},{2093.4049136600233,1859.5322569381112,0.0},{2093.307538224377,1859.6404931522566,0.0},{2054.0884008384237,1900.1648854371751,0.0},{2053.9874293324156,1900.2621513814804,0.0},{2053.4661566906157,1900.7301993248368,0.0},{2053.358619139904,1900.820152557874,0.0},{2014.6333555593408,1930.970481861336,0.0},{2014.3999873187531,1931.1271440547353,0.0},{2013.18400123114,1931.8247971227172,0.0},{2012.9309750366822,1931.947196156511,0.0},{1983.630112916777,1943.658103111006,0.0},{1976.3560566490676,1955.0524993765775,0.0},{1961.8168285752831,1984.2434864040338,0.0},{1949.303037531704,2035.799823599822,0.0},{1938.7250141623597,2114.8103676477745,0.0},{1940.1417972395122,2143.042454749353,0.0},{1962.454792594699,2205.565630872868,0.0},{1962.5017067127023,2205.7154125930215,0.0},{1962.706552151476,2206.4723653701626,0.0},{1962.7644944972153,2206.7806395180683,0.0},{1962.8484686380443,2207.5603109259573,0.0},{1962.8591400061428,2207.7169047319103,0.0},{1964.4667943346008,2263.537762460276,0.0},{1964.4648258328095,2263.7010837445823,0.0},{1964.4216828210442,2264.5159270246354,0.0},{1964.4063941181294,2264.6785430523505,0.0},{1959.6285919158609,2299.9638604630654,0.0},{1959.626258915,2299.980560521439,0.0},{1959.614242120816,2300.064010155356,0.0},{1959.6117684040032,2300.0806899505487,0.0},{1948.6009088071203,2372.2276024036105,0.0},{1945.7252723799015,2467.8539204040035,0.0},{1969.3569907020853,2505.015823389927,0.0},{1994.6923429131568,2534.2791029957625,0.0},{2028.1819076819202,2561.1528716365137,0.0},{2081.573039275143,2595.4558056008977,0.0},{2081.656111394379,2595.5121728534095,0.0},{2082.064139169151,2595.804252866538,0.0},{2082.144278159824,2595.8647176192776,0.0},{2087.19474245341,2599.8781020330666,0.0},{2122.873575293285,2600.596804023064,0.0},{2176.5344762465397,2597.0974932746176,0.0},{2208.5020436290874,2583.131856775125,0.0},{2228.1270615891353,2562.2717324093264,0.0},{2244.8319076123926,2516.2410957241736,0.0},{2258.8546857425495,2420.9480358268984,0.0},{2258.855519238711,2420.9424269433175,0.0},{2258.8597264673917,2420.9143884897076,0.0},{2258.8605758627023,2420.9087819918445,0.0},{2274.2408304646456,2320.3529657102576,0.0},{2274.244737759171,2320.32843975554,0.0},{2274.2650348491293,2320.205936005183,0.0},{2274.269246390587,2320.181460459758,0.0},{2287.678472595779,2245.0475423722405,0.0},{2288.4943720423594,2191.724889289633,0.0},{2288.4954743516846,2191.682386825817,0.0},{2288.5032439816036,2191.469957096254,0.0},{2288.5052495242458,2191.427487668245,0.0},{2291.166355901853,2145.4528505253966,0.0},{2291.1883134424043,2145.2513126210374,0.0},{2291.3488258458005,2144.251768758392,0.0},{2291.391073266608,2144.053489117693,0.0},{2298.708891580678,2116.615258377321,0.0},{2298.74256295703,2116.5024523847283,0.0},{2298.927366793626,2115.943863743203,0.0},{2298.9676169519125,2115.8332342791855,0.0},{2332.6757126576485,2031.0395784396205,0.0},{2340.214435839478,2010.117052250011,0.0},{2340.234255871243,2010.064380666885,0.0},{2340.3370413119796,2009.80246901498,0.0},{2340.3583354565094,2009.7503759373442,0.0},{2374.1807290637703,1930.222152619252,0.0},{2404.400478751867,1838.981520473821,0.0},{2411.02459564963,1812.5518406885565,0.0},{2414.740914747124,1777.841350748281,0.0},{2414.7484432301785,1777.7800051726058,0.0},{2414.7908154836023,1777.4739320852318,0.0},{2414.800235901917,1777.4128484259575,0.0},{2419.8137645805996,1747.935412249922,0.0},{2419.8594466250024,1747.7317667165853,0.0},{2420.1402903093417,1746.7282125040692,0.0},{2420.2938487027673,1746.3406832832259,0.0},{2420.7766165164176,1745.4171414755122,0.0},{2420.882820677785,1745.2374778216004,0.0},{2442.156287050531,1713.1933066522001,0.0},{2442.158978105412,1713.1892637839494,0.0},{2442.1724579032198,1713.1690658091825,0.0},{2442.1751587674617,1713.1650294875262,0.0},{2476.993019483135,1661.2677245167552,0.0},{2476.9995543785,1661.258045217883,0.0},{2477.032369879065,1661.2097445351185,0.0},{2477.038961183926,1661.200103560885,0.0},{2517.183659002016,1602.8476404095568,0.0},{2517.1918666771007,1602.8358016490702,0.0},{2517.2331176998787,1602.776756409339,0.0},{2517.2414104339055,1602.764977073933,0.0},{2581.1098773004574,1512.7341999608866,0.0},{2581.112991759906,1512.7298222034876,0.0},{2581.1285934288876,1512.7079543717573,0.0},{2581.1317196370314,1512.703584996464,0.0},{2660.506727486303,1402.0786156017798,0.0},{2466.974215438373,1298.0512681823684,0.0},{2372.257797407379,1249.7034765827325,0.0},{2355.310452181124,1242.3130871720812,0.0}]),
    	polygon ([{2807.0483746567124,1176.2462271854317,0.0},{2778.4043294995495,1228.5799441759902,0.0},{2778.3956115164096,1228.5957033578907,0.0},{2778.3516677121493,1228.6743014099548,0.0},{2778.342808173585,1228.68998144888,0.0},{2708.4496927569503,1351.1000393372462,0.0},{2708.436751168765,1351.1223692493047,0.0},{2708.371325543051,1351.2335966566857,0.0},{2708.3580968809506,1351.2557577075795,0.0},{2680.36042758463,1397.4780105079903,0.0},{2759.204285603614,1448.0746596748315,0.0},{2915.160069702124,1528.5256406363635,0.0},{2915.1937842879242,1528.5434414495785,0.0},{2915.3614936134345,1528.6340440824092,0.0},{2915.3948627578384,1528.6524843223262,0.0},{3116.7199816570674,1642.4257366414051,0.0},{3116.72689700889,1642.429662817853,0.0},{3116.761434604401,1642.449362362401,0.0},{3116.768334290783,1642.4533160037722,0.0},{3200.7812275622723,1690.8162939272208,0.0},{3227.9487740279255,1654.08256781947,0.0},{3232.4365049016883,1635.4222675943402,0.0},{3231.3235325497126,1630.6133373880082,0.0},{3227.758915391577,1625.4994688445668,0.0},{3201.1324504300655,1601.1736177643163,0.0},{3170.312921404885,1574.450948816478,0.0},{3170.1711189733574,1574.3152496748671,0.0},{3170.144247602686,1574.286881088595,0.0},{3170.123064228724,1574.267456610442,0.0},{3170.0955556487593,1574.2448919955232,0.0},{3170.0633342574474,1574.2126861322238,0.0},{3170.0297568051997,1574.1818966796652,0.0},{3170.0060165442746,1574.1553960413894,0.0},{3169.818254500446,1573.9677244831435,0.0},{3169.664110552933,1573.7799918239982,0.0},{3169.497065963887,1573.603639865865,0.0},{3169.4018101855495,1573.4809361351927,0.0},{3169.3757374644388,1573.451831832034,0.0},{3169.252106753505,1573.2993928805276,0.0},{3153.2356900817026,1551.4398949287183,0.0},{3153.125247963903,1551.2720915654334,0.0},{3152.6165138068236,1550.4074929972437,0.0},{3152.523462261792,1550.229456933253,0.0},{3133.484299300102,1508.8645817012168,0.0},{3124.5077125911257,1492.1218274493788,0.0},{3124.4716071567495,1492.05115267678,0.0},{3124.2981608954565,1491.6943368213726,0.0},{3124.2648878253153,1491.6222852518085,0.0},{3110.2585857414692,1459.6398376737297,0.0},{2994.4116669530836,1309.9388847913472,0.0},{2994.2960815013953,1309.772795750051,0.0},{2993.7615895962203,1308.9152772560728,0.0},{2993.5835464461948,1308.5524222340548,0.0},{2993.2323788997455,1307.6049514331683,0.0},{2993.130925888016,1307.2137092873247,0.0},{2992.9774246577012,1306.214981628499,0.0},{2992.9567052046596,1305.8113309942376,0.0},{2993.007139400851,1304.8021352966316,0.0},{2993.067999705174,1304.4025615817402,0.0},{2993.320309555831,1303.424114187409,0.0},{2993.460264035062,1303.0449362950988,0.0},{2993.721805476899,1302.510082901565,0.0},{2985.5257426814564,1296.724335244963,0.0},{2985.504259161006,1296.7089560254867,0.0},{2985.3973541494975,1296.6313537820058,0.0},{2985.376075665345,1296.6156921040895,0.0},{2970.5836133514986,1285.5765645718345,0.0},{2807.0483746567124,1176.2462271854317,0.0}]),
    	polygon ([{4199.791024170099,1864.833773077573,0.0},{4196.2504136541265,1868.8875461801508,0.0},{4183.817329647862,1885.821324010608,0.0},{4174.425596097234,1902.1499113329007,0.0},{4174.4167231743,1902.1651815125822,0.0},{4174.372022321509,1902.241335044811,0.0},{4174.363014903326,1902.256526278021,0.0},{4146.189374467299,1949.2973848452477,0.0},{4146.18550586683,1949.3038357438047,0.0},{4092.6630132859177,2038.4154429336813,0.0},{4038.674987124393,2129.316161550877,0.0},{3976.166956247714,2235.9369710197766,0.0},{4035.1703837858877,2287.8476566120307,0.0},{4121.0093946323805,2354.997975523427,0.0},{4121.0343837252,2355.0178475937096,0.0},{4121.1585281768375,2355.1181988766843,0.0},{4121.183196864673,2355.1384673195917,0.0},{4265.324642844119,2475.5088446297996,0.0},{4467.062390509532,2628.043129832631,0.0},{4574.311338530176,2491.1118231787973,0.0},{4639.342774606526,2401.15668324843,0.0},{4651.09668626425,2377.3055958015816,0.0},{4662.038045803041,2352.306386862183,0.0},{4691.869905809371,2253.3858028855348,0.0},{4706.673220765742,2203.7979152983366,0.0},{4708.568729926226,2197.399271188128,0.0},{4721.635189471049,2153.2089443048035,0.0},{4721.695129512942,2153.0358218942374,0.0},{4722.033805593453,2152.185737949335,0.0},{4722.109335983763,2152.01882678194,0.0},{4752.322702647312,2092.652029153593,0.0},{4752.338501969481,2092.621631662802,0.0},{4752.418794443177,2092.4703319034843,0.0},{4752.435112110487,2092.4402094905486,0.0},{4800.546788078486,2005.4140771116072,0.0},{4811.210641221375,1984.7002839677964,0.0},{4790.888998893611,1970.2574468528321,0.0},{4790.883400414561,1970.2534534417355,0.0},{4790.855442429317,1970.2334383208422,0.0},{4790.849857714269,1970.2294256835814,0.0},{4703.513041111999,1907.2496726060856,0.0},{4703.500012365219,1907.2401974096574,0.0},{4703.435060491529,1907.1925598339851,0.0},{4703.422108488833,1907.1829800001444,0.0},{4607.29504928724,1835.4827141841972,0.0},{4607.267364517721,1835.4616874414476,0.0},{4607.129864821783,1835.3553586555734,0.0},{4607.102549712926,1835.3338538839732,0.0},{4572.761608205487,1807.810948354721,0.0},{4561.583412862938,1840.458449803585,0.0},{4561.564937554648,1840.51008817127,0.0},{4561.469038647354,1840.7669650175314,0.0},{4561.449154392726,1840.818077388351,0.0},{4546.117394453407,1878.683400026654,0.0},{4546.077310994196,1878.7756556715005,0.0},{4545.865424429627,1879.2316039404118,0.0},{4545.82075326301,1879.3217276031298,0.0},{4542.690415785931,1885.2571897529212,0.0},{4542.598273489973,1885.4141488069422,0.0},{4542.102843401223,1886.1763778366624,0.0},{4541.877774573052,1886.4619913399176,0.0},{4541.2525203385685,1887.121916493892,0.0},{4540.9794570180475,1887.3620570228295,0.0},{4540.24504814392,1887.8978626519427,0.0},{4540.093285309626,1887.9983334908522,0.0},{4533.5472803810935,1891.9156668637208,0.0},{4533.287684843716,1892.0464034604609,0.0},{4531.949186701924,1892.6025674483758,0.0},{4531.673382982584,1892.6942964468017,0.0},{4497.313886841615,1901.4073904679954,0.0},{4497.165022472939,1901.439164523643,0.0},{4496.415737176383,1901.5695005354755,0.0},{4496.264887426437,1901.5898608845607,0.0},{4448.677826008305,1906.1769495985761,0.0},{4397.6472145801945,1911.1462705467682,0.0},{4395.197051660452,1911.8169827846182,0.0},{4393.993610972749,1912.9678470485014,0.0},{4387.226479851179,1922.6138431220272,0.0},{4387.103157480078,1922.7721058174982,0.0},{4386.448455133729,1923.530538411396,0.0},{4386.30989656629,1923.6756487534844,0.0},{4383.22138540362,1926.6012106476815,0.0},{4383.063365929129,1926.7360349845221,0.0},{4382.240439271118,1927.36736427044,0.0},{4381.886851376904,1927.5843923638752,0.0},{4380.951373891482,1928.032350873105,0.0},{4380.5606161728,1928.1717567466023,0.0},{4379.552842764027,1928.4170681982152,0.0},{4379.348736830532,1928.4556495931463,0.0},{4375.423548821487,1928.9882673548998,0.0},{4375.136618270004,1929.006348235159,0.0},{4373.702895930805,1928.9934367513358,0.0},{4373.416337546609,1928.9701912775474,0.0},{4334.946599297291,1923.0427166465508,0.0},{4334.892002648242,1923.0335289685097,0.0},{4334.619707475874,1922.983821358232,0.0},{4334.565386055976,1922.973125992162,0.0},{4288.200784567634,1913.1758817153107,0.0},{4288.079446611579,1913.1462556748354,0.0},{4287.477971574429,1912.979334895164,0.0},{4287.358719515623,1912.9421926237706,0.0},{4250.113074023984,1900.0526525093305,0.0},{4250.024429557823,1900.0196078203141,0.0},{4249.58536172835,1899.8439971483958,0.0},{4249.498379062722,1899.806797568645,0.0},{4243.165488083242,1896.919398352928,0.0},{4243.058834786137,1896.8668882125314,0.0},{4242.533838817302,1896.5887278531063,0.0},{4242.4304937268735,1896.5299738497329,0.0},{4221.351371515904,1883.702441777647,0.0},{4221.185155983395,1883.5894725231626,0.0},{4220.384519951981,1882.984349069931,0.0},{4220.230481071925,1882.8552689431228,0.0},{4217.725545209894,1880.5322634554461,0.0},{4217.611184757991,1880.4172386384475,0.0},{4217.063624901223,1879.819892647269,0.0},{4216.958961410419,1879.695979067796,0.0},{4213.373125742626,1875.0834771597024,0.0},{4213.371747521367,1875.081702280894,0.0},{4213.364861402679,1875.0728240181954,0.0},{4213.363485176463,1875.0710475919243,0.0},{4212.761525481332,1874.2931385961163,0.0},{4211.267061734705,1872.8565084547854,0.0},{4199.791024170099,1864.833773077573,0.0}]),
    	polygon ([{5033.690289109212,650.0703741639275,0.0},{5033.501736272619,649.9674760666909,0.0},{5032.5341021792465,649.5050232655437,0.0},{5032.3356013784905,649.4229402423215,0.0},{5024.884238916009,646.8007258788992,0.0},{5024.807598065741,646.7754807776964,0.0},{5024.422003941323,646.6570354070535,0.0},{5024.3444071418235,646.6349023599992,0.0},{4999.081593437619,639.9771974059636,0.0},{4998.889577192083,639.9365532418924,0.0},{4997.921847929339,639.7808739116447,0.0},{4997.5305164795,639.7568436569352,0.0},{4996.551010332516,639.7929502748585,0.0},{4996.162510136626,639.8457267333192,0.0},{4995.208868977316,640.0722317423356,0.0},{4994.83812988003,640.1997867442651,0.0},{4993.947001603339,640.6079856839035,0.0},{4993.608270900251,640.8054173621116,0.0},{4992.813901066103,641.3796233760422,0.0},{4992.520195988173,641.6393445418555,0.0},{4991.853111783806,642.3574912149816,0.0},{4991.615719252463,642.6695209296533,0.0},{4991.101556349746,643.5040102880678,0.0},{4990.929599226843,643.8563574246484,0.0},{4990.58811661778,644.7751205102945,0.0},{4990.488203119112,645.1542445659246,0.0},{4990.332523788864,646.1219738286692,0.0},{4990.308493534155,646.5133052785077,0.0},{4990.344600152078,647.4928114254923,0.0},{4990.397376610538,647.8813116213829,0.0},{4990.623881619555,648.8349527806923,0.0},{4990.751436621485,649.2056918779803,0.0},{4991.159635561124,650.0968201546702,0.0},{4991.357067239331,650.4355508577556,0.0},{4991.931273253261,651.2299206919037,0.0},{4992.190994419076,651.5236257698357,0.0},{4992.909141092202,652.1907099742032,0.0},{4993.221170806873,652.4281025055445,0.0},{4994.055660165287,652.9422654082625,0.0},{4994.408007301868,653.1142225311662,0.0},{4995.3267703875135,653.4557051402294,0.0},{4995.513878197609,653.5149744748255,0.0},{5020.503428829732,660.1006642950736,0.0},{5026.975959861262,662.3784173803692,0.0},{5039.182207359734,669.9173634418864,0.0},{5039.354054879718,670.0121823033953,0.0},{5040.234458431825,670.4430251578983,0.0},{5040.6018160929825,670.5800145938517,0.0},{5041.549356208927,670.8308207112306,0.0},{5041.936380508807,670.8935100091741,0.0},{5042.91464375332,670.9546410509915,0.0},{5043.306461565123,670.9406210963618,0.0},{5044.277853830334,670.8097278309637,0.0},{5044.6594078152875,670.7195374027544,0.0},{5045.586599041208,670.4016499849239,0.0},{5045.943226293646,670.238755050712,0.0},{5046.790585041438,669.7460897156432,0.0},{5047.108580576051,669.516750236398,0.0},{5047.843543324242,668.8682398366275,0.0},{5048.110686750967,668.5812691999209,0.0},{5048.705009293315,667.8018356264233,0.0},{5048.911034440079,667.4682619528907,0.0},{5049.341877294582,666.587858400784,0.0},{5049.4788667305365,666.2205007396243,0.0},{5049.729672847915,665.2729606236799,0.0},{5049.7923621458585,664.8859363238001,0.0},{5049.853493187676,663.9076730792874,0.0},{5049.839473233046,663.5158552674847,0.0},{5049.708579967648,662.5444630022736,0.0},{5049.618389539439,662.1629090173211,0.0},{5049.300502121609,661.2357177914008,0.0},{5049.137607187397,660.8790905389617,0.0},{5048.644941852329,660.0317317911695,0.0},{5048.415602373082,659.7137362565553,0.0},{5047.767091973311,658.9787735083646,0.0},{5047.480121336605,658.7116300816407,0.0},{5046.700687763108,658.1173075392926,0.0},{5046.538961609558,658.0061012540366,0.0},{5033.690289109212,650.0703741639275,0.0}])
    ];

    init {
        create road from: road_shapefile;
        
        // Clean the network
        list<geometry> clean_lines <- clean_network(
        	//road_shapefile.contents,
        	road collect each.shape,
        	tolerance,
        	split_lines,
        	keep_main_connected
        );
        
        // Remove existing roads
        ask road {
        	do die;
        }
        
        // Create new roads from cleaned geometries
        loop clean_geom over: clean_lines {
            create road {
                shape <- clean_geom;
            }
        }
        
        road_network <- as_edge_graph(road);
        
        // Create custom crops
        loop i from: 0 to: length(custom_crop_areas) - 1 {
            create crop {
                shape <- custom_crop_areas[i];
                shape <- shape buffer (-2.0);
                crop_id <- i + 1;
            }
        }
        
        create farmer number: nb_farmer {
        	location <- any_location_in(one_of(road));
        }
        
        create station number: nb_station {
            location <- any_location_in(one_of(road));
        }
        
        create waste number: nb_waste {
            location <- any_location_in(one_of(road));
        }
    }
    reflex update_crop_parameters {
	    ask crop {
	        self.waste_prob <- waste_prob;
	        self.max_distance_from_crop <- max_distance_from_crop;
	    }
	}
		
	reflex stop_simulation when: empty(waste) and empty(farmer where (each.carried_waste > 0)){
		do pause;
	}
	
    reflex monitor_progress when: every(100#cycles) {
        int total_collected <- sum(farmer collect each.carried_waste);
        int remaining_waste <- length(waste);
        write "Cycle: " + cycle + " - Total collected: " + total_collected + ", Remaining waste: " + remaining_waste;
        write "Agents with waste: " + length(farmer where (each.carried_waste > 0)) +
              " (3 wastes: " + length(farmer where (each.carried_waste = 3)) +
              ", 2 wastes: " + length(farmer where (each.carried_waste = 2)) +
              ", 1 waste: " + length(farmer where (each.carried_waste = 1)) + ")";
    }
}

species farmer skills: [moving] {
    int carried_waste <- 0;
    waste target_waste <- nil;
    station target_station <- nil;	
    
    // Energy system
    float energy <- 1000.0;
    float max_energy <- 1000.0;
    float energy_consumption_rate <- 0.1;
    float rest_recovery_rate <- 0.5;
    bool is_resting <- false;
    
    // Energy-related actions
    reflex manage_energy {
    	// Decrease energy while moving or working
    	if not is_resting {
    		// Higer energy cost when carrying waste
    		float current_consumption <- energy_consumption_rate * (1 + carried_waste * 0.5);
    		energy <- energy - current_consumption;
    		
    		// Rest
    		if energy <= 20.0{
    			is_resting <- true;
    			write name + " is tired and needs to rest. Energy: " + energy;
    		}
    	} else {
    		// Recover
    		energy <- energy + rest_recovery_rate;
    		if energy >= max_energy {
    			energy <- max_energy;
    			is_resting <- false;
    			write name + " has finished resting. Energy: " + energy;
    		}
    	}
    }
	
    reflex find_waste when: not is_resting and carried_waste < 3 and target_waste = nil {
        list<waste> not_targeted_waste <- waste where (each.targeted = false);
        if not empty(not_targeted_waste) {
            target_waste <- not_targeted_waste closest_to self;
            ask target_waste {
                targeted <- true;
            }
        }
    }
    
    reflex collect_waste when: not is_resting and target_waste != nil and location distance_to(target_waste.location) < 10 {
        carried_waste <- carried_waste + 1;
        energy <- energy - 2.0;  // Extra energy cost for collecting
        ask target_waste {
            do die;
        }
        target_waste <- nil;
        write name + " collected waste. Now carrying: " + carried_waste + ", Energy: " + energy;
    }

    reflex find_station when: not is_resting and (carried_waste = 3 or (carried_waste > 0 and empty(waste))) and target_station = nil {
        target_station <- station closest_to self;
    }

    reflex drop_waste when: not is_resting and target_station != nil and location distance_to(target_station.location) < 10 {
    	// Reset tracking variables
        carried_waste <- 0;
        target_station <- nil;
    }

    reflex move when: not is_resting {
        if target_waste != nil {
            do goto target: target_waste.location on: road_network speed: speed;
        } else if target_station != nil {
            do goto target: target_station.location on: road_network speed: speed;
        }
    }
    
    aspect default {
        rgb agent_color <- rgb(0,0,0);
        if is_resting { agent_color <- #gray; }
        else if carried_waste = 3 { agent_color <- #red; }
        else if carried_waste > 0 { agent_color <- #orange; }
        else { agent_color <- #green; }
        
        draw sphere(5) color: agent_color;
        
        // Energy bar
        point energy_bar_loc <- location + {0, 0, 10};
        float bar_width <- 10.0;
        float energy_percentage <- energy / max_energy;
        draw line([energy_bar_loc, energy_bar_loc + {bar_width, 0, 0}]) color: #gray width: 2;
        draw line([energy_bar_loc, energy_bar_loc + {bar_width * energy_percentage, 0, 0}]) 
            color: rgb(0, 0, int(255 * energy_percentage)) width: 2;
    }
}


species road {
    aspect default {
        draw shape color: #black;
    }
}

species station {
    aspect default {
        draw sphere(10) color: #blue;
    }
}

species waste {
	bool targeted <- false;
    aspect default {
        draw cube(3) color: #red;
    }
}

species crop {
    rgb crop_color <- rgb(76,123,29);
    int crop_id <- int(self);
    int waste_produced <- 0;
    
    // Production params
    float waste_prob <- 0.05;
    float max_distance_from_crop <- 10.0;
    int base_production_rate <- int(shape.area / 1000) + 1;
    
    reflex produce_waste {
    	if flip(waste_prob){
    		int amount <- rnd(1, base_production_rate);
    		
    		loop times: amount {
    			point valid_location <- nil;
    			geometry border <- shape buffer max_distance_from_crop;
    			list<road> nearby_roads <- road at_distance max_distance_from_crop;
    			
    			if not empty(nearby_roads) {
    				valid_location <- any_location_in(border);
    				
    				create waste {
    					location <- valid_location;
    					targeted <- false;
    				}
    				
    				waste_produced <- waste_produced + 1;    			
    			}
    		}
    	}
    }
    
    aspect default {
        draw shape color: crop_color border: #black;
    }

    aspect detailed {
        draw shape color: crop_color border: #black;
        draw string(crop_id) size: 20 color: #black at: location + {0, 0, 5};
    }
}

species land {
    aspect default {
        draw shape color: rgb(215,240,203) border: #black;
    }
}

experiment myExperiment type: gui {
	parameter "Waste production probability" var: waste_prob min: 0.01 max: 0.2 step: 0.01;
	parameter "Max distance for waste placement" var: max_distance_from_crop min: 5.0 max: 20.0 step: 1.0;    
    output {
        display map_3d type: opengl {
            species road;
            species farmer;
            species station;
            species waste;
            species land;
            species crop aspect: detailed;
        }
    }
}