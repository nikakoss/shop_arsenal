<?php $countries_sql="INSERT INTO \".DB_PREFIX.\"wc_countries (`code`, `continent_code`, `name`, `iso3`, `number`) VALUES    ('AF', 'AS', 'Afghanistan', 'AFG', '004'),    ('AX', 'EU', 'Aland Islands', 'ALA', '248'),    ('AL', 'EU', 'Albania', 'ALB', '008'),    ('DZ', 'AF', 'Algeria', 'DZA', '012'),    ('AS', 'OC', 'American Samoa', 'ASM', '016'),    ('AD', 'EU', 'Andorra', 'AND', '020'),    ('AO', 'AF', 'Angola', 'AGO', '024'),    ('AI', 'NA', 'Anguilla', 'AIA', '660'),    ('AQ', 'AN', 'Antarctica', 'ATA', '010'),    ('AG', 'NA', 'Antigua and Barbuda', 'ATG', '028'),    ('AR', 'SA', 'Argentina', 'ARG', '032'),    ('AM', 'AS', 'Armenia', 'ARM', '051'),    ('AW', 'NA', 'Aruba', 'ABW', '533'),    ('AU', 'OC', 'Australia', 'AUS', '036'),    ('AT', 'EU', 'Austria', 'AUT', '040'),    ('AZ', 'AS', 'Azerbaijan', 'AZE', '031'),    ('BS', 'NA', 'Bahamas', 'BHS', '044'),    ('BH', 'AS', 'Bahrain', 'BHR', '048'),    ('BD', 'AS', 'Bangladesh', 'BGD', '050'),    ('BB', 'NA', 'Barbados', 'BRB', '052'),    ('BY', 'EU', 'Belarus', 'BLR', '112'),    ('BE', 'EU', 'Belgium', 'BEL', '056'),    ('BZ', 'NA', 'Belize', 'BLZ', '084'),    ('BJ', 'AF', 'Benin', 'BEN', '204'),    ('BM', 'NA', 'Bermuda', 'BMU', '060'),    ('BT', 'AS', 'Bhutan', 'BTN', '064'),    ('BO', 'SA', 'Bolivia', 'BOL', '068'),    ('BQ', 'NA', 'Bonaire, Sint Eustatius and Saba', 'BES', '535'),    ('BA', 'EU', 'Bosnia and Herzegovina', 'BIH', '070'),    ('BW', 'AF', 'Botswana', 'BWA', '072'),    ('BV', 'AN', 'Bouvet Island (Bouvetoya)', 'BVT', '074'),    ('BR', 'SA', 'Brazil', 'BRA', '076'),    ('IO', 'AS', 'British Indian Ocean Territory (Chagos Archipelago)', 'IOT', '086'),    ('VG', 'NA', 'British Virgin Islands', 'VGB', '092'),    ('BN', 'AS', 'Brunei Darussalam', 'BRN', '096'),    ('BG', 'EU', 'Bulgaria', 'BGR', '100'),    ('BF', 'AF', 'Burkina Faso', 'BFA', '854'),    ('BI', 'AF', 'Burundi', 'BDI', '108'),    ('KH', 'AS', 'Cambodia', 'KHM', '116'),    ('CM', 'AF', 'Cameroon', 'CMR', '120'),    ('CA', 'NA', 'Canada', 'CAN', '124'),    ('CV', 'AF', 'Cape Verde', 'CPV', '132'),    ('KY', 'NA', 'Cayman Islands', 'CYM', '136'),    ('CF', 'AF', 'Central African Republic', 'CAF', '140'),    ('TD', 'AF', 'Chad', 'TCD', '148'),    ('CL', 'SA', 'Chile', 'CHL', '152'),    ('CN', 'AS', 'China', 'CHN', '156'),    ('CX', 'AS', 'Christmas Island', 'CXR', '162'),    ('CC', 'AS', 'Cocos (Keeling) Islands', 'CCK', '166'),    ('CO', 'SA', 'Colombia', 'COL', '170'),    ('KM', 'AF', 'Comoros', 'COM', '174'),    ('CD', 'AF', 'Congo', 'COD', '180'),    ('CG', 'AF', 'Congo', 'COG', '178'),    ('CK', 'OC', 'Cook Islands', 'COK', '184'),    ('CR', 'NA', 'Costa Rica', 'CRI', '188'),    ('CI', 'AF', 'Cote d\'Ivoire', 'CIV', '384'),    ('HR', 'EU', 'Croatia', 'HRV', '191'),    ('CU', 'NA', 'Cuba', 'CUB', '192'),    ('CW', 'NA', 'Curacao', 'CUW', '531'),    ('CY', 'AS', 'Cyprus', 'CYP', '196'),    ('CZ', 'EU', 'Czech Republic', 'CZE', '203'),    ('DK', 'EU', 'Denmark', 'DNK', '208'),    ('DJ', 'AF', 'Djibouti', 'DJI', '262'),    ('DM', 'NA', 'Dominica', 'DMA', '212'),    ('DO', 'NA', 'Dominican Republic', 'DOM', '214'),    ('EC', 'SA', 'Ecuador', 'ECU', '218'),    ('EG', 'AF', 'Egypt', 'EGY', '818'),    ('SV', 'NA', 'El Salvador', 'SLV', '222'),    ('GQ', 'AF', 'Equatorial Guinea', 'GNQ', '226'),    ('ER', 'AF', 'Eritrea', 'ERI', '232'),    ('EE', 'EU', 'Estonia', 'EST', '233'),    ('ET', 'AF', 'Ethiopia', 'ETH', '231'),    ('FO', 'EU', 'Faroe Islands', 'FRO', '234'),    ('FK', 'SA', 'Falkland Islands (Malvinas)', 'FLK', '238'),    ('FJ', 'OC', 'Fiji', 'FJI', '242'),    ('FI', 'EU', 'Finland', 'FIN', '246'),    ('FR', 'EU', 'France', 'FRA', '250'),    ('GF', 'SA', 'French Guiana', 'GUF', '254'),    ('PF', 'OC', 'French Polynesia', 'PYF', '258'),    ('TF', 'AN', 'French Southern Territories', 'ATF', '260'),    ('GA', 'AF', 'Gabon', 'GAB', '266'),    ('GM', 'AF', 'Gambia', 'GMB', '270'),    ('GE', 'AS', 'Georgia', 'GEO', '268'),    ('DE', 'EU', 'Germany', 'DEU', '276'),    ('GH', 'AF', 'Ghana', 'GHA', '288'),    ('GI', 'EU', 'Gibraltar', 'GIB', '292'),    ('GR', 'EU', 'Greece', 'GRC', '300'),    ('GL', 'NA', 'Greenland', 'GRL', '304'),    ('GD', 'NA', 'Grenada', 'GRD', '308'),    ('GP', 'NA', 'Guadeloupe', 'GLP', '312'),    ('GU', 'OC', 'Guam', 'GUM', '316'),    ('GT', 'NA', 'Guatemala', 'GTM', '320'),    ('GG', 'EU', 'Guernsey', 'GGY', '831'),    ('GN', 'AF', 'Guinea', 'GIN', '324'),    ('GW', 'AF', 'Guinea-Bissau', 'GNB', '624'),    ('GY', 'SA', 'Guyana', 'GUY', '328'),    ('HT', 'NA', 'Haiti', 'HTI', '332'),    ('HM', 'AN', 'Heard Island and McDonald Islands', 'HMD', '334'),    ('VA', 'EU', 'Holy See (Vatican City State)', 'VAT', '336'),    ('HN', 'NA', 'Honduras', 'HND', '340'),    ('HK', 'AS', 'Hong Kong', 'HKG', '344'),    ('HU', 'EU', 'Hungary', 'HUN', '348'),    ('IS', 'EU', 'Iceland', 'ISL', '352'),    ('IN', 'AS', 'India', 'IND', '356'),    ('ID', 'AS', 'Indonesia', 'IDN', '360'),    ('IR', 'AS', 'Iran', 'IRN', '364'),    ('IQ', 'AS', 'Iraq', 'IRQ', '368'),    ('IE', 'EU', 'Ireland', 'IRL', '372'),    ('IM', 'EU', 'Isle of Man', 'IMN', '833'),    ('IL', 'AS', 'Israel', 'ISR', '376'),    ('IT', 'EU', 'Italy', 'ITA', '380'),    ('JM', 'NA', 'Jamaica', 'JAM', '388'),    ('JP', 'AS', 'Japan', 'JPN', '392'),    ('JE', 'EU', 'Jersey', 'JEY', '832'),    ('JO', 'AS', 'Jordan', 'JOR', '400'),    ('KZ', 'AS', 'Kazakhstan', 'KAZ', '398'),    ('KE', 'AF', 'Kenya', 'KEN', '404'),    ('KI', 'OC', 'Kiribati', 'KIR', '296'),    ('KP', 'AS', 'Korea', 'PRK', '408'),    ('KR', 'AS', 'Korea', 'KOR', '410'),    ('KW', 'AS', 'Kuwait', 'KWT', '414'),    ('KG', 'AS', 'Kyrgyz Republic', 'KGZ', '417'),    ('LA', 'AS', 'Lao People\'s Democratic Republic', 'LAO', '418'),    ('LV', 'EU', 'Latvia', 'LVA', '428'),    ('LB', 'AS', 'Lebanon', 'LBN', '422'),    ('LS', 'AF', 'Lesotho', 'LSO', '426'),    ('LR', 'AF', 'Liberia', 'LBR', '430'),    ('LY', 'AF', 'Libya', 'LBY', '434'),    ('LI', 'EU', 'Liechtenstein', 'LIE', '438'),    ('LT', 'EU', 'Lithuania', 'LTU', '440'),    ('LU', 'EU', 'Luxembourg', 'LUX', '442'),    ('MO', 'AS', 'Macao', 'MAC', '446'),    ('MK', 'EU', 'Macedonia', 'MKD', '807'),    ('MG', 'AF', 'Madagascar', 'MDG', '450'),    ('MW', 'AF', 'Malawi', 'MWI', '454'),    ('MY', 'AS', 'Malaysia', 'MYS', '458'),    ('MV', 'AS', 'Maldives', 'MDV', '462'),    ('ML', 'AF', 'Mali', 'MLI', '466'),    ('MT', 'EU', 'Malta', 'MLT', '470'),    ('MH', 'OC', 'Marshall Islands', 'MHL', '584'),    ('MQ', 'NA', 'Martinique', 'MTQ', '474'),    ('MR', 'AF', 'Mauritania', 'MRT', '478'),    ('MU', 'AF', 'Mauritius', 'MUS', '480'),    ('YT', 'AF', 'Mayotte', 'MYT', '175'),    ('MX', 'NA', 'Mexico', 'MEX', '484'),    ('FM', 'OC', 'Micronesia', 'FSM', '583'),    ('MD', 'EU', 'Moldova', 'MDA', '498'),    ('MC', 'EU', 'Monaco', 'MCO', '492'),    ('MN', 'AS', 'Mongolia', 'MNG', '496'),    ('ME', 'EU', 'Montenegro', 'MNE', '499'),    ('MS', 'NA', 'Montserrat', 'MSR', '500'),    ('MA', 'AF', 'Morocco', 'MAR', '504'),    ('MZ', 'AF', 'Mozambique', 'MOZ', '508'),    ('MM', 'AS', 'Myanmar', 'MMR', '104'),    ('NA', 'AF', 'Namibia', 'NAM', '516'),    ('NR', 'OC', 'Nauru', 'NRU', '520'),    ('NP', 'AS', 'Nepal', 'NPL', '524'),    ('NL', 'EU', 'Netherlands', 'NLD', '528'),    ('NC', 'OC', 'New Caledonia', 'NCL', '540'),    ('NZ', 'OC', 'New Zealand', 'NZL', '554'),    ('NI', 'NA', 'Nicaragua', 'NIC', '558'),    ('NE', 'AF', 'Niger', 'NER', '562'),    ('NG', 'AF', 'Nigeria', 'NGA', '566'),    ('NU', 'OC', 'Niue', 'NIU', '570'),    ('NF', 'OC', 'Norfolk Island', 'NFK', '574'),    ('MP', 'OC', 'Northern Mariana Islands', 'MNP', '580'),    ('NO', 'EU', 'Norway', 'NOR', '578'),    ('OM', 'AS', 'Oman', 'OMN', '512'),    ('PK', 'AS', 'Pakistan', 'PAK', '586'),    ('PW', 'OC', 'Palau', 'PLW', '585'),    ('PS', 'AS', 'Palestine', 'PSE', '275'),    ('PA', 'NA', 'Panama', 'PAN', '591'),    ('PG', 'OC', 'Papua New Guinea', 'PNG', '598'),    ('PY', 'SA', 'Paraguay', 'PRY', '600'),    ('PE', 'SA', 'Peru', 'PER', '604'),    ('PH', 'AS', 'Philippines', 'PHL', '608'),    ('PN', 'OC', 'Pitcairn Islands', 'PCN', '612'),    ('PL', 'EU', 'Poland', 'POL', '616'),    ('PT', 'EU', 'Portugal', 'PRT', '620'),    ('PR', 'NA', 'Puerto Rico', 'PRI', '630'),    ('QA', 'AS', 'Qatar', 'QAT', '634'),    ('RE', 'AF', 'Reunion', 'REU', '638'),    ('RO', 'EU', 'Romania', 'ROU', '642'),    ('RU', 'EU', 'Russian Federation', 'RUS', '643'),    ('RW', 'AF', 'Rwanda', 'RWA', '646'),    ('BL', 'NA', 'Saint Barthelemy', 'BLM', '652'),    ('SH', 'AF', 'Saint Helena, Ascension and Tristan da Cunha', 'SHN', '654'),    ('KN', 'NA', 'Saint Kitts and Nevis', 'KNA', '659'),    ('LC', 'NA', 'Saint Lucia', 'LCA', '662'),    ('MF', 'NA', 'Saint Martin', 'MAF', '663'),    ('PM', 'NA', 'Saint Pierre and Miquelon', 'SPM', '666'),    ('VC', 'NA', 'Saint Vincent and the Grenadines', 'VCT', '670'),    ('WS', 'OC', 'Samoa', 'WSM', '882'),    ('SM', 'EU', 'San Marino', 'SMR', '674'),    ('ST', 'AF', 'Sao Tome and Principe', 'STP', '678'),    ('SA', 'AS', 'Saudi Arabia', 'SAU', '682'),    ('SN', 'AF', 'Senegal', 'SEN', '686'),    ('RS', 'EU', 'Serbia', 'SRB', '688'),    ('SC', 'AF', 'Seychelles', 'SYC', '690'),    ('SL', 'AF', 'Sierra Leone', 'SLE', '694'),    ('SG', 'AS', 'Singapore', 'SGP', '702'),    ('SX', 'NA', 'Sint Maarten (Dutch part)', 'SXM', '534'),    ('SK', 'EU', 'Slovakia (Slovak Republic)', 'SVK', '703'),    ('SI', 'EU', 'Slovenia', 'SVN', '705'),    ('SB', 'OC', 'Solomon Islands', 'SLB', '090'),    ('SO', 'AF', 'Somalia', 'SOM', '706'),    ('ZA', 'AF', 'South Africa', 'ZAF', '710'),    ('GS', 'AN', 'South Georgia and the South Sandwich Islands', 'SGS', '239'),    ('SS', 'AF', 'South Sudan', 'SSD', '728'),    ('ES', 'EU', 'Spain', 'ESP', '724'),    ('LK', 'AS', 'Sri Lanka', 'LKA', '144'),    ('SD', 'AF', 'Sudan', 'SDN', '729'),    ('SR', 'SA', 'Suriname', 'SUR', '740'),    ('SJ', 'EU', 'Svalbard & Jan Mayen Islands', 'SJM', '744'),    ('SZ', 'AF', 'Swaziland', 'SWZ', '748'),    ('SE', 'EU', 'Sweden', 'SWE', '752'),    ('CH', 'EU', 'Switzerland', 'CHE', '756'),    ('SY', 'AS', 'Syrian Arab Republic', 'SYR', '760'),    ('TW', 'AS', 'Taiwan', 'TWN', '158'),    ('TJ', 'AS', 'Tajikistan', 'TJK', '762'),    ('TZ', 'AF', 'Tanzania', 'TZA', '834'),    ('TH', 'AS', 'Thailand', 'THA', '764'),    ('TL', 'AS', 'Timor-Leste', 'TLS', '626'),    ('TG', 'AF', 'Togo', 'TGO', '768'),    ('TK', 'OC', 'Tokelau', 'TKL', '772'),    ('TO', 'OC', 'Tonga', 'TON', '776'),    ('TT', 'NA', 'Trinidad and Tobago', 'TTO', '780'),    ('TN', 'AF', 'Tunisia', 'TUN', '788'),    ('TR', 'AS', 'Turkey', 'TUR', '792'),    ('TM', 'AS', 'Turkmenistan', 'TKM', '795'),    ('TC', 'NA', 'Turks and Caicos Islands', 'TCA', '796'),    ('TV', 'OC', 'Tuvalu', 'TUV', '798'),    ('UG', 'AF', 'Uganda', 'UGA', '800'),    ('UA', 'EU', 'Ukraine', 'UKR', '804'),    ('AE', 'AS', 'United Arab Emirates', 'ARE', '784'),    ('GB', 'EU', 'United Kingdom of Great Britain & Northern Ireland', 'GBR', '826'),    ('US', 'NA', 'United States of America', 'USA', '840'),    ('UM', 'OC', 'United States Minor Outlying Islands', 'UMI', '581'),    ('VI', 'NA', 'United States Virgin Islands', 'VIR', '850'),    ('UY', 'SA', 'Uruguay', 'URY', '858'),    ('UZ', 'AS', 'Uzbekistan', 'UZB', '860'),    ('VU', 'OC', 'Vanuatu', 'VUT', '548'),    ('VE', 'SA', 'Venezuela', 'VEN', '862'),    ('VN', 'AS', 'Vietnam', 'VNM', '704'),    ('WF', 'OC', 'Wallis and Futuna', 'WLF', '876'),    ('EH', 'AF', 'Western Sahara', 'ESH', '732'),    ('YE', 'AS', 'Yemen', 'YEM', '887'),    ('ZM', 'AF', 'Zambia', 'ZMB', '894'),    ('ZW', 'AF', 'Zimbabwe', 'ZWE', '716');";?>