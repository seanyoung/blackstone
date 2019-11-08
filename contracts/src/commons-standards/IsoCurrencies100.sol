pragma solidity ^0.5;

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
		registerCurrency(AED, "784", "United Arab Emirates dirham");
		registerCurrency(AFN, "971", "Afghan afghani");
		registerCurrency(ALL, "008", "Albanian lek");
		registerCurrency(AMD, "051", "Armenian dram");
		registerCurrency(ANG, "532", "Netherlands Antillean guilder");
		registerCurrency(AOA, "973", "Angolan kwanza");
		registerCurrency(ARS, "032", "Argentine peso");
		registerCurrency(AUD, "036", "Australian dollar");
		registerCurrency(AWG, "533", "Aruban florin");
		registerCurrency(AZN, "944", "Azerbaijani manat");
		registerCurrency(BAM, "977", "Bosnia and Herzegovina convertible mark");
		registerCurrency(BBD, "052", "Barbados dollar");
		registerCurrency(BDT, "050", "Bangladeshi taka");
		registerCurrency(BGN, "975", "Bulgarian lev");
		registerCurrency(BHD, "048", "Bahraini dinar");
		registerCurrency(BIF, "108", "Burundian franc");
		registerCurrency(BMD, "060", "Bermudian dollar");
		registerCurrency(BND, "096", "Brunei dollar");
		registerCurrency(BOB, "068", "Boliviano");
		registerCurrency(BOV, "984", "Bolivian Mvdol (funds code)");
		registerCurrency(BRL, "986", "Brazilian real");
		registerCurrency(BSD, "044", "Bahamian dollar");
		registerCurrency(BTN, "064", "Bhutanese ngultrum");
		registerCurrency(BWP, "072", "Botswana pula");
		registerCurrency(BYN, "933", "Belarusian ruble");
		registerCurrency(BZD, "084", "Belize dollar");
		registerCurrency(CAD, "124", "Canadian dollar");
		registerCurrency(CDF, "976", "Congolese franc");
		registerCurrency(CHE, "947", "WIR Euro (complementary currency)");
		registerCurrency(CHF, "756", "Swiss franc");
		registerCurrency(CHW, "948", "WIR Franc (complementary currency)");
		registerCurrency(CLF, "990", "Unidad de Fomento (funds code)");
		registerCurrency(CLP, "152", "Chilean peso");
		registerCurrency(CNY, "156", "Chinese yuan");
		registerCurrency(COP, "170", "Colombian peso");
		registerCurrency(COU, "970", "Unidad de Valor Real (UVR) (funds code)");
		registerCurrency(CRC, "188", "Costa Rican colon");
		registerCurrency(CUC, "931", "Cuban convertible peso");
		registerCurrency(CUP, "192", "Cuban peso");
		registerCurrency(CVE, "132", "Cape Verde escudo");
		registerCurrency(CZK, "203", "Czech koruna");
		registerCurrency(DJF, "262", "Djiboutian franc");
		registerCurrency(DKK, "208", "Danish krone");
		registerCurrency(DOP, "214", "Dominican peso");
		registerCurrency(DZD, "012", "Algerian dinar");
		registerCurrency(EGP, "818", "Egyptian pound");
		registerCurrency(ERN, "232", "Eritrean nakfa");
		registerCurrency(ETB, "230", "Ethiopian birr");
		registerCurrency(EUR, "978", "Euro");
		registerCurrency(FJD, "242", "Fiji dollar");
		registerCurrency(FKP, "238", "Falkland Islands");
		registerCurrency(GBP, "826", "Pound sterling");
		registerCurrency(GEL, "981", "Georgian lari");
		registerCurrency(GHS, "936", "Ghanaian cedi");
		registerCurrency(GIP, "292", "Gibraltar pound");
		registerCurrency(GMD, "270", "Gambian dalasi");
		registerCurrency(GNF, "324", "Guinean franc");
		registerCurrency(GTQ, "320", "Guatemalan quetzal");
		registerCurrency(GYD, "328", "Guyanese dollar");
		registerCurrency(HKD, "344", "Hong Kong dollar");
		registerCurrency(HNL, "340", "Honduran lempira");
		registerCurrency(HRK, "191", "Croatian kuna");
		registerCurrency(HTG, "332", "Haitian gourde");
		registerCurrency(HUF, "348", "Hungarian forint");
		registerCurrency(IDR, "360", "Indonesian rupiah");
		registerCurrency(ILS, "376", "Israeli new shekel");
		registerCurrency(INR, "356", "Indian rupee");
		registerCurrency(IQD, "368", "Iraqi dinar");
		registerCurrency(IRR, "364", "Iranian rial");
		registerCurrency(ISK, "352", "Icelandic króna");
		registerCurrency(JMD, "388", "Jamaican dollar");
		registerCurrency(JOD, "400", "Jordanian dinar");
		registerCurrency(JPY, "392", "Japanese yen");
		registerCurrency(KES, "404", "Kenyan shilling");
		registerCurrency(KGS, "417", "Kyrgyzstani som");
		registerCurrency(KHR, "116", "Cambodian riel");
		registerCurrency(KMF, "174", "Comoro franc");
		registerCurrency(KPW, "408", "North Korean");
		registerCurrency(KRW, "410", "South Korean");
		registerCurrency(KWD, "414", "Kuwaiti dinar");
		registerCurrency(KYD, "136", "Cayman Islands dollar");
		registerCurrency(KZT, "398", "Kazakhstani tenge");
		registerCurrency(LAK, "418", "Lao kip");
		registerCurrency(LBP, "422", "Lebanese pound");
		registerCurrency(LKR, "144", "Sri Lankan rupee");
		registerCurrency(LRD, "430", "Liberian dollar");
		registerCurrency(LSL, "426", "Lesotho loti");
		registerCurrency(LYD, "434", "Libyan dinar");
		registerCurrency(MAD, "504", "Moroccan dirham");
		registerCurrency(MDL, "498", "Moldovan leu");
		registerCurrency(MGA, "969", "[9]	Malagasy ariary");
		registerCurrency(MKD, "807", "Macedonian denar");
		registerCurrency(MMK, "104", "Myanmar kyat");
		registerCurrency(MNT, "496", "Mongolian tögrög");
		registerCurrency(MOP, "446", "Macanese pataca");
		registerCurrency(MRO, "478", "[9]	Mauritanian ouguiya");
		registerCurrency(MUR, "480", "Mauritian rupee");
		registerCurrency(MVR, "462", "Maldivian rufiyaa");
		registerCurrency(MWK, "454", "Malawian kwacha");
		registerCurrency(MXN, "484", "Mexican peso");
		registerCurrency(MXV, "979", "Mexican Unidad de Inversion (UDI) (funds code)");
		registerCurrency(MYR, "458", "Malaysian ringgit");
		registerCurrency(MZN, "943", "Mozambican metical");
		registerCurrency(NAD, "516", "Namibian dollar");
		registerCurrency(NGN, "566", "Nigerian naira");
		registerCurrency(NIO, "558", "Nicaraguan córdoba");
		registerCurrency(NOK, "578", "Norwegian krone");
		registerCurrency(NPR, "524", "Nepalese rupee");
		registerCurrency(NZD, "554", "New Zealand dollar");
		registerCurrency(OMR, "512", "Omani rial");
		registerCurrency(PAB, "590", "Panamanian balboa");
		registerCurrency(PEN, "604", "Peruvian Sol");
		registerCurrency(PGK, "598", "Papua New Guinean kina");
		registerCurrency(PHP, "608", "Philippine piso");
		registerCurrency(PKR, "586", "Pakistani rupee");
		registerCurrency(PLN, "985", "Polish złoty");
		registerCurrency(PYG, "600", "Paraguayan guaraní");
		registerCurrency(QAR, "634", "Qatari riyal");
		registerCurrency(RON, "946", "Romanian leu");
		registerCurrency(RSD, "941", "Serbian dinar");
		registerCurrency(RUB, "643", "Russian ruble");
		registerCurrency(RWF, "646", "Rwandan franc");
		registerCurrency(SAR, "682", "Saudi riyal");
		registerCurrency(SBD, "090", "Solomon Islands dollar");
		registerCurrency(SCR, "690", "Seychelles rupee");
		registerCurrency(SDG, "938", "Sudanese pound");
		registerCurrency(SEK, "752", "Swedish krona/kronor");
		registerCurrency(SGD, "702", "Singapore dollar");
		registerCurrency(SHP, "654", "Saint Helena pound");
		registerCurrency(SLL, "694", "Sierra Leonean leone");
		registerCurrency(SOS, "706", "Somali shilling");
		registerCurrency(SRD, "968", "Surinamese dollar");
		registerCurrency(SSP, "728", "South Sudanese pound");
		registerCurrency(STD, "678", "São Tomé and Príncipe dobra");
		registerCurrency(SVC, "222", "Salvadoran colón");
		registerCurrency(SYP, "760", "Syrian pound");
		registerCurrency(SZL, "748", "Swazi lilangeni");
		registerCurrency(THB, "764", "Thai baht");
		registerCurrency(TJS, "972", "Tajikistani somoni");
		registerCurrency(TMT, "934", "Turkmenistan manat");
		registerCurrency(TND, "788", "Tunisian dinar");
		registerCurrency(TOP, "776", "Tongan paʻanga");
		registerCurrency(TRY, "949", "Turkish lira");
		registerCurrency(TTD, "780", "Trinidad and Tobago dollar");
		registerCurrency(TWD, "901", "New Taiwan dollar");
		registerCurrency(TZS, "834", "Tanzanian shilling");
		registerCurrency(UAH, "980", "Ukrainian hryvnia");
		registerCurrency(UGX, "800", "Ugandan shilling");
		registerCurrency(USD, "840", "United States dollar");
		registerCurrency(USN, "997", "United States dollar (next day) (funds code)");
		registerCurrency(UYI, "940", "Uruguay Peso en Unidades Indexadas (URUIURUI) (funds code)");
		registerCurrency(UYU, "858", "Uruguayan peso");
		registerCurrency(UZS, "860", "Uzbekistan som");
		registerCurrency(VEF, "937", "Venezuelan bolívar");
		registerCurrency(VND, "704", "Vietnamese đồng");
		registerCurrency(VUV, "548", "Vanuatu vatu");
		registerCurrency(WST, "882", "Samoan tala");
		registerCurrency(XAF, "950", "CFA franc");
		registerCurrency(XAG, "961", "Silver (one troy ounce)");
		registerCurrency(XAU, "959", "Gold (one troy ounce)");
		registerCurrency(XBA, "955", "European Composite Unit (EURCO)");
		registerCurrency(XBB, "956", "European Monetary Unit (E.M.U.-6)");
		registerCurrency(XBC, "957", "European Unit of Account 9 (E.U.A.-9)");
		registerCurrency(XBD, "958", "European Unit of Account 17 (E.U.A.-17)");
		registerCurrency(XCD, "951", "East Caribbean dollar");
		registerCurrency(XDR, "960", "Special drawing rights");
		registerCurrency(XOF, "952", "CFA franc");
		registerCurrency(XPD, "964", "Palladium (one troy ounce");
		registerCurrency(XPF, "953", "CFP franc");
		registerCurrency(XPT, "962", "Platinum (one troy oun");
		registerCurrency(XSU, "994", "SUCRE	Unified System for Regional Compensation (SUCRE)");
		registerCurrency(XTS, "963", "Code reserved for testing purposes");
		registerCurrency(XUA, "965", "ADB Unit of Account	African Development Bank");
		registerCurrency(XXX, "999", "No currency");
		registerCurrency(YER, "886", "Yemeni rial");
		registerCurrency(ZAR, "710", "South African rand");
		registerCurrency(ZMW, "967", "Zambian kwacha");
		registerCurrency(ZWL, "932", "Zimbabwean dollar");
	}

	function registerCurrency(bytes3 _alpha3, bytes3 _m49, string memory _name) internal {
		currencies[_alpha3] = Currency(_alpha3, _m49, _name, true);
		currencyKeys.push(_alpha3);
		emit LogCurrencyRegistration(
			EVENT_ID_ISO_CURRENCIES,
			_alpha3,
			_m49,
			_name
		);
	}
}
