pragma solidity ^0.4.23;

import "commons-collections/VersionLinkedAppendOnly.sol";

import "commons-standards/IsoCurrencies.sol";

/**
 * https://en.wikipedia.org/wiki/ISO_4217
 */
contract IsoCurrencies100 is VersionLinkedAppendOnly([1,0,0]), IsoCurrencies {

	// Currency keys are held as dedicated bytes3 values.
	// The key matches the ISO 4217 alphabetic code of the currency.
	// This key is to be used by other contracts as the primary key to reference the currency.
	bytes3 constant public AED = "AED";
	bytes3 constant public AFN = "AFN";
	bytes3 constant public ALL = "ALL";
	bytes3 constant public AMD = "AMD";
	bytes3 constant public ANG = "ANG";
	bytes3 constant public AOA = "AOA";
	bytes3 constant public ARS = "ARS";
	bytes3 constant public AUD = "AUD";
	bytes3 constant public AWG = "AWG";
	bytes3 constant public AZN = "AZN";
	bytes3 constant public BAM = "BAM";
	bytes3 constant public BBD = "BBD";
	bytes3 constant public BDT = "BDT";
	bytes3 constant public BGN = "BGN";
	bytes3 constant public BHD = "BHD";
	bytes3 constant public BIF = "BIF";
	bytes3 constant public BMD = "BMD";
	bytes3 constant public BND = "BND";
	bytes3 constant public BOB = "BOB";
	bytes3 constant public BOV = "BOV";
	bytes3 constant public BRL = "BRL";
	bytes3 constant public BSD = "BSD";
	bytes3 constant public BTN = "BTN";
	bytes3 constant public BWP = "BWP";
	bytes3 constant public BYN = "BYN";
	bytes3 constant public BZD = "BZD";
	bytes3 constant public CAD = "CAD";
	bytes3 constant public CDF = "CDF";
	bytes3 constant public CHE = "CHE";
	bytes3 constant public CHF = "CHF";
	bytes3 constant public CHW = "CHW";
	bytes3 constant public CLF = "CLF";
	bytes3 constant public CLP = "CLP";
	bytes3 constant public CNY = "CNY";
	bytes3 constant public COP = "COP";
	bytes3 constant public COU = "COU";
	bytes3 constant public CRC = "CRC";
	bytes3 constant public CUC = "CUC";
	bytes3 constant public CUP = "CUP";
	bytes3 constant public CVE = "CVE";
	bytes3 constant public CZK = "CZK";
	bytes3 constant public DJF = "DJF";
	bytes3 constant public DKK = "DKK";
	bytes3 constant public DOP = "DOP";
	bytes3 constant public DZD = "DZD";
	bytes3 constant public EGP = "EGP";
	bytes3 constant public ERN = "ERN";
	bytes3 constant public ETB = "ETB";
	bytes3 constant public EUR = "EUR";
	bytes3 constant public FJD = "FJD";
	bytes3 constant public FKP = "FKP";
	bytes3 constant public GBP = "GBP";
	bytes3 constant public GEL = "GEL";
	bytes3 constant public GHS = "GHS";
	bytes3 constant public GIP = "GIP";
	bytes3 constant public GMD = "GMD";
	bytes3 constant public GNF = "GNF";
	bytes3 constant public GTQ = "GTQ";
	bytes3 constant public GYD = "GYD";
	bytes3 constant public HKD = "HKD";
	bytes3 constant public HNL = "HNL";
	bytes3 constant public HRK = "HRK";
	bytes3 constant public HTG = "HTG";
	bytes3 constant public HUF = "HUF";
	bytes3 constant public IDR = "IDR";
	bytes3 constant public ILS = "ILS";
	bytes3 constant public INR = "INR";
	bytes3 constant public IQD = "IQD";
	bytes3 constant public IRR = "IRR";
	bytes3 constant public ISK = "ISK";
	bytes3 constant public JMD = "JMD";
	bytes3 constant public JOD = "JOD";
	bytes3 constant public JPY = "JPY";
	bytes3 constant public KES = "KES";
	bytes3 constant public KGS = "KGS";
	bytes3 constant public KHR = "KHR";
	bytes3 constant public KMF = "KMF";
	bytes3 constant public KPW = "KPW";
	bytes3 constant public KRW = "KRW";
	bytes3 constant public KWD = "KWD";
	bytes3 constant public KYD = "KYD";
	bytes3 constant public KZT = "KZT";
	bytes3 constant public LAK = "LAK";
	bytes3 constant public LBP = "LBP";
	bytes3 constant public LKR = "LKR";
	bytes3 constant public LRD = "LRD";
	bytes3 constant public LSL = "LSL";
	bytes3 constant public LYD = "LYD";
	bytes3 constant public MAD = "MAD";
	bytes3 constant public MDL = "MDL";
	bytes3 constant public MGA = "MGA";
	bytes3 constant public MKD = "MKD";
	bytes3 constant public MMK = "MMK";
	bytes3 constant public MNT = "MNT";
	bytes3 constant public MOP = "MOP";
	bytes3 constant public MRO = "MRO";
	bytes3 constant public MUR = "MUR";
	bytes3 constant public MVR = "MVR";
	bytes3 constant public MWK = "MWK";
	bytes3 constant public MXN = "MXN";
	bytes3 constant public MXV = "MXV";
	bytes3 constant public MYR = "MYR";
	bytes3 constant public MZN = "MZN";
	bytes3 constant public NAD = "NAD";
	bytes3 constant public NGN = "NGN";
	bytes3 constant public NIO = "NIO";
	bytes3 constant public NOK = "NOK";
	bytes3 constant public NPR = "NPR";
	bytes3 constant public NZD = "NZD";
	bytes3 constant public OMR = "OMR";
	bytes3 constant public PAB = "PAB";
	bytes3 constant public PEN = "PEN";
	bytes3 constant public PGK = "PGK";
	bytes3 constant public PHP = "PHP";
	bytes3 constant public PKR = "PKR";
	bytes3 constant public PLN = "PLN";
	bytes3 constant public PYG = "PYG";
	bytes3 constant public QAR = "QAR";
	bytes3 constant public RON = "RON";
	bytes3 constant public RSD = "RSD";
	bytes3 constant public RUB = "RUB";
	bytes3 constant public RWF = "RWF";
	bytes3 constant public SAR = "SAR";
	bytes3 constant public SBD = "SBD";
	bytes3 constant public SCR = "SCR";
	bytes3 constant public SDG = "SDG";
	bytes3 constant public SEK = "SEK";
	bytes3 constant public SGD = "SGD";
	bytes3 constant public SHP = "SHP";
	bytes3 constant public SLL = "SLL";
	bytes3 constant public SOS = "SOS";
	bytes3 constant public SRD = "SRD";
	bytes3 constant public SSP = "SSP";
	bytes3 constant public STD = "STD";
	bytes3 constant public SVC = "SVC";
	bytes3 constant public SYP = "SYP";
	bytes3 constant public SZL = "SZL";
	bytes3 constant public THB = "THB";
	bytes3 constant public TJS = "TJS";
	bytes3 constant public TMT = "TMT";
	bytes3 constant public TND = "TND";
	bytes3 constant public TOP = "TOP";
	bytes3 constant public TRY = "TRY";
	bytes3 constant public TTD = "TTD";
	bytes3 constant public TWD = "TWD";
	bytes3 constant public TZS = "TZS";
	bytes3 constant public UAH = "UAH";
	bytes3 constant public UGX = "UGX";
	bytes3 constant public USD = "USD";
	bytes3 constant public USN = "USN";
	bytes3 constant public UYI = "UYI";
	bytes3 constant public UYU = "UYU";
	bytes3 constant public UZS = "UZS";
	bytes3 constant public VEF = "VEF";
	bytes3 constant public VND = "VND";
	bytes3 constant public VUV = "VUV";
	bytes3 constant public WST = "WST";
	bytes3 constant public XAF = "XAF";
	bytes3 constant public XAG = "XAG";
	bytes3 constant public XAU = "XAU";
	bytes3 constant public XBA = "XBA";
	bytes3 constant public XBB = "XBB";
	bytes3 constant public XBC = "XBC";
	bytes3 constant public XBD = "XBD";
	bytes3 constant public XCD = "XCD";
	bytes3 constant public XDR = "XDR";
	bytes3 constant public XOF = "XOF";
	bytes3 constant public XPD = "XPD";
	bytes3 constant public XPF = "XPF";
	bytes3 constant public XPT = "XPT";
	bytes3 constant public XSU = "XSU";
	bytes3 constant public XTS = "XTS";
	bytes3 constant public XUA = "XUA";
	bytes3 constant public XXX = "XXX";
	bytes3 constant public YER = "YER";
	bytes3 constant public ZAR = "ZAR";
	bytes3 constant public ZMW = "ZMW";
	bytes3 constant public ZWL = "ZWL";
	
	constructor() public {
		//** Currency Initialization */
		currencies[AED] = Currency(AED, "784", "United Arab Emirates dirham", true);
		currencies[AFN] = Currency(AFN, "971", "Afghan afghani", true);
		currencies[ALL] = Currency(ALL, "008", "Albanian lek", true);
		currencies[AMD] = Currency(AMD, "051", "Armenian dram", true);
		currencies[ANG] = Currency(ANG, "532", "Netherlands Antillean guilder", true);
		currencies[AOA] = Currency(AOA, "973", "Angolan kwanza", true);
		currencies[ARS] = Currency(ARS, "032", "Argentine peso", true);
		currencies[AUD] = Currency(AUD, "036", "Australian dollar", true);
		currencies[AWG] = Currency(AWG, "533", "Aruban florin", true);
		currencies[AZN] = Currency(AZN, "944", "Azerbaijani manat", true);
		currencies[BAM] = Currency(BAM, "977", "Bosnia and Herzegovina convertible mark", true);
		currencies[BBD] = Currency(BBD, "052", "Barbados dollar", true);
		currencies[BDT] = Currency(BDT, "050", "Bangladeshi taka", true);
		currencies[BGN] = Currency(BGN, "975", "Bulgarian lev", true);
		currencies[BHD] = Currency(BHD, "048", "Bahraini dinar", true);
		currencies[BIF] = Currency(BIF, "108", "Burundian franc", true);
		currencies[BMD] = Currency(BMD, "060", "Bermudian dollar", true);
		currencies[BND] = Currency(BND, "096", "Brunei dollar", true);
		currencies[BOB] = Currency(BOB, "068", "Boliviano", true);
		currencies[BOV] = Currency(BOV, "984", "Bolivian Mvdol (funds code)", true);
		currencies[BRL] = Currency(BRL, "986", "Brazilian real", true);
		currencies[BSD] = Currency(BSD, "044", "Bahamian dollar", true);
		currencies[BTN] = Currency(BTN, "064", "Bhutanese ngultrum", true);
		currencies[BWP] = Currency(BWP, "072", "Botswana pula", true);
		currencies[BYN] = Currency(BYN, "933", "Belarusian ruble", true);
		currencies[BZD] = Currency(BZD, "084", "Belize dollar", true);
		currencies[CAD] = Currency(CAD, "124", "Canadian dollar", true);
		currencies[CDF] = Currency(CDF, "976", "Congolese franc", true);
		currencies[CHE] = Currency(CHE, "947", "WIR Euro (complementary currency)", true);
		currencies[CHF] = Currency(CHF, "756", "Swiss franc", true);
		currencies[CHW] = Currency(CHW, "948", "WIR Franc (complementary currency)", true);
		currencies[CLF] = Currency(CLF, "990", "Unidad de Fomento (funds code)", true);
		currencies[CLP] = Currency(CLP, "152", "Chilean peso", true);
		currencies[CNY] = Currency(CNY, "156", "Chinese yuan", true);
		currencies[COP] = Currency(COP, "170", "Colombian peso", true);
		currencies[COU] = Currency(COU, "970", "Unidad de Valor Real (UVR) (funds code)", true);
		currencies[CRC] = Currency(CRC, "188", "Costa Rican colon", true);
		currencies[CUC] = Currency(CUC, "931", "Cuban convertible peso", true);
		currencies[CUP] = Currency(CUP, "192", "Cuban peso", true);
		currencies[CVE] = Currency(CVE, "132", "Cape Verde escudo", true);
		currencies[CZK] = Currency(CZK, "203", "Czech koruna", true);
		currencies[DJF] = Currency(DJF, "262", "Djiboutian franc", true);
		currencies[DKK] = Currency(DKK, "208", "Danish krone", true);
		currencies[DOP] = Currency(DOP, "214", "Dominican peso", true);
		currencies[DZD] = Currency(DZD, "012", "Algerian dinar", true);
		currencies[EGP] = Currency(EGP, "818", "Egyptian pound", true);
		currencies[ERN] = Currency(ERN, "232", "Eritrean nakfa", true);
		currencies[ETB] = Currency(ETB, "230", "Ethiopian birr", true);
		currencies[EUR] = Currency(EUR, "978", "Euro", true);
		currencies[FJD] = Currency(FJD, "242", "Fiji dollar", true);
		currencies[FKP] = Currency(FKP, "238", "Falkland Islands", true);
		currencies[GBP] = Currency(GBP, "826", "Pound sterling", true);
		currencies[GEL] = Currency(GEL, "981", "Georgian lari", true);
		currencies[GHS] = Currency(GHS, "936", "Ghanaian cedi", true);
		currencies[GIP] = Currency(GIP, "292", "Gibraltar pound", true);
		currencies[GMD] = Currency(GMD, "270", "Gambian dalasi", true);
		currencies[GNF] = Currency(GNF, "324", "Guinean franc", true);
		currencies[GTQ] = Currency(GTQ, "320", "Guatemalan quetzal", true);
		currencies[GYD] = Currency(GYD, "328", "Guyanese dollar", true);
		currencies[HKD] = Currency(HKD, "344", "Hong Kong dollar", true);
		currencies[HNL] = Currency(HNL, "340", "Honduran lempira", true);
		currencies[HRK] = Currency(HRK, "191", "Croatian kuna", true);
		currencies[HTG] = Currency(HTG, "332", "Haitian gourde", true);
		currencies[HUF] = Currency(HUF, "348", "Hungarian forint", true);
		currencies[IDR] = Currency(IDR, "360", "Indonesian rupiah", true);
		currencies[ILS] = Currency(ILS, "376", "Israeli new shekel", true);
		currencies[INR] = Currency(INR, "356", "Indian rupee", true);
		currencies[IQD] = Currency(IQD, "368", "Iraqi dinar", true);
		currencies[IRR] = Currency(IRR, "364", "Iranian rial", true);
		currencies[ISK] = Currency(ISK, "352", "Icelandic króna", true);
		currencies[JMD] = Currency(JMD, "388", "Jamaican dollar", true);
		currencies[JOD] = Currency(JOD, "400", "Jordanian dinar", true);
		currencies[JPY] = Currency(JPY, "392", "Japanese yen", true);
		currencies[KES] = Currency(KES, "404", "Kenyan shilling", true);
		currencies[KGS] = Currency(KGS, "417", "Kyrgyzstani som", true);
		currencies[KHR] = Currency(KHR, "116", "Cambodian riel", true);
		currencies[KMF] = Currency(KMF, "174", "Comoro franc", true);
		currencies[KPW] = Currency(KPW, "408", "North Korean", true);
		currencies[KRW] = Currency(KRW, "410", "South Korean", true);
		currencies[KWD] = Currency(KWD, "414", "Kuwaiti dinar", true);
		currencies[KYD] = Currency(KYD, "136", "Cayman Islands dollar", true);
		currencies[KZT] = Currency(KZT, "398", "Kazakhstani tenge", true);
		currencies[LAK] = Currency(LAK, "418", "Lao kip", true);
		currencies[LBP] = Currency(LBP, "422", "Lebanese pound", true);
		currencies[LKR] = Currency(LKR, "144", "Sri Lankan rupee", true);
		currencies[LRD] = Currency(LRD, "430", "Liberian dollar", true);
		currencies[LSL] = Currency(LSL, "426", "Lesotho loti", true);
		currencies[LYD] = Currency(LYD, "434", "Libyan dinar", true);
		currencies[MAD] = Currency(MAD, "504", "Moroccan dirham", true);
		currencies[MDL] = Currency(MDL, "498", "Moldovan leu", true);
		currencies[MGA] = Currency(MGA, "969", "[9]	Malagasy ariary", true);
		currencies[MKD] = Currency(MKD, "807", "Macedonian denar", true);
		currencies[MMK] = Currency(MMK, "104", "Myanmar kyat", true);
		currencies[MNT] = Currency(MNT, "496", "Mongolian tögrög", true);
		currencies[MOP] = Currency(MOP, "446", "Macanese pataca", true);
		currencies[MRO] = Currency(MRO, "478", "[9]	Mauritanian ouguiya", true);
		currencies[MUR] = Currency(MUR, "480", "Mauritian rupee", true);
		currencies[MVR] = Currency(MVR, "462", "Maldivian rufiyaa", true);
		currencies[MWK] = Currency(MWK, "454", "Malawian kwacha", true);
		currencies[MXN] = Currency(MXN, "484", "Mexican peso", true);
		currencies[MXV] = Currency(MXV, "979", "Mexican Unidad de Inversion (UDI) (funds code)", true);
		currencies[MYR] = Currency(MYR, "458", "Malaysian ringgit", true);
		currencies[MZN] = Currency(MZN, "943", "Mozambican metical", true);
		currencies[NAD] = Currency(NAD, "516", "Namibian dollar", true);
		currencies[NGN] = Currency(NGN, "566", "Nigerian naira", true);
		currencies[NIO] = Currency(NIO, "558", "Nicaraguan córdoba", true);
		currencies[NOK] = Currency(NOK, "578", "Norwegian krone", true);
		currencies[NPR] = Currency(NPR, "524", "Nepalese rupee", true);
		currencies[NZD] = Currency(NZD, "554", "New Zealand dollar", true);
		currencies[OMR] = Currency(OMR, "512", "Omani rial", true);
		currencies[PAB] = Currency(PAB, "590", "Panamanian balboa", true);
		currencies[PEN] = Currency(PEN, "604", "Peruvian Sol", true);
		currencies[PGK] = Currency(PGK, "598", "Papua New Guinean kina", true);
		currencies[PHP] = Currency(PHP, "608", "Philippine piso", true);
		currencies[PKR] = Currency(PKR, "586", "Pakistani rupee", true);
		currencies[PLN] = Currency(PLN, "985", "Polish złoty", true);
		currencies[PYG] = Currency(PYG, "600", "Paraguayan guaraní", true);
		currencies[QAR] = Currency(QAR, "634", "Qatari riyal", true);
		currencies[RON] = Currency(RON, "946", "Romanian leu", true);
		currencies[RSD] = Currency(RSD, "941", "Serbian dinar", true);
		currencies[RUB] = Currency(RUB, "643", "Russian ruble", true);
		currencies[RWF] = Currency(RWF, "646", "Rwandan franc", true);
		currencies[SAR] = Currency(SAR, "682", "Saudi riyal", true);
		currencies[SBD] = Currency(SBD, "090", "Solomon Islands dollar", true);
		currencies[SCR] = Currency(SCR, "690", "Seychelles rupee", true);
		currencies[SDG] = Currency(SDG, "938", "Sudanese pound", true);
		currencies[SEK] = Currency(SEK, "752", "Swedish krona/kronor", true);
		currencies[SGD] = Currency(SGD, "702", "Singapore dollar", true);
		currencies[SHP] = Currency(SHP, "654", "Saint Helena pound", true);
		currencies[SLL] = Currency(SLL, "694", "Sierra Leonean leone", true);
		currencies[SOS] = Currency(SOS, "706", "Somali shilling", true);
		currencies[SRD] = Currency(SRD, "968", "Surinamese dollar", true);
		currencies[SSP] = Currency(SSP, "728", "South Sudanese pound", true);
		currencies[STD] = Currency(STD, "678", "São Tomé and Príncipe dobra", true);
		currencies[SVC] = Currency(SVC, "222", "Salvadoran colón", true);
		currencies[SYP] = Currency(SYP, "760", "Syrian pound", true);
		currencies[SZL] = Currency(SZL, "748", "Swazi lilangeni", true);
		currencies[THB] = Currency(THB, "764", "Thai baht", true);
		currencies[TJS] = Currency(TJS, "972", "Tajikistani somoni", true);
		currencies[TMT] = Currency(TMT, "934", "Turkmenistan manat", true);
		currencies[TND] = Currency(TND, "788", "Tunisian dinar", true);
		currencies[TOP] = Currency(TOP, "776", "Tongan paʻanga", true);
		currencies[TRY] = Currency(TRY, "949", "Turkish lira", true);
		currencies[TTD] = Currency(TTD, "780", "Trinidad and Tobago dollar", true);
		currencies[TWD] = Currency(TWD, "901", "New Taiwan dollar", true);
		currencies[TZS] = Currency(TZS, "834", "Tanzanian shilling", true);
		currencies[UAH] = Currency(UAH, "980", "Ukrainian hryvnia", true);
		currencies[UGX] = Currency(UGX, "800", "Ugandan shilling", true);
		currencies[USD] = Currency(USD, "840", "United States dollar", true);
		currencies[USN] = Currency(USN, "997", "United States dollar (next day) (funds code)", true);
		currencies[UYI] = Currency(UYI, "940", "Uruguay Peso en Unidades Indexadas (URUIURUI) (funds code)", true);
		currencies[UYU] = Currency(UYU, "858", "Uruguayan peso", true);
		currencies[UZS] = Currency(UZS, "860", "Uzbekistan som", true);
		currencies[VEF] = Currency(VEF, "937", "Venezuelan bolívar", true);
		currencies[VND] = Currency(VND, "704", "Vietnamese đồng", true);
		currencies[VUV] = Currency(VUV, "548", "Vanuatu vatu", true);
		currencies[WST] = Currency(WST, "882", "Samoan tala", true);
		currencies[XAF] = Currency(XAF, "950", "CFA franc", true);
		currencies[XAG] = Currency(XAG, "961", "Silver (one troy ounce)", true);
		currencies[XAU] = Currency(XAU, "959", "Gold (one troy ounce)", true);
		currencies[XBA] = Currency(XBA, "955", "European Composite Unit (EURCO)", true);
		currencies[XBB] = Currency(XBB, "956", "European Monetary Unit (E.M.U.-6)", true);
		currencies[XBC] = Currency(XBC, "957", "European Unit of Account 9 (E.U.A.-9)", true);
		currencies[XBD] = Currency(XBD, "958", "European Unit of Account 17 (E.U.A.-17)", true);
		currencies[XCD] = Currency(XCD, "951", "East Caribbean dollar", true);
		currencies[XDR] = Currency(XDR, "960", "Special drawing rights", true);
		currencies[XOF] = Currency(XOF, "952", "CFA franc", true);
		currencies[XPD] = Currency(XPD, "964", "Palladium (one troy ounce", true);
		currencies[XPF] = Currency(XPF, "953", "CFP franc", true);
		currencies[XPT] = Currency(XPT, "962", "Platinum (one troy oun", true);
		currencies[XSU] = Currency(XSU, "994", "SUCRE	Unified System for Regional Compensation (SUCRE)", true);
		currencies[XTS] = Currency(XTS, "963", "Code reserved for testing purposes", true);
		currencies[XUA] = Currency(XUA, "965", "ADB Unit of Account	African Development Bank", true);
		currencies[XXX] = Currency(XXX, "999", "No currency", true);
		currencies[YER] = Currency(YER, "886", "Yemeni rial", true);
		currencies[ZAR] = Currency(ZAR, "710", "South African rand", true);
		currencies[ZMW] = Currency(ZMW, "967", "Zambian kwacha", true);
		currencies[ZWL] = Currency(ZWL, "932", "Zimbabwean dollar", true);
		currencyKeys.push(AED);
		currencyKeys.push(AFN);
		currencyKeys.push(ALL);
		currencyKeys.push(AMD);
		currencyKeys.push(ANG);
		currencyKeys.push(AOA);
		currencyKeys.push(ARS);
		currencyKeys.push(AUD);
		currencyKeys.push(AWG);
		currencyKeys.push(AZN);
		currencyKeys.push(BAM);
		currencyKeys.push(BBD);
		currencyKeys.push(BDT);
		currencyKeys.push(BGN);
		currencyKeys.push(BHD);
		currencyKeys.push(BIF);
		currencyKeys.push(BMD);
		currencyKeys.push(BND);
		currencyKeys.push(BOB);
		currencyKeys.push(BOV);
		currencyKeys.push(BRL);
		currencyKeys.push(BSD);
		currencyKeys.push(BTN);
		currencyKeys.push(BWP);
		currencyKeys.push(BYN);
		currencyKeys.push(BZD);
		currencyKeys.push(CAD);
		currencyKeys.push(CDF);
		currencyKeys.push(CHE);
		currencyKeys.push(CHF);
		currencyKeys.push(CHW);
		currencyKeys.push(CLF);
		currencyKeys.push(CLP);
		currencyKeys.push(CNY);
		currencyKeys.push(COP);
		currencyKeys.push(COU);
		currencyKeys.push(CRC);
		currencyKeys.push(CUC);
		currencyKeys.push(CUP);
		currencyKeys.push(CVE);
		currencyKeys.push(CZK);
		currencyKeys.push(DJF);
		currencyKeys.push(DKK);
		currencyKeys.push(DOP);
		currencyKeys.push(DZD);
		currencyKeys.push(EGP);
		currencyKeys.push(ERN);
		currencyKeys.push(ETB);
		currencyKeys.push(EUR);
		currencyKeys.push(FJD);
		currencyKeys.push(FKP);
		currencyKeys.push(GBP);
		currencyKeys.push(GEL);
		currencyKeys.push(GHS);
		currencyKeys.push(GIP);
		currencyKeys.push(GMD);
		currencyKeys.push(GNF);
		currencyKeys.push(GTQ);
		currencyKeys.push(GYD);
		currencyKeys.push(HKD);
		currencyKeys.push(HNL);
		currencyKeys.push(HRK);
		currencyKeys.push(HTG);
		currencyKeys.push(HUF);
		currencyKeys.push(IDR);
		currencyKeys.push(ILS);
		currencyKeys.push(INR);
		currencyKeys.push(IQD);
		currencyKeys.push(IRR);
		currencyKeys.push(ISK);
		currencyKeys.push(JMD);
		currencyKeys.push(JOD);
		currencyKeys.push(JPY);
		currencyKeys.push(KES);
		currencyKeys.push(KGS);
		currencyKeys.push(KHR);
		currencyKeys.push(KMF);
		currencyKeys.push(KPW);
		currencyKeys.push(KRW);
		currencyKeys.push(KWD);
		currencyKeys.push(KYD);
		currencyKeys.push(KZT);
		currencyKeys.push(LAK);
		currencyKeys.push(LBP);
		currencyKeys.push(LKR);
		currencyKeys.push(LRD);
		currencyKeys.push(LSL);
		currencyKeys.push(LYD);
		currencyKeys.push(MAD);
		currencyKeys.push(MDL);
		currencyKeys.push(MGA);
		currencyKeys.push(MKD);
		currencyKeys.push(MMK);
		currencyKeys.push(MNT);
		currencyKeys.push(MOP);
		currencyKeys.push(MRO);
		currencyKeys.push(MUR);
		currencyKeys.push(MVR);
		currencyKeys.push(MWK);
		currencyKeys.push(MXN);
		currencyKeys.push(MXV);
		currencyKeys.push(MYR);
		currencyKeys.push(MZN);
		currencyKeys.push(NAD);
		currencyKeys.push(NGN);
		currencyKeys.push(NIO);
		currencyKeys.push(NOK);
		currencyKeys.push(NPR);
		currencyKeys.push(NZD);
		currencyKeys.push(OMR);
		currencyKeys.push(PAB);
		currencyKeys.push(PEN);
		currencyKeys.push(PGK);
		currencyKeys.push(PHP);
		currencyKeys.push(PKR);
		currencyKeys.push(PLN);
		currencyKeys.push(PYG);
		currencyKeys.push(QAR);
		currencyKeys.push(RON);
		currencyKeys.push(RSD);
		currencyKeys.push(RUB);
		currencyKeys.push(RWF);
		currencyKeys.push(SAR);
		currencyKeys.push(SBD);
		currencyKeys.push(SCR);
		currencyKeys.push(SDG);
		currencyKeys.push(SEK);
		currencyKeys.push(SGD);
		currencyKeys.push(SHP);
		currencyKeys.push(SLL);
		currencyKeys.push(SOS);
		currencyKeys.push(SRD);
		currencyKeys.push(SSP);
		currencyKeys.push(STD);
		currencyKeys.push(SVC);
		currencyKeys.push(SYP);
		currencyKeys.push(SZL);
		currencyKeys.push(THB);
		currencyKeys.push(TJS);
		currencyKeys.push(TMT);
		currencyKeys.push(TND);
		currencyKeys.push(TOP);
		currencyKeys.push(TRY);
		currencyKeys.push(TTD);
		currencyKeys.push(TWD);
		currencyKeys.push(TZS);
		currencyKeys.push(UAH);
		currencyKeys.push(UGX);
		currencyKeys.push(USD);
		currencyKeys.push(USN);
		currencyKeys.push(UYI);
		currencyKeys.push(UYU);
		currencyKeys.push(UZS);
		currencyKeys.push(VEF);
		currencyKeys.push(VND);
		currencyKeys.push(VUV);
		currencyKeys.push(WST);
		currencyKeys.push(XAF);
		currencyKeys.push(XAG);
		currencyKeys.push(XAU);
		currencyKeys.push(XBA);
		currencyKeys.push(XBB);
		currencyKeys.push(XBC);
		currencyKeys.push(XBD);
		currencyKeys.push(XCD);
		currencyKeys.push(XDR);
		currencyKeys.push(XOF);
		currencyKeys.push(XPD);
		currencyKeys.push(XPF);
		currencyKeys.push(XPT);
		currencyKeys.push(XSU);
		currencyKeys.push(XTS);
		currencyKeys.push(XUA);
		currencyKeys.push(XXX);
		currencyKeys.push(YER);
		currencyKeys.push(ZAR);
		currencyKeys.push(ZMW);
		currencyKeys.push(ZWL);
	}

}
