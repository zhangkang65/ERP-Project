/*
SQLyog Ultimate - MySQL GUI v8.2 
MySQL - 5.7.24-log : Database - erp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`erp` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `erp`;

/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_evt_log` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('2',1,'Desktop/leaveBillProcess.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0‰\0\0ˆ\0\0\0;ã‹O\0\0\0sRGB\0®Îé\0\0\0gAMA\0\0±üa\0\0\0	pHYs\0\0Ä\0\0Ä•+\0\0\0!tEXtCreation Time\02020:03:29 21:30:44¼_£D\0\00üIDATx^íİtå½7ğÙ?i6Ea©V6U!\\mÙX ­Íò\'$9U	-špE’ô$§(p´RÖ¢õ‚W½àyo\rŞ·œ€´7 WY)Úƒo+	ø–Äzš`k	hÔÊ†Zİ¼XÙ’¼¿çÉd2û‡Mvv÷™™ïç<gygşì0;óİg&›mppP\0Œÿ\0 d\0ˆÙ\0\"B6€ˆM\0 \"d\0ˆÙ\0\"B6€ˆM\0 \"d\0ˆÙ\0\"B6€ˆM\0 \"d\0ˆÙ\0\"B6€ˆM\0 \"d\0ˆÙ\0\"B6€ˆM\0 \"d\0ˆÙ\0\"B6€ˆM\0 \"ü]_È˜P(ÔÜÜÜÙÙyäÈ‘`0È:].Waa¡×ë-++s»İ¬,ÙĞØØ¸}ûö––\n éÓ§éK†bˆëÕöö7ß<N±E	µbÅŠšš\Z6	,ÙiE£¤5kÖĞ€è{Ëï˜?>ï¡½½}Ç“O¾şú‘ººº’’ŞÖ€l‚ôÙ¼yósÏ=÷¿şó§ÅÅÅ¼+tÅ·îŞµùùù”PtÅÇ{Áìp/Ò®Ôª««{zz^ıÃk£\n&B}ÿç·¿»şK_Z°`A à½`v7AÊQ0•––®^½ú¶Å·ó®1¡K¼®»w÷îİyyy¼ÌÙ)G#¦òòò$ƒ‰¡ë»ïß}×pqgz¸¦ƒÔÚ¼y3\rst	&B×wëÖıÂ·Á¼0n‚êìì¬­­}õ¯ñ¶Nî¾ë®™3g¬\\¹’·ÁŒMB3gÎÜñó_Ğ`‡·uŠæÎíê:Š+;Ã5¤Jcc#]ÍéLÄãñ”——oÛ¶·ÁŒ0n‚T)--}à\'ö	¢¡Ó×nøêéÓ§yLã&H‰`0ØÙÙ™¢`\"4tš2eJ[[oƒé › %è‚®¢¢‚7Rã–[omjjâ\r0d¤D{{{aa!o¤Fa¡ã&C6AJœ<yòª«\'óFjäåM9qâ$o€é › %€ÇãáÔ˜4ÉÓİ_¯3-d¤eÓ¤I“x#5\\.W(â\r0d¤„Ûíîéá_e	0È&H	º ºy#5N:9e\n¾À´Myyy”¼‘\Z”}Oj/!ƒMÓ§OıÈë¼‘\ZÇuM›æå\r0d¤DEEÅ¾}©ı`ä/÷ì©®®â\r0d¤]Ó¹\\.\ZÚğ¶ŞB¡P{{;şÀ‰!› UV¬X±ãÉ¼¡·\'ŸÜ¾té2|GŠ‰á{ Uhh“ŸŸğĞ+º“Öü¥ë¯ok;œêwBaÜ©BƒšM›6­[w/oë‡Mååå&sC6A\nUUUÑgŸ®ßpìX×ÓO=õÈ£ò6˜®é µ‚Á`YYÙÏñ]~ŞOk»éÆ¯ï}şùk¯¹†wIaÜ©åv»wîÜ¹ü{ßKş£˜LË—ï‘GÿÁdÈ&H9¯×»mÛ¶Å·İÖŞŞÎ»F.ånYøÍ;î¸sá7¿Á»ÀÔpMiB£ŠŠŠyóŠ¿Ï=4˜â½	…BO>¹ı—{öĞ…áõ_ü\"ï³Ã¸	Ò„ò¨¹¹™*Esçş×=A‰Ãúã{ê©]7|õ«ïœzçW¿ş\r‚ÉR0n‚t=öØÎ;çßzë­Ó§ÏĞü¨#GëêÚ÷«}/íßë­å=´1/ß7`9È&È\Z7Ñ0ª©©©££ƒÂˆ÷Ê(ª¦y½‹**ÊÊÊFuõf‚lQÔÖÖ644ğX²	Da³áh„a¸\0\"B6€ˆM\0 \"d\0ˆÙ\0\"B6€ˆM\0 \"d\0ˆÙ\0\"B6€ˆM\0 \"d\0ˆÙ\0\"B6€ˆMI~¿ßf³åääÌœ9“š¹¹¹Ô7n\\WW›,Ù™”M¡P¨³³“*@€‘M€oó‚L¢Tr»İ½½½¼-IgÎœ9zô(¾×â0n‚Lr¹\\k×®u:¼-IsæÌ©©©A0ÆMy§»»›*•••ííí4h¢Ìb“À²0n‚ÌÛ³gOVVUzzzêêêL@MyóæÍ+**bõŠŠ\nV‹Ã5!äææÒÕœ×ëå]`mÈ&ş¨áh°ºP(ÔØØØÔÔD#—“2>Ábòdn·»¼¼œ®+ñƒÂŒC6YZssóªU«|>ßÂ…\'y<trN™2…O³˜S§NQ.÷ƒûöí;xğà†\rjjjø4Èd“EƒÁ5kÖœ>}zÇÏwx<Ş2Ú9ëî]×İİ½sçNìœLA6Y{¥¥¥wÿ®¥K—ò.ˆ°ÿK<üˆßï§á$ï‚4B6YQmmíÜ¢9K—~—·!†ÖÖƒO--­¼\ri„l²œæææ-[ê~ı›&Ş†¸xàÁ	ã\'ÜÿOxÒÙd-¡P(??ÿĞ+<I¼â¢=6wN‰ßÿ>x•fø\\¸µøış’’ç\nI¢÷¤p¹yá’,ç§)Ê\"–*.Wö’%‹wíÚÅ÷ ¤²ÉZšššŞRÆ’tó7şõ™u²ğxßà½ƒ½ƒ8{¡îùßí/Ø~~°íÜ`û¹ÁCÿ|)4øÄ¡×ïº{-_Ìbæ—İDÂ¼é‚k:k¡º½{Ÿæıkf9/9;8h”.Hı’+Kzğ\ro~Üwã{óÂÀ@xèĞOS³¤W,™=£ïÂÇlAK¡ËºÏ^~Õ¹sçxÒã&k	“TtÔc²¥	i‚S¢Ë¶’9³?75ïëóæzœ’Û!§â”.wHn§M^² …\n]ÖQ<Éÿ}Hd“µƒA·{¼êÄ“hÜ|¶WêrøÍ.\\÷ƒ»]ÙÙï¿¸Ô!sHôè–¤qöğÌª­V İpMg-6›­ïBo„¯é&|Ü?øIH¢Ë·Ë.‘ÏŸ/((è:öMY\\½ä—Ïß\0~í7|åËêe-…vÎ”4Ã¸É‚”±@ød£Ñ’İ¾©ôa¯täÍ÷>\nNGÎ„Kø5Ü¡3S½¬¥\n¤²É‚Fœr6[¸ĞeQÏ\'ç¯ğ\\5q¢ûS¶ş’ù{%éãóÒ\'çÃËôöõ‡ÿ±¬¥\n¤²ÉrlÒ R¨™c“r²%—KrÚ¥|ïµÛŞ{åÕ“¿|ƒoQÕíÁôÉ€tN’Âé$)êe-UÂÿyH/Üo²›ÍváÂ‡¼!I7Ş´è‰­;Î_è¿Ğşd³ÛŞP¯+\'§¯¯ÎIºÜsØmã>í:tà·­/ïö™m|I‹q:?ƒ3%ÍMÖ\"gÓ?xC¶zõı[·nçØn[¼ø9ÿÅg3+§ó2œ)i†l²9›>à\rH˜Óy9Î”4C6YK8›úÿÎ0§ã³8SÒÙd-r6á\rH˜ÓqÎ”4C6Y‹œMá¿ £âtLÂ™’fÈ&k‘³)À0§Ãƒ3%Íğù&òûıqÿ”c(£-Ñ]lWÃØ!›ÌæøñãÕÕÕS§N?~üóÏ?Ï{AWÁ`ğÛßş6\rBiWÏ=ñ”\nÈ&³™<y²İ~YÏ=KgÎõ×_qæhFú§#W©¨‹2ƒR¢vF–—MpmI—aÛ¶mËÍÍ}öÙg©îr¹èZÙ$Ğî7™9ÀğM¥œœœo}ë[?ûÙÏè¢·úşş¿ñ	ºr8®dkV*šºZ¬~µøËÒ#otÑÕ\r=)]]]ßüæ7ß~ûmŞ+I>Ÿvõ‰\'xô#z6…B¡¶¶¶–––ÖVşwxh€!t2úûßã5]9W±5S…õ0Q;#]t¶X›­<oJÑ³”””ĞqÈÛB’ÿj:ÿSzÅÅÅ”›Ä¸<]Ül¢ãà‰\'hnn¦ıK;šÖ¯~„•Ù§Ã±§‡ÑREE=ƒÁúúz¯×+›Şe“ôâp\\ÍkC”§ I£z:õü±êŠ8Ï«;z.:SèMqùòåÇ÷]şD—^zé5×\\ÓÑÑÁš™¥~Û¦#°½½Ş×gÌ˜±zõjv‹ˆÙDƒäêêjªqŸf|ã)†&NœHJ¢¢¢¢C‡mØ°¡ªªŠM•³éV×—Ã1™­™*¬‡Ñ<2›¦ÎÄšªÔ©Bê¥\"W’\nô,Ê™Bo9+W®ì§ÑÚ{áñZvv6ísao9±·IÊ¬İ»wëÏX	—MôÂ¯Y³†Şä•±†ˆ°ñ§N¢C6 ««‹\"é¾ûîSêål:Åºr8¦\\tÍ‘óhz¨Ék”ÙØ\"±æ¼è6Œ\r=úL	…B›7onhhøÌg>óá‡655Ñğ„ORgggmm-Ê»”øÄÊ¦ÆÆFÊø^xÁˆÉâl<m	½“S<E^?¦4›è1jj°gT2EÙ€X=	ÖÕDÓÔ­<òL¡ÁJèå6Äèò”âişüù555¼Kle½Ò‹-:pà€ƒÉ(/g“Î?Ip8xª×L±ˆMŠ:ƒºó¢uª°Eä\nõBÏ%ÚÆP<-X°`Ó¦M>Ÿw	L lš5kV]]!öZ$£l|8›Nğ†®ö©lÍ¬B¬?êÓ)3k(KERæ×<ë$±Ö©Z¹	²‰Ğ›(ÅSGG‡øŸÉå³—tâñx\ZLFÛx:ÇRQ”5³\n¥ÉÛT†:‡‹\"oÓ£¦_.|)yÁuõ<J…V¢U*ŠIĞe~YYÙ¶møşRQ²iûöí+V¬à\r£1ÚÆkÎ:½Š²fVa#ŠÃş/TúşJuzdMõlÒP^ƒ¦h)\n¯¿*E=\nŠyĞ±JG,oLˆl\nç¼m(ÜxÍY§CqØ¯ak¦JÿÀ[¬I¬°~*4‰Š²k*óD”ğ\n£Š$¶’áä57SPÌÃëõºİî¶¶6Ş•ÙD»É WsÄ€¯9ët(ıoRa¥©õ‘%Ö¤8ók*¬k~Š©Ğ‹lJHkkkqq1o7^sÖ¡$RL…Xå—À„%D6Ñ5‘à]‹ÃĞÖD—u]]]¼!*!²)\n÷[&·ñê?	‰’`áûÎ,èˆ¥ã–7D%Ê½pÇÃFcÀW_ª $XL%//ï¤ğ_æ!D6ƒA#~œ1àÆkÎ:”D\n¤›M„O»ÚlBlÆØkãikşÂ0»ı:s|.\\!şq+Ä¸	ÒfèF”(£*nÈ&kñx<Àß#N<”‹H7d“µ„x|ìmº”GI¼Ğ£ıÆ÷ ¤²ÉZŠ‹‹¶¾Æ˜¶¶×û{Æ…l²–ªªªÆÆ—qËiTe_ÓËååå|Bº ›¬%//¯²réc›¡9ıPb¿ÿE—ëSFü[\0F‡Ï$ËpOƒ¦Š6mºÇç+à]C ğAié‡?åvÏå]fÏ€p\\.W}ıÓ«V=ÚÕuB3F@Q\n¦êê××ßo¾`2d“y½ŞúútâmŞüßš…•ÆÆ—KK—oØpgIÉr¾× ½pM—,ãn<]Ü=ôĞª¶¶?-[vKYÙlç2>ÁÂ‚Á³ÍÍ¿ojj\r…z\Z6ºİFıê‹ÿ¸E6%ËĞOZZZvízœNÈ@à¼ËÂÜîKËÊf•——TU­ç]&…lJ²	HmmmCCo@Š!›‚l‚=™NâïmÜ\0!›\0@DÈ&\0²	\0D„l‚¤Øl6¥¢Æ:Õ¢vÄ‚lİáí‘¨ñ‰C6näSoGLñÚ6@$|¾)Y†ŞødD&‹²Æ¶O,»\'3Bü½qŒÙìàV*t¸3òôÔQg\0Ğ@6>XB)x¯ŒÂHİCuÄ\\²	’Å‚†5”©š0Šìˆ„l‚1¢paùÂÆDô¨®ğLª©lfzTzÂ“aôØdÔu“â~˜r¼\Z‘¡7>yÊŸU”S%ê>‰¿¯,¾\'cQv)Qö²·Õ=¬UäocÜ:£#>êA¯œN¼\r‰aû“ğ¶Œš‘á\"ÏŸl4È&H9:‹”‰Y“MòûıTÏÉÉ™9s&5sss©9nÜ¸®®.6ew)¨‡íIŞ6#dŒrn¨Ozd”:M\"òŒa¬É&eggSO(êìì¤J  ÇÂÂBdSl—R…íFÖ©÷+Ç»Œ‰ÿ\'3‹v¢›16†ŞøŒ£Tr»İ½½½¼-IgÎœ9zô(õó.ËcÇXü#M™\Z§¢m\"À¸	2Éår­]»Öétò¶$Í™3§¦¦Á¤AQ¢ydÔu“\";Åğ8½ñ‚ğx<İİİT©¬¬loo§Ae›jì`SrJ]]‘§„i&©Eí\nÆMy{öìÉÊÊ¢JOOO]]‚)’&qX3j¾P‚w²	2oŞ¼yEEE¬^QQÁ*ÀP\0Ef5£“™ñß3ô^6ı!’@ 77—®æ¼^/ï‚ÊÁÆ*êcê¬Uä!*şq+Äö‰¿›â0ôÆ{2=´”ŠÜ=¼Óâì½¨“âÌ/!¶Oüİ‡¡7„B¡ÆÆÆ¦¦&\Z¹œ”ñ	“\'s»İåååt]iú\"›‚lÊ”æææU«Vù|¾…Nòxèäœ2e\nŸf1§N¢\\î	÷íÛwğàÁ\r6ÔÔÔğif„lJ²)ı‚Áàš5kNŸ>½ãç;<ïíœu÷®ëîîŞ¹s§Yw²)!È¦4£s¯´´ôîïßµtéRŞöïé‘‡ñûı4œä]&‚lJ²)ÍjkkçÍYºô»¼\r1´¶¤xjiiåmA6%Ù”NÍÍÍ[¶Ôıú7M¼\rq=ğÀƒÆO¸ÿşŸğ¶Y ›‚lJ›P(”ŸŸè•Ï$ŞqÑ›;§ÄïÎd¼ÿ¸ÅçÂ­Åï÷—””x<WH—áróÂ%YÎO\'R”E,U\\®ì%KïÚµ‹ïAHd“µ455-¼¥Œ7$éæoüë3/şêdÿàñ¾Á7z;{ÿpöBİó¿Ûÿ^°ıü`Û¹Áösƒ‡ş9øRhğ‰C¯ßu÷Z¾˜ÅÌ/»‰.„yÒ×tÉ2ÖÆÓİŞ½ÏNó~5³œ—œ´\rJ¤şÉ•%=øÀ†Ç7?î»ñÆ½¿ya` <tè§©YRÇ«G–ÌÑwác¶ ¥Ğeİg/¿êÜ¹s¼m\n¸¦±Iª:ê±HYƒÒ‡4Á)Ñe[ÉœÙŸ›š÷õys=NÉíÆSqJ—;$·“ıº–² …\n]ÖQ<Éÿ}Hd“µƒA·{¼êÄ“è½ól¯Ô7 9äğ)š]¸îw»²³ß?p©C\ZçèÑ-Iãìá™UZ­@ºáš.YÆÚxÚÚ¾=¼¾¦›ğqÿà\'!‰.ß.»D\Z<¾   ëØ[4eqõ’_>;|øµ?vÜğ•/«—µÚQÆ=D£Â5ˆH¥H4Z²ÛÂ7•>ì•¼ùŞGÁ ÃéÈ™p	¿†2t«—µTtC6YĞˆSÎfº £,êùäü«&NtÊÖ_2a¯$}|^úä|x™Ş¾şğ?#–µT1•@  şï	\"›,Ç&\r*…š96)\'[r¹$§]Ê÷^»íé½W^=ùË7øUİIŸHç$)œNò‘¢^ÖR%üŸ7‘P($şã~S²w¿éÂ…yC’n¼iÑ[wœ¿Ğ¡?üÉf·9½¡^WNN__“t¹ç°ÛÆ}ÚuèÀo[_Şÿì3Ûø’ãt~Æ¸‡h¤æææ\'xâÅ_äm!!›’eÀlúoÈV¯¾ëÖí¼Ûm‹?ç¿ølfåt^f¦lÚ¸q£ò(,dS²˜Mğ$Ìé¼ÜLÙ´`Á‚Õ«W—•\rÿ†€€MÉ2^6õÿ7 aNÇgM“M@`Ö¬Yâÿ@Ü· :ÇPF[ÌÃï÷WTTà^xB0nJyÜşº0*NÇ$sŒ›Ø—ä>|XüÏ ›’eÀl\nğ$Ìéğ˜#›jkk‹‹‹\rñg\ZpMgAt¡Œ¶˜Á–-[èRÎ(?Ù`~t)G#¦cÇÕ××ó.á!›,H3\"àÅéÈÕô°¢ôGVÆVâ/ÈÊ/:Í«hæL¸U0¤áR~~>]Ê(˜î7%Ëp÷›úûÿÆêÇ•¬›“f‹U‰J³ÚÈ9/º8MÕ¬„¨Q¯!êÓÅz\nMÔe£¢9uˆ¶´´´µµµ··wvvVTTÜwß}†ûC{È¦d0›Şcu‡ã*¥I™šHE:y-|¶k§’¨K1êIñëš•D6y-‚z6¢S3If+))¡·…G[ëóù\n©bĞ¿ŸlJ–³é]ŞÉá¸:ru²\nMRfˆ¬¨©a¨KÍjÕ³i&Åéd\"{â ™Y%Î\"4qQƒB6%Ë€Ùôo„O¹É¼A™æauõÌÔ£ôk°Ù¢Nb\"ŸT³~¥©©(Ô“X\"Ö\"Š¨“Øzb-BhdSš!›’eÀl:ÅáSnŠÒ¼h]]¡GeøS‰zå‘b=Q/9[dU\"©×Ã°™#û4²)ÍğsºğéÊk#ëAg+šºZdOœÓ8ôD‘k¦¥S½…ê­R×¶TÔÂç\0±Y.›(}¬‡ŞY•÷FyzLlÃ¢ÿ£Rè>ÉŠ¦Îf`ç¼ÜYYj¨µ0šNu‰>UI¹B=,q”ÂK)[¨ÚÈÈÇèeäÚ4…Ñtª¤›å²‰Ò‡ám5)q\";£â“Ë68\\Âç+š:›¡à„RR‰Zdá•hú•B4=r¡çRJ¸‡2qà[=òÎ¡2ÜÃÖ¦z¤IQMä•¡•°Â&…ìQ í¬xM9ğaÁdüQ‚èLS\nÿo³¢©«çQWö©¬2Tg“Ô…‹1•\nÑôZŠy3(°ŞVêÊr…¯dhR¸©,\"W†ÿ;š¶ +òÚÃıÒ\r÷›†/å¢Æõ(x—á\rŸrıU5‡\'Åè§¸ùyÒpÏPE]†ÑüS©MO¸ĞÌlıê§`=êõ°¦<Ïğ‚šy¨Dö(ëTŠ<ƒÚˆ©#¤›öB&#è´Oçf°§‹ÿ¤ÊÔ8&şzDC[Û?ğoŒä°_9‰:é‘õ«g`ı$ÖÚ4”ùcQ¯Gy\"Í3võ³JÔ©‰ 5èU6!Î«4ŸŞôt¼Foˆ#CJ©\'Ra4MÁÑÖö¼É0‡ıóz•ÍÁŠ×tt1¼}1t>Ş0ú£Œ¶@ºYô~“:k(¤X“#K1w@ê	q=5R„Å{:õój¶!Î&%>§€hkñ$ÌnŸf WÙ„8¯2uz+ÏË*êÍ :«D¥ŞÚLmüØĞÖtñ$Ìn÷\ZèU6!Î«ôŸŞ,zèI•ŠÜ=¼%q6I3)Îœ¢­8Ê0»=ß@¯²9q^ëôÖ0`6ı…7 avûuÈ¦4Ãg/­Åår…B!\Z)¢Œ²@º!›¬Åãñ8ñP.Z İMÖâõz»½M—ò(‰Úc´ßø„tA6YKqqñÁÖ×xÓÖöºÏçã\rHd“µTUU56¾Œ[N£*ûš^.//ç{ÒÙd-yyy••KÛüÍé‡«øı/º\\Ÿª¨¨à{ÒŸ!H–á6MmÚtÏWÀ» †@àƒÒÒ;~ÊíË» ]0n²—ËU_ÿôªUvuĞŒPÔ…‚©ºúÇõõ÷#˜2ÙdE^¯·¾~\'x›7ÿ·æ„Da¥±ñåÒÒå6ÜYR²œï5H/\\Ó%Ë¸Ow=´ª­íOË–İRV6Ûã¹ŒO°°`ğlsóï›šZC¡Ş††nw1Ÿ\0i‡lJ–¡7´´´ìÚõ8À?x—…¹İ—–•Í*//©ªZÏ» CMÉ2z6‰£¶¶¶¡¡7ÀòMÉB6é{Ôp/\0D„l\0!›\0@DÈ&\0Q²Ùd‹ø^íÈEœI`2x­!I:üdDóãMS#êÔø‹ÎĞŸ8úoòZ4lÄ™\'‘]d‘=		ÒÿhĞañiB3ú ´Èç¿ùŠ+ÍQí‹ìIHPRGL¼&c«RwªWçÈ3ôAi‘3Šı7Õ/.Ã:£NÒ¸è^²È„%{4h\'¥«_¡î‰œj †ŞøÄÅùoÆ)ß?Ù“ =NÇ-zäí!¬‡Õ”~0öÚ©ñ	*|ÂŞ0J:d?c¿éQ?›Ä*„Õå‰`0ìdx×H|ÚŞ0J:dÓ˜A¸¦Äß©†ğ^€QJùg/ù:tÇhê` üe“ñ.öFE4u€ÑÒ?›èX¤£V9\"åƒ3,NŒ‚¿f*|‚Œ¥{¤IJxEM1€øôÏ&LšÃ‘uòX{Å£\0•T6)‰£yJúpT:Ádè•|•ÙK¯`SFKˆÔ #Ø¸áeè\nö$¨¥ü^8\0À ›\0@DÈ&\0²	\0D„l\0!›\0@DÈ&\0²	2Éï÷Ûl¶œœœ™3gR377—šãÆëêêb3€e!› “²³³é1\nuvvR%Ğcaa!²	ğ¹ğdáÓÌÉ Tr»İ½½½¼-IgÎœ9zô(õó.°$Œ› “\\.×ÚµkN\'oKÒœ9sjjjL€qS²0nJÇãéîî¦Jeee{{;\rš(³Ø$°,Œ› óöìÙ“••E•ºº:ddŞ¼yóŠŠŠX½¢¢‚UÀâpM—,\\Óé\"äææÒÕœ×ëå]`mÈ¦d!›ô‚=	jÈ¦d	»ñ¡P¨±±±©©‰†$\'e|$!Oæv»ËËËéò?OLdS²ÄÜøæææU«Vù|¾…Nòxètš2e\nŸI8uê¥|O0¸oß¾ƒnØ°¡¦¦†O]!›’%ÚÆƒÁ5kÖœ>}zÇÏwx<Ş)@»zİ½ëº»»wîÜ‰]­;dS²„Úx:[JKKïşş]K—.å]bû÷¿ôÈÃøı~\Zœò.Ğ²)YBm|mmíÜ¢9K—~—·!-Z[R<µ´´ò6èŸo2æææÓ§ßG0¥_qñ¼ÂÂÂGÿãŞ=`Ü”,A6>\nåççz¥Åã™Ä» hÿÏSì÷?‡Ïgéã&“ğûı%%%Ï’DA.7/¼=Ë™“HQAsq¹²—,Y¼k×.şz@Ò0nJ– ¿hÑ¢ï|·ª¼üÖ¼ùÿúÌşæó•>*’Ôw¾ÿ•—Z¯+üŠûŠ	ƒı’M\nO:çşáOo<³uëÏgÂ˜9òúòï­êèèàmH²)Y‚l<]Ğíİ»{š÷¬™åwvpĞ6(]ú$W–ôàßü¸ïÆ÷şæ…ğ›}?MÍ’:^=²döŒ¾ÿdÂ˜Ñeİg/¿òÜ¹s¼\rÉÁ5IIª:ê±HYƒÒ‡4Á)}Z’JæÌşÜÔ¼¯Ï›ëqJn‡4ŠSºÜ!¹4„\"Ê‚(c,tYGñ$ïLĞ²É$‚Á Û=^uªH4˜;Û¾ sÈáS4»pİîveg¿ÿ~àR‡4Î!Ñ£[’ÆÙÃ3«DI¦€npM—,A66£ïÂÿãğ5İøû?	ItùvÙ%Òàùó]ÇŞ¢)‹«—üòÙá[¶¯ı±ã†¯|Y½,ŒívãÉ¢Á¸ÉLè¬PJøn·İ¾©ôa¯täÍ÷>\nNGÎ„Kø5Ü¡sI½,Ê˜èÙ”,—Ë%æ]›-\\è‚²¨ç“óWx®š8Ñı)[Éü…½’ôñyé“óáÙzûúåÙÄ‚lJ–Çãa¹H\0#ŞÀslRN6E§ä´KùŞk·=½÷Ê«\'ùß¢ªÛƒ!é“éœ$…Ó‰êeQÆ\\@7¸ß”¬™3g644Ì˜1ƒ·3D¾ßôoHÒM7U<±uÇùıúÃŸ!lv›ÃÑêuåäôõõÙ¤AºÜsØmã>í:tà·­/ïæ™í|IHB–s\"î7éÙ”¬ÒÒÒ\r6”””ğv†Ğ>¼páCŞ­^}ÿÖ­Ûx#¶Û/~Îÿ$o@rœÎÏ ›ô‚lJVmmmqqqÆ¿`LÎ¦ğdˆÓy²I/¸ß”,\n¦ÖV|9€ÎMÉòù|mmm¼‘aô’ÙºA6%Ëëõº\\®ÎÎNŞÎ Û J†èÙ¤ƒeË–‰ñåê7p”ŒĞ\rî…ë€}¯ÛáÃ‡3ø…öá{áıgx2Äé¸÷Âõ‚q“èš®¡¡¡ººš·3†½u£d°€n0nÒÍÆ{zzêêêx;½äq“ O·.§Ãƒq“^0nÒ\re\r ,XyWº±·n”Ğ\rÆM:cPwÙ²e+W®Lçí\'yÜô>o@†8ŸÃ¸I/7é¬¬¬Œ}cô¬Y³hEƒ©––6	\0‡qSª„B!J¥¶¶¶ÖÖÖôÄSÿßx\r2Äá¸ã&½ ›L‚öaÿ{¼âp\\…#Y/È&“³é]Ş€q8®Æ‘¬Üo2:+-tizXQú#+c+‰,ä×@…fˆU4s&W@77™„<nz‡7¢q8&óZlqš-V%*Íj#çŒ¿8sÑ§ ©š\'\"êEÔkĞÌÉúc=…¦?ê²‰£Åq$ëã&3aoİ±\ni§bÕâ1+òyËzÔe˜¼ÍT*DÓYbÎ#gGxµl#ÙÖ²ºfeó”†*l¶ppDõz¨°U†\'%V@7È&3Ñœ\'#JÿIuÓá˜¢n²©r\'Ãl’²ÂÈŠºpšõ«\nÑôD–èóĞ–¨6ŒzÔ³ñº2=Í6Ü©*á-ŒZFÎÆv…bÄ¤\nè×t&¾¦8Á18ìSy-‚²,ÍÃêê™©Gé×`³ÅyêÈ\'œ9Ö<J¿ÒÔTêI¬GkEÔIl=±‰…–Â‘¬²Éälz›7bpØÿE™ç¢uu…•4âO%ê•Çõ–(yÊˆçœ-²Î*‘ÔëaØÌ‘ıñÑR8’õ‚k:k¡“‡M]-²g´§¨hc\"Ÿz”NõÿB½åê:Ã–ŠZø d“™Ğ;vüBçç_YÑÔÙì|–{Â3+K\rU¢FÓ©.ñ§²}%qä\nõ°ÄQf/¥ü/Tÿ‘ÈÇèeäÚ4…Ñt^´€nMf¢9O\"Û×°¢©³úŞRêÑ*QK˜¼M¿Rˆ¦\'²DŸ‡¶G)råæ[ì¹èq¨“U[Ûğ#MŠZhÚP…¯„6I6¢?ºA6™‰æ<‰,tn¿ÉŠ¦®G]qØ¯e•¡:›¤.\\Œ©Tˆ¦\'²Ä›‡ÖÌŠ¼©Xo*ue¹ÂW24)ÜT‘+ÃÿeM[ymŠáşÄ\nèÙd!ìlŒ«ßaÿ|¬IQÑü¼¦Z!Ûõf°õs±füyHdO¤‹Î\0iƒŸÓ™„üsºã¼‘\0‡ı‘óS\'=²~õ¬Ÿ$øÊü±Ğz™‡×T£ÙªÑÎ£ ~V‰:uÌhµ8’õ‚l2	Ú‡Çx2ÄnŸ†#Y/È&“³©‹7 Cìv/d½ ›LBÎ¦£¼b·çãHÖî…€ˆ0n2	yÜôŞ€±Û¯Ã‘¬d“IÈÙôo@†Øí_Ä‘¬\\Ó™„Ëå\n…BDIsİ ›LÂãñº? q0J&èÙd^¯·«¿OŸI]]\'èUà\rH\Z²É$Š‹‹¶¾q‰’¾ÒÖvÄçóñ×’†l2‰ªªªÆÆ—qË)ƒe_Óòòrşz@ÒM&‘——WY¹ô±Íÿm“QÒ_ó¿èr}ª¢¢‚¿4|†À<hĞ´`AÑ¦M÷ø|¼Ò\"ø ´ôÃ‡Ÿr»çò.H\ZÆMæár¹êëŸ^µêÑ®®šË\r”Ô\n¦êê××ß`ÒÆMfÓÖÖ¶jUMeåÍ?şq-ï‚”il<°~ıÿ¦`*)¹ƒwNM&Dw=´ª­íOË–İRV6Ûã¹ŒO\0ƒg››ßÔÔ\Z\nõ64lt»‹ùĞ²É´ZZZvízœN¡@à¼tâv_ZV6«¼¼¤ªj=ï½!›@µµµ\r\r\r¼–‡lQà0\05üœ\0D„l\0!›\0@DÈ&\0²	\0D„l\0!›\0@DÈ&\0²	\0D„l\0!› %l6¯Œ	~Ÿ?kØËgD^_ †l‚„Äy4“ÔÍQ½²8@Mˆ£¥øØkD¼=„uF¤qÑ—‡¨!› !q^#õ¤ÈÙqq€\Zî…Ã(P|hğ	*|ÂŞ0JÈ&\ZÚ(x×H|ÚŞ0JÈ&Ğ/\rá½\0£„l‚Ñá‘#ã]*|°$—x-îĞÉï÷ÓzrrrfÎœIÍÜÜ\\j7®««‹Í\0–…l‚Qàa£Â\'ÈXZ±Gš¤„—R‰”M¡P¨³³“*@€‘M ÄOFèØa3 8¯‘2‰U4sFíTP*¹İîŞŞ^Ş–¤‚‚‚3gÎ=z”úyXÆM0v”8D©³ôaI¤`Scq¹\\k×®u:¼-IsæÌ©©©A0Aôw³4£#X„Í€Lñx<İİİT©¬¬loo§Ae›–…qdŞ={²²²¨ÒÓÓSWW‡`‚l‚Ì›7o^QQ«WTT°\nX®é@@ 77—®æ¼^/ïkC6(p€\Z²	2&\n577wvv9r$²N—ËUXX˜——WVVæñxX\'X²	2 ±±q×®]ôÈÛ1Ì˜1cÅŠ555¸;nAB„BNNÎG}„ãÏ\nZZZÖ¯_ßÖÖÆÛ	 1T]]î‘[Ù4uêÔĞ!ÈÛ`Ft·jÕª;wò¶ŒFF7ß<ÿk_ûÚÕ‡-¶¶¾újûşıûy[FÙÔĞĞ€ÏdZeSÆÑÚÑÑÁ`F§OŸöù|ü˜“İsÏê7ßzë|ß…XåÌß?øÙÖ­ê[Nôî…ãÄ:„ø|½*·BÁ|N<9kÖ,å:®¬¬ŒRé?úÓ)Sâ”é¨¸óÎ¯ÿéÏ>øo¬G³07!²‰Şé°ã\r0º”«®®V^ßG}tß¯~?•Ô(¡ü·ûŸÿy†İdkc_W\0æ&D6·¶¶ò˜Kmm­2ÒÙ»÷ùıè>V•%••‡^ù¿ìfÅÅë\"›|>ê¦ÔØØè÷ûYFL·–—³úLŸ>ıéÿy†Õ[ZZ¶lÙÂê`VBd“×ë¥;ûv10“‡zˆUÊÊÊÆ6bR›?¾rïé±Ç£ë;VS\"›È²eËvíÚÅ`\n4bbï7ôÆóäŸ³Î$ığG?b?¹ë×¯g`J¢dÓÊ•+iü{œf²}ûvV¹óÎzıö	Å]²ºæ£R`2ı²HKK]8p€·ÁÈ‚ÁàÄ‰YıwßÓ÷7ã>íµ§N…ğGGKII	ë“eÜDè +..^³f\roƒğèª-Ö‡?”ß•£—U÷_Ù?>«h>;f\"P6‘7Ò }Á‚ø(¦ø?^]]=uêÔñãÇ?ÿüó¼wH{{;«ÜxÓM¬¢£Û—,a\Zk³\n˜XÙD6mÚ´zõê™3gRNáö“È&Ol·‡Ÿ³gÏRH]ıõê1”RŸ>}«è(/o\n«à11á²‰”••uttPeÖ¬Y4†¢ÂÛ£€h„{ÅW°z__ßo¼qİu×-_¾œıh_I\rİ/èˆò±òXW”`Bqå”Jmmm­­­ˆ\'c¡Hbñôæ[o%ş*‰›|õUlı\"À|©ŒÛíîééauöıJÁ`°¾¾Şëõæçç³¿Íû§?ÿyÚ4ı¿|ü¥—°\Z`³ñšbˆ%ÑwÜAITYYyàÀöÇ”K¹@ ü‡çôEOÍ‚‰ı†˜²	Æˆ‚Éår•••QL\\vÙe‡®ªªâÓäï–`•cÇÂ£\'}uwó›Yø>BC6ÁM™2e÷îİl¬´iÓ&ÍfÚ´i¬òjû«¬¢£¦¦&Vac40%Üo‚” K¼üü|ªPf½óî{4Âbıº¸éÆ¯³/Õihh¨©©a`2È&H•©S§²Ÿñïİû|2ß¢qêÔÉÏ_{-«ôÑG¸ådV¸¦ƒTQn?=üğ¿³[×º¸÷Ş{Y¥¢¢Ádb7AªƒAº¬cŸBzäÑG“ÿş&ÒŞŞ^4w«wttÌ˜¡ÿ‡ÎA7AªĞ æ¾ûx=òğÃÉí2]Íİ¾ø6V_¹r%‚ÉÜ0n‚ÔRş2ŠÇã9ôÊ+cşŒ8]ÒˆéÈ‘#T§UÑ )¿\râÀ¸	Rk÷îİì®]ÜÍËÂe´äey0¹\\.Z\'‚ÉôMZyyy/¼ğ«³ˆyòIş}˜	jooÿÚ\r_UBmÓ¦Mø>9+@6AÊQ”P<±Ñ]šİ}×]7|õ+‰|-eÙw¾ómŠ3vCÔÕÕıà?`u07Üo‚4éêêZ´hû`fúôé·ŞZ¾¤r‰æ—)‰öíkúÕ¾}êü¢h£€ÃˆÉ:M>Á`pË–-±ş|Saa!]¸ETUUE#&Üc²d¤\r‹Ö¯_Ÿà_I¡Ò¦M›|>oƒe › 3h|ÔØØHWm2Ş+ËËË›1cÆüùó+**0V²,d\0ˆ?§\0!›\0@DÈ&\0²	\0D„l\0!›\0@DÈ&\0²	\0D„l\0!›\0@<’ôÿ-EA¿Zï\0\0\0\0IEND®B`‚',0),('3',1,'Desktop/leaveBillProcess.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:dc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/testm1585483512332\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1585483512332\" name=\"\" targetNamespace=\"http://www.activiti.org/testm1585483512332\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"leaveBillProcess\" isClosed=\"false\" isExecutable=\"true\" name=\"leaveBillProcess\" processType=\"None\">\r\n    <startEvent id=\"_2\" name=\"StartEvent\"/>\r\n    <userTask activiti:assignee=\"#{userId}\" activiti:exclusive=\"true\" id=\"_3\" name=\"æäº¤ç”³è¯·\"/>\r\n    <userTask activiti:exclusive=\"true\" id=\"_4\" name=\"å®¡æ‰¹[ä¸Šçº§é¢†å¯¼]\">\r\n      <extensionElements>\r\n        <activiti:taskListener class=\"com.dy.sys.listener.TaskListenerImpl\" event=\"create\"/>\r\n      </extensionElements>\r\n    </userTask>\r\n    <userTask activiti:exclusive=\"true\" id=\"_5\" name=\"å®¡æ‰¹[ä¸Šä¸Šçº§é¢†å¯¼]\">\r\n      <extensionElements>\r\n        <activiti:taskListener class=\"com.dy.sys.listener.TaskListenerImpl\" event=\"create\"/>\r\n      </extensionElements>\r\n    </userTask>\r\n    <endEvent id=\"_6\" name=\"EndEvent\"/>\r\n    <sequenceFlow id=\"_7\" sourceRef=\"_2\" targetRef=\"_3\"/>\r\n    <sequenceFlow id=\"_8\" name=\"æäº¤\" sourceRef=\"_3\" targetRef=\"_4\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${outcome==\'æäº¤\'} ]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_9\" name=\"åŒæ„\" sourceRef=\"_4\" targetRef=\"_5\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${outcome==\'åŒæ„\'}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_10\" name=\"åŒæ„\" sourceRef=\"_5\" targetRef=\"_6\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${outcome==\'åŒæ„\'}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_11\" name=\"æ”¾å¼ƒ\" sourceRef=\"_3\" targetRef=\"_6\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${outcome==\'æ”¾å¼ƒ\'}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_12\" name=\"é©³å›\" sourceRef=\"_4\" targetRef=\"_3\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${outcome==\'é©³å›\'}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_13\" name=\"é©³å›\" sourceRef=\"_5\" targetRef=\"_3\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${outcome==\'é©³å›\'}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"leaveBillProcess\">\r\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\r\n        <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"410.0\" y=\"0.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\r\n        <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"380.0\" y=\"70.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\r\n        <dc:Bounds height=\"55.0\" width=\"90.0\" x=\"380.0\" y=\"165.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"55.0\" width=\"90.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\r\n        <dc:Bounds height=\"55.0\" width=\"100.0\" x=\"375.0\" y=\"260.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"55.0\" width=\"100.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_6\" id=\"Shape-_6\">\r\n        <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"410.0\" y=\"355.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"_5\" targetElement=\"_3\">\r\n        <di:waypoint x=\"375.0\" y=\"287.5\"/>\r\n        <di:waypoint x=\"335.0\" y=\"180.0\"/>\r\n        <di:waypoint x=\"380.0\" y=\"97.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"15.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"_4\" targetElement=\"_3\">\r\n        <di:waypoint x=\"470.0\" y=\"192.5\"/>\r\n        <di:waypoint x=\"520.0\" y=\"150.0\"/>\r\n        <di:waypoint x=\"465.0\" y=\"97.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"-2.0\" width=\"0.0\" x=\"0.0\" y=\"15.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_7\" id=\"BPMNEdge__7\" sourceElement=\"_2\" targetElement=\"_3\">\r\n        <di:waypoint x=\"426.0\" y=\"32.0\"/>\r\n        <di:waypoint x=\"426.0\" y=\"70.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_3\" targetElement=\"_4\">\r\n        <di:waypoint x=\"422.5\" y=\"125.0\"/>\r\n        <di:waypoint x=\"422.5\" y=\"165.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"-17.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_4\" targetElement=\"_5\">\r\n        <di:waypoint x=\"425.0\" y=\"220.0\"/>\r\n        <di:waypoint x=\"425.0\" y=\"260.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-15.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_11\" id=\"BPMNEdge__11\" sourceElement=\"_3\" targetElement=\"_6\">\r\n        <di:waypoint x=\"380.0\" y=\"97.5\"/>\r\n        <di:waypoint x=\"265.0\" y=\"235.0\"/>\r\n        <di:waypoint x=\"410.0\" y=\"371.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"1.0\" width=\"0.0\" x=\"0.0\" y=\"-15.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"_5\" targetElement=\"_6\">\r\n        <di:waypoint x=\"425.0\" y=\"315.0\"/>\r\n        <di:waypoint x=\"425.0\" y=\"330.0\"/>\r\n        <di:waypoint x=\"425.0\" y=\"355.0312805773287\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"-15.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('cfg.execution-related-entities-count','false',1),('next.dbid','12501',6),('schema.history','create(6.0.0.4)',1),('schema.version','6.0.0.4',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('10','leaveBillProcess:1:4','5','8','_3','11',NULL,'æäº¤ç”³è¯·','userTask','5','2020-03-31 05:26:33.186','2020-03-31 05:26:53.259',20073,NULL,''),('10005','leaveBillProcess:1:4','10001','10004','_2',NULL,NULL,'StartEvent','startEvent',NULL,'2020-03-31 13:09:10.857','2020-03-31 13:09:10.858',1,NULL,''),('10006','leaveBillProcess:1:4','10001','10004','_3','10007',NULL,'æäº¤ç”³è¯·','userTask','5','2020-03-31 13:09:10.859','2020-03-31 13:10:55.518',104659,NULL,''),('10012','leaveBillProcess:1:4','10001','10004','_4','10013',NULL,'å®¡æ‰¹[ä¸Šçº§é¢†å¯¼]','userTask',NULL,'2020-03-31 13:10:55.530','2020-03-31 13:11:42.664',47134,NULL,''),('10017','leaveBillProcess:1:4','10001','10004','_5','10018',NULL,'å®¡æ‰¹[ä¸Šä¸Šçº§é¢†å¯¼]','userTask',NULL,'2020-03-31 13:11:42.665',NULL,NULL,NULL,''),('16','leaveBillProcess:1:4','5','8','_4','17',NULL,'å®¡æ‰¹[ä¸Šçº§é¢†å¯¼]','userTask',NULL,'2020-03-31 05:26:53.263','2020-03-31 05:33:41.536',408273,NULL,''),('2504','leaveBillProcess:1:4','5','8','_5','2505',NULL,'å®¡æ‰¹[ä¸Šä¸Šçº§é¢†å¯¼]','userTask',NULL,'2020-03-31 05:33:41.550','2020-03-31 05:34:28.405',46855,NULL,''),('2509','leaveBillProcess:1:4','5','8','_6',NULL,NULL,'EndEvent','endEvent',NULL,'2020-03-31 05:34:28.405','2020-03-31 05:34:28.405',0,NULL,''),('5005','leaveBillProcess:1:4','5001','5004','_2',NULL,NULL,'StartEvent','startEvent',NULL,'2020-03-31 10:05:04.383','2020-03-31 10:05:04.388',5,NULL,''),('5006','leaveBillProcess:1:4','5001','5004','_3','5007',NULL,'æäº¤ç”³è¯·','userTask','5','2020-03-31 10:05:04.395','2020-03-31 10:59:05.158',3240763,NULL,''),('7504','leaveBillProcess:1:4','5001','5004','_4','7505',NULL,'å®¡æ‰¹[ä¸Šçº§é¢†å¯¼]','userTask',NULL,'2020-03-31 10:59:05.194','2020-03-31 11:00:37.716',92522,NULL,''),('7509','leaveBillProcess:1:4','5001','5004','_5','7510',NULL,'å®¡æ‰¹[ä¸Šä¸Šçº§é¢†å¯¼]','userTask',NULL,'2020-03-31 11:00:37.716','2020-03-31 11:02:51.394',133678,NULL,''),('7514','leaveBillProcess:1:4','5001','5004','_6',NULL,NULL,'EndEvent','endEvent',NULL,'2020-03-31 11:02:51.394','2020-03-31 11:02:51.394',0,NULL,''),('9','leaveBillProcess:1:4','5','8','_2',NULL,NULL,'StartEvent','startEvent',NULL,'2020-03-31 05:26:33.183','2020-03-31 05:26:33.184',1,NULL,'');

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('10009','comment','2020-03-31 13:10:55.418','5','10007','10001','AddComment','[æäº¤]è¯·æ‰¹å‡†','[æäº¤]è¯·æ‰¹å‡†'),('10014','comment','2020-03-31 13:11:42.561','4','10013','10001','AddComment','[åŒæ„]å¥½çš„','[åŒæ„]å¥½çš„'),('13','comment','2020-03-31 05:26:53.155','5','11','5','AddComment','[æäº¤]è¯·é¢†å¯¼æ‰¹å‡†','[æäº¤]è¯·é¢†å¯¼æ‰¹å‡†'),('2501','comment','2020-03-31 05:33:41.293','4','17','5','AddComment','[åŒæ„]å¥½çš„','[åŒæ„]å¥½çš„'),('2506','comment','2020-03-31 05:34:28.294','3','2505','5','AddComment','[åŒæ„]å¥½çš„,å°½å¿«','[åŒæ„]å¥½çš„,å°½å¿«'),('7501','comment','2020-03-31 10:59:04.893','5','5007','5001','AddComment','[æäº¤]è¯·æ‰¹å‡†','[æäº¤]è¯·æ‰¹å‡†'),('7506','comment','2020-03-31 11:00:37.603','4','7505','5001','AddComment','[åŒæ„]å¥½å¥½æ¶ˆæ¯','[åŒæ„]å¥½å¥½æ¶ˆæ¯'),('7511','comment','2020-03-31 11:02:50.996','3','7510','5001','AddComment','[åŒæ„]OK','[åŒæ„]OK');

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

insert  into `act_hi_detail`(`ID_`,`TYPE_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`ACT_INST_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`TIME_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('10003','VariableUpdate','10001','10001',NULL,NULL,'userId','integer',0,'2020-03-31 13:09:10.855',NULL,NULL,5,'5',NULL),('10011','VariableUpdate','10001','10001',NULL,'10006','outcome','string',0,'2020-03-31 13:10:55.506',NULL,NULL,NULL,'æäº¤',NULL),('10015','VariableUpdate','10001','10001',NULL,'10012','outcome','string',1,'2020-03-31 13:11:42.657',NULL,NULL,NULL,'åŒæ„',NULL),('15','VariableUpdate','5','5',NULL,'10','outcome','string',0,'2020-03-31 05:26:53.254',NULL,NULL,NULL,'æäº¤',NULL),('2502','VariableUpdate','5','5',NULL,'16','outcome','string',1,'2020-03-31 05:33:41.521',NULL,NULL,NULL,'åŒæ„',NULL),('2507','VariableUpdate','5','5',NULL,'2504','outcome','string',2,'2020-03-31 05:34:28.395',NULL,NULL,NULL,'åŒæ„',NULL),('5003','VariableUpdate','5001','5001',NULL,NULL,'userId','integer',0,'2020-03-31 10:05:04.372',NULL,NULL,5,'5',NULL),('7','VariableUpdate','5','5',NULL,NULL,'userId','integer',0,'2020-03-31 05:26:33.181',NULL,NULL,5,'5',NULL),('7503','VariableUpdate','5001','5001',NULL,'5006','outcome','string',0,'2020-03-31 10:59:05.147',NULL,NULL,NULL,'æäº¤',NULL),('7507','VariableUpdate','5001','5001',NULL,'7504','outcome','string',1,'2020-03-31 11:00:37.704',NULL,NULL,NULL,'åŒæ„',NULL),('7512','VariableUpdate','5001','5001',NULL,'7509','outcome','string',2,'2020-03-31 11:02:51.387',NULL,NULL,NULL,'åŒæ„',NULL);

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('10008',NULL,'participant','5',NULL,'10001'),('10016',NULL,'participant','4',NULL,'10001'),('12',NULL,'participant','5',NULL,'5'),('2503',NULL,'participant','4',NULL,'5'),('2508',NULL,'participant','3',NULL,'5'),('5008',NULL,'participant','5',NULL,'5001'),('7508',NULL,'participant','4',NULL,'5001'),('7513',NULL,'participant','3',NULL,'5001');

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`) values ('10001','10001','12','leaveBillProcess:1:4','2020-03-31 13:09:10.742',NULL,NULL,NULL,'_2',NULL,NULL,NULL,'',NULL),('5','5','10','leaveBillProcess:1:4','2020-03-31 05:26:33.181','2020-03-31 05:34:28.538',475357,NULL,'_2','_6',NULL,NULL,'',NULL),('5001','5001','11','leaveBillProcess:1:4','2020-03-31 10:05:04.257','2020-03-31 11:02:51.756',3467499,NULL,'_2','_6',NULL,NULL,'',NULL);

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('10007','leaveBillProcess:1:4','_3','10001','10004','æäº¤ç”³è¯·',NULL,NULL,NULL,'5','2020-03-31 13:09:10.866',NULL,'2020-03-31 13:10:55.516',104650,NULL,50,NULL,NULL,NULL,''),('10013','leaveBillProcess:1:4','_4','10001','10004','å®¡æ‰¹[ä¸Šçº§é¢†å¯¼]',NULL,NULL,NULL,NULL,'2020-03-31 13:10:55.530',NULL,'2020-03-31 13:11:42.663',47133,NULL,50,NULL,NULL,NULL,''),('10018','leaveBillProcess:1:4','_5','10001','10004','å®¡æ‰¹[ä¸Šä¸Šçº§é¢†å¯¼]',NULL,NULL,NULL,NULL,'2020-03-31 13:11:42.665',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('11','leaveBillProcess:1:4','_3','5','8','æäº¤ç”³è¯·',NULL,NULL,NULL,'5','2020-03-31 05:26:33.192',NULL,'2020-03-31 05:26:53.258',20066,NULL,50,NULL,NULL,NULL,''),('17','leaveBillProcess:1:4','_4','5','8','å®¡æ‰¹[ä¸Šçº§é¢†å¯¼]',NULL,NULL,NULL,NULL,'2020-03-31 05:26:53.263',NULL,'2020-03-31 05:33:41.534',408271,NULL,50,NULL,NULL,NULL,''),('2505','leaveBillProcess:1:4','_5','5','8','å®¡æ‰¹[ä¸Šä¸Šçº§é¢†å¯¼]',NULL,NULL,NULL,NULL,'2020-03-31 05:33:41.550',NULL,'2020-03-31 05:34:28.405',46855,NULL,50,NULL,NULL,NULL,''),('5007','leaveBillProcess:1:4','_3','5001','5004','æäº¤ç”³è¯·',NULL,NULL,NULL,'5','2020-03-31 10:05:04.466',NULL,'2020-03-31 10:59:05.155',3240689,NULL,50,NULL,NULL,NULL,''),('7505','leaveBillProcess:1:4','_4','5001','5004','å®¡æ‰¹[ä¸Šçº§é¢†å¯¼]',NULL,NULL,NULL,NULL,'2020-03-31 10:59:05.195',NULL,'2020-03-31 11:00:37.714',92519,NULL,50,NULL,NULL,NULL,''),('7510','leaveBillProcess:1:4','_5','5001','5004','å®¡æ‰¹[ä¸Šä¸Šçº§é¢†å¯¼]',NULL,NULL,NULL,NULL,'2020-03-31 11:00:37.716',NULL,'2020-03-31 11:02:51.393',133677,NULL,50,NULL,NULL,NULL,'');

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('10002','10001','10001',NULL,'userId','integer',0,NULL,NULL,5,'5',NULL,'2020-03-31 13:09:10.855','2020-03-31 13:09:10.855'),('10010','10001','10001',NULL,'outcome','string',1,NULL,NULL,NULL,'åŒæ„',NULL,'2020-03-31 13:10:55.506','2020-03-31 13:11:42.658'),('14','5','5',NULL,'outcome','string',2,NULL,NULL,NULL,'åŒæ„',NULL,'2020-03-31 05:26:53.254','2020-03-31 05:34:28.400'),('5002','5001','5001',NULL,'userId','integer',0,NULL,NULL,5,'5',NULL,'2020-03-31 10:05:04.372','2020-03-31 10:05:04.372'),('6','5','5',NULL,'userId','integer',0,NULL,NULL,5,'5',NULL,'2020-03-31 05:26:33.181','2020-03-31 05:26:33.181'),('7502','5001','5001',NULL,'outcome','string',2,NULL,NULL,NULL,'åŒæ„',NULL,'2020-03-31 10:59:05.147','2020-03-31 11:02:51.389');

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`ENGINE_VERSION_`) values ('1','leaveBillProcess',NULL,NULL,'','2020-03-31 05:26:12.317',NULL);

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`) values ('leaveBillProcess:1:4',1,'http://www.activiti.org/testm1585483512332','leaveBillProcess','leaveBillProcess',1,'1','Desktop/leaveBillProcess.bpmn','Desktop/leaveBillProcess.png',NULL,0,1,1,'',NULL);

/*Table structure for table `act_ru_deadletter_job` */

DROP TABLE IF EXISTS `act_ru_deadletter_job`;

CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_deadletter_job` */

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`) values ('10001',1,'10001','12',NULL,'leaveBillProcess:1:4',NULL,'10001',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-03-31 13:09:10.742',NULL,NULL,0,0,0,0,0,0,0,0,0),('10004',3,'10001',NULL,'10001','leaveBillProcess:1:4',NULL,'10001','_5',1,0,0,0,0,1,NULL,'',NULL,'2020-03-31 13:09:10.856',NULL,NULL,0,0,0,0,0,0,0,0,0);

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`) values ('10008',1,NULL,'participant','5',NULL,'10001',NULL),('10016',1,NULL,'participant','4',NULL,'10001',NULL);

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_suspended_job` */

DROP TABLE IF EXISTS `act_ru_suspended_job`;

CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_suspended_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`,`CLAIM_TIME_`) values ('10018',1,'10004','10001','leaveBillProcess:1:4','å®¡æ‰¹[ä¸Šä¸Šçº§é¢†å¯¼]',NULL,NULL,'_5',NULL,'3',NULL,50,'2020-03-31 13:11:42.665',NULL,NULL,1,'',NULL,NULL);

/*Table structure for table `act_ru_timer_job` */

DROP TABLE IF EXISTS `act_ru_timer_job`;

CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_timer_job` */

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('10002',1,'integer','userId','10001','10001',NULL,NULL,NULL,5,'5',NULL),('10010',2,'string','outcome','10001','10001',NULL,NULL,NULL,NULL,'åŒæ„',NULL);

/*Table structure for table `bus_customer` */

DROP TABLE IF EXISTS `bus_customer`;

CREATE TABLE `bus_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customername` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `connectionperson` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `bus_customer` */

insert  into `bus_customer`(`id`,`customername`,`zip`,`address`,`telephone`,`connectionperson`,`phone`,`bank`,`account`,`email`,`fax`,`available`) values (1,'å°å¼ è¶…å¸‚','111','æ­¦æ±‰','027-9123131','å¼ å¤§æ˜','13812312312321312','ä¸­å›½é“¶è¡Œ','654431331343413','213123@sina.com','430000',1),(2,'å°æ˜è¶…å¸‚','222','æ·±åœ³','0755-9123131','å¼ å°æ˜','13812312312321312','ä¸­å›½é“¶è¡Œ','654431331343413','213123@sina.com','430000',1),(3,'å¿«ä¸ƒè¶…å¸‚','430000','æ­¦æ±‰','027-11011011','é›·ç”Ÿ','13434134131','æ‹›å•†é“¶è¡Œ','6543123341334133','6666@66.com','545341',1);

/*Table structure for table `bus_export` */

DROP TABLE IF EXISTS `bus_export`;

CREATE TABLE `bus_export` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) DEFAULT NULL,
  `exporttime` datetime DEFAULT NULL,
  `operateperson` varchar(255) DEFAULT NULL,
  `exportprice` double(10,2) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `bus_export` */

insert  into `bus_export`(`id`,`providerid`,`paytype`,`exporttime`,`operateperson`,`exportprice`,`number`,`remark`,`goodsid`) values (1,3,'å¾®ä¿¡','2019-08-16 08:19:50','è¶…çº§ç®¡ç†å‘˜',12321321.00,1,'',1),(2,3,'å¾®ä¿¡','2019-08-16 08:26:54','è¶…çº§ç®¡ç†å‘˜',12321321.00,11,'11',1);

/*Table structure for table `bus_goods` */

DROP TABLE IF EXISTS `bus_goods`;

CREATE TABLE `bus_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(255) DEFAULT NULL,
  `produceplace` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `goodspackage` varchar(255) DEFAULT NULL,
  `productcode` varchar(255) DEFAULT NULL,
  `promitcode` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `dangernum` int(11) DEFAULT NULL,
  `goodsimg` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  `providerid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_sq0btr2v2lq8gt8b4gb8tlk0i` (`providerid`) USING BTREE,
  CONSTRAINT `bus_goods_ibfk_1` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `bus_goods` */

insert  into `bus_goods`(`id`,`goodsname`,`produceplace`,`size`,`goodspackage`,`productcode`,`promitcode`,`description`,`price`,`number`,`dangernum`,`goodsimg`,`available`,`providerid`) values (1,'å¨ƒå“ˆå“ˆ','æ­¦æ±‰','120ML','ç“¶','PH12345','PZ1234','å°å­©å­éƒ½çˆ±çš„',2,488,10,'2020-03-27/202003272124433344986.jpg',1,3),(2,'æ—ºæ—ºé›ªé¥¼[å°åŒ…]','ä»™æ¡ƒ','åŒ…','è¢‹','PH12312312','PZ12312','å¥½åƒä¸ä¸Šç«',4,1100,10,'2020-03-27/202003272125057956757.jpg',1,1),(3,'æ—ºæ—ºå¤§ç¤¼åŒ…','ä»™æ¡ƒ','ç›’','ç›’','11','11','111',28,1021,100,'2020-03-27/202003272125139185945.jpg',1,1);

/*Table structure for table `bus_inport` */

DROP TABLE IF EXISTS `bus_inport`;

CREATE TABLE `bus_inport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paytype` varchar(255) DEFAULT NULL,
  `inporttime` datetime DEFAULT NULL,
  `operateperson` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `inportprice` double DEFAULT NULL,
  `providerid` int(11) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_1o4bujsyd2kl4iqw48fie224v` (`providerid`) USING BTREE,
  KEY `FK_ho29poeu4o2dxu4rg1ammeaql` (`goodsid`) USING BTREE,
  CONSTRAINT `bus_inport_ibfk_1` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`),
  CONSTRAINT `bus_inport_ibfk_2` FOREIGN KEY (`goodsid`) REFERENCES `bus_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `bus_inport` */

insert  into `bus_inport`(`id`,`paytype`,`inporttime`,`operateperson`,`number`,`remark`,`inportprice`,`providerid`,`goodsid`) values (1,'å¾®ä¿¡','2018-05-07 00:00:00','å¼ ä¸‰',100,'å¤‡æ³¨',3.5,1,1),(2,'æ”¯ä»˜å®','2018-05-07 00:00:00','å¼ ä¸‰',1000,'æ— ',2.5,3,3),(3,'é“¶è”','2018-05-07 00:00:00','å¼ ä¸‰',100,'1231',111,3,3),(4,'é“¶è”','2018-05-07 00:00:00','å¼ ä¸‰',1000,'æ— ',2,3,1),(5,'é“¶è”','2018-05-07 00:00:00','å¼ ä¸‰',100,'æ— ',1,3,1),(6,'é“¶è”','2018-05-07 00:00:00','å¼ ä¸‰',100,'1231',2.5,1,2),(8,'æ”¯ä»˜å®','2018-05-07 00:00:00','å¼ ä¸‰',100,'',1,3,1),(10,'æ”¯ä»˜å®','2018-08-07 17:17:57','è¶…çº§ç®¡ç†å‘˜',100,'sadfasfdsa',1.5,3,1),(11,'æ”¯ä»˜å®','2018-09-17 16:12:25','è¶…çº§ç®¡ç†å‘˜',21,'21',21,1,3),(12,'å¾®ä¿¡','2018-12-25 16:48:24','è¶…çº§ç®¡ç†å‘˜',100,'123213213',12321321,3,1);

/*Table structure for table `bus_provider` */

DROP TABLE IF EXISTS `bus_provider`;

CREATE TABLE `bus_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providername` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `connectionperson` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `bus_provider` */

insert  into `bus_provider`(`id`,`providername`,`zip`,`address`,`telephone`,`connectionperson`,`phone`,`bank`,`account`,`email`,`fax`,`available`) values (1,'æ—ºæ—ºé£Ÿå“','434000','ä»™æ¡ƒ','0728-4124312','å°æ˜','13413441141','ä¸­å›½å†œä¸šé“¶è¡Œ','654124345131','12312321@sina.com','5123123',1),(2,'è¾¾åˆ©å›­é£Ÿå“','430000','æ±‰å·','0728-4124312','å¤§æ˜','13413441141','ä¸­å›½å†œä¸šé“¶è¡Œ','654124345131','12312321@sina.com','5123123',1),(3,'å¨ƒå“ˆå“ˆé›†å›¢','513131','æ­å·','21312','å°æ™¨','12312','å»ºè®¾é“¶è¡Œ','512314141541','123131','312312',1);

/*Table structure for table `bus_sales` */

DROP TABLE IF EXISTS `bus_sales`;

CREATE TABLE `bus_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) DEFAULT NULL,
  `salestime` datetime DEFAULT NULL,
  `operateperson` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `saleprice` decimal(10,2) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `bus_sales` */

/*Table structure for table `bus_salesback` */

DROP TABLE IF EXISTS `bus_salesback`;

CREATE TABLE `bus_salesback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) DEFAULT NULL,
  `salesbacktime` datetime DEFAULT NULL,
  `salesbackprice` double(10,2) DEFAULT NULL,
  `operateperson` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `bus_salesback` */

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `open` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL COMMENT 'çŠ¶æ€ã€0ä¸å¯ç”¨1å¯ç”¨ã€‘',
  `ordernum` int(11) DEFAULT NULL COMMENT 'æ’åºç ã€ä¸ºäº†è°ƒäº‹æ˜¾ç¤ºé¡ºåºã€‘',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`id`,`pid`,`title`,`open`,`remark`,`address`,`available`,`ordernum`,`createtime`) values (1,0,'æ€»ç»åŠ',1,'å¤§BOSS','æ·±åœ³',1,1,'2019-04-10 14:06:32'),(2,1,'é”€å”®éƒ¨',0,'ç¨‹åºå‘˜å±Œä¸','æ­¦æ±‰',1,2,'2019-04-10 14:06:32'),(3,1,'è¿è¥éƒ¨',0,'æ— ','æ­¦æ±‰',1,3,'2019-04-10 14:06:32'),(4,1,'ç”Ÿäº§éƒ¨',0,'æ— ','æ­¦æ±‰',1,4,'2019-04-10 14:06:32'),(5,2,'é”€å”®ä¸€éƒ¨',0,'é”€å”®ä¸€éƒ¨','æ­¦æ±‰',1,5,'2019-04-10 14:06:32'),(6,2,'é”€å”®äºŒéƒ¨',0,'é”€å”®äºŒéƒ¨','æ­¦æ±‰',1,6,'2019-04-10 14:06:32'),(7,3,'è¿è¥ä¸€éƒ¨',0,'è¿è¥ä¸€éƒ¨','æ­¦æ±‰',1,7,'2019-04-10 14:06:32'),(8,2,'é”€å”®ä¸‰éƒ¨',0,'é”€å”®ä¸‰éƒ¨','11',1,8,'2019-04-10 14:06:32'),(9,2,'é”€å”®å››éƒ¨',0,'é”€å”®å››éƒ¨','222',1,9,'2019-04-10 14:06:32'),(10,2,'é”€å”®äº”éƒ¨',0,'é”€å”®äº”éƒ¨','33',1,10,'2019-04-10 14:06:32'),(18,4,'ç”Ÿäº§ä¸€éƒ¨',0,'ç”Ÿäº§é£Ÿå“','æ­¦æ±‰',1,11,'2019-04-13 09:49:38');

/*Table structure for table `sys_leavebill` */

DROP TABLE IF EXISTS `sys_leavebill`;

CREATE TABLE `sys_leavebill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `days` double(255,0) DEFAULT NULL,
  `leavetime` datetime DEFAULT NULL,
  `state` int(255) DEFAULT NULL COMMENT '0,æ–°å»º  1ï¼Œå®¡æ‰¹ä¸­   2ï¼Œå®¡æ‰¹å®Œæˆ  3ï¼Œå·²æ”¾å¼ƒ',
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `sys_leavebill` */

insert  into `sys_leavebill`(`id`,`title`,`content`,`days`,`leavetime`,`state`,`userid`) values (10,'å­™ä¸ƒçš„è¯·å‡å•001','å®¶äº‹å¤„ç†',2,'2020-03-31 05:23:09',2,5),(11,'å­™ä¸ƒçš„è¯·å‡å•2','ç”Ÿç—…äº†',5,'2020-03-31 10:04:54',2,5),(12,'å…¬å¸å‡ºå·®','å‡ºå·®',10,'2020-04-04 16:00:00',1,5);

/*Table structure for table `sys_log_login` */

DROP TABLE IF EXISTS `sys_log_login`;

CREATE TABLE `sys_log_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) DEFAULT NULL,
  `loginip` varchar(255) DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_log_login` */

insert  into `sys_log_login`(`id`,`loginname`,`loginip`,`logintime`) values (2,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-21 16:54:52'),(3,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-21 16:55:15'),(4,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-21 17:29:22'),(5,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-22 09:05:22'),(6,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-22 09:20:43'),(7,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-22 09:25:40'),(8,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-22 09:27:11'),(9,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-22 09:29:58'),(10,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-22 09:36:49'),(11,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-22 09:46:56'),(12,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-22 09:48:29'),(13,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-22 09:49:13'),(14,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-22 09:49:57'),(15,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-22 09:57:46'),(16,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-22 10:21:53'),(17,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-22 10:38:25'),(18,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-22 10:49:21'),(19,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-22 14:01:42'),(20,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-22 14:19:48'),(21,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-22 14:45:29'),(22,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-22 15:58:05'),(23,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-22 16:40:53'),(24,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-22 17:12:01'),(25,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-24 09:19:15'),(26,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-24 09:37:28'),(27,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-24 09:46:51'),(28,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-24 09:50:40'),(29,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-24 09:52:52'),(30,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-24 10:00:26'),(31,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-24 10:10:58'),(32,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-24 10:21:28'),(33,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-24 11:22:27'),(34,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-24 11:35:28'),(35,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-24 14:05:28'),(36,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-24 15:16:29'),(37,'æå››-ls','127.0.0.1','2018-12-24 15:16:50'),(38,'ç‹äº”-ww','127.0.0.1','2018-12-24 15:17:36'),(39,'èµµå…­-zl','127.0.0.1','2018-12-24 15:17:47'),(40,'å­™ä¸ƒ-sq','127.0.0.1','2018-12-24 15:17:58'),(41,'åˆ˜å…«-lb','127.0.0.1','2018-12-24 15:18:09'),(42,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-24 15:34:59'),(43,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-24 15:35:09'),(44,'åˆ˜å…«-lb','127.0.0.1','2018-12-24 15:36:09'),(45,'åˆ˜å…«-lb','127.0.0.1','2018-12-24 15:42:58'),(46,'åˆ˜å…«-lb','127.0.0.1','2018-12-24 15:43:04'),(47,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-24 15:46:01'),(48,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-24 17:03:54'),(49,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-24 17:26:32'),(50,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-25 09:07:42'),(51,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-25 09:16:27'),(52,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-25 09:59:03'),(53,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-25 10:05:13'),(54,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-25 10:05:47'),(55,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-25 10:11:17'),(56,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-25 10:14:06'),(57,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-25 10:36:16'),(58,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-25 14:17:21'),(59,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-25 14:20:00'),(60,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-25 14:34:22'),(61,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-25 14:34:27'),(62,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-25 14:38:37'),(63,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-25 14:50:37'),(64,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-25 16:01:35'),(65,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-25 16:25:28'),(66,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-25 16:27:37'),(67,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-25 16:28:28'),(68,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-25 16:44:02'),(69,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-25 16:47:55'),(70,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-28 15:59:34'),(71,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-28 17:27:16'),(72,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-28 17:29:40'),(73,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2018-12-28 17:51:10'),(74,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-04-15 17:05:02'),(75,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-04-15 17:05:12'),(76,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-04-15 17:10:22'),(77,'åˆ˜å…«-lb','127.0.0.1','2019-04-15 17:11:45'),(78,'åˆ˜å…«-lb','127.0.0.1','2019-04-15 17:28:50'),(79,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-04-15 17:29:13'),(80,'åˆ˜å…«-lb','127.0.0.1','2019-04-15 17:30:59'),(81,'åˆ˜å…«-lb','127.0.0.1','2019-04-15 17:32:42'),(82,'åˆ˜å…«-lb','127.0.0.1','2019-04-15 17:33:48'),(83,'åˆ˜å…«-lb','127.0.0.1','2019-04-15 17:34:17'),(84,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-04-15 17:36:40'),(85,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-04-15 17:47:21'),(86,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-04-15 17:54:10'),(87,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-04-15 17:55:52'),(88,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-04-16 09:26:01'),(89,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-04-16 09:26:25'),(90,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-04-16 09:46:54'),(91,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-04-16 10:07:48'),(92,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-04-16 10:10:30'),(93,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-04-16 10:14:29'),(94,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-04-16 10:15:04'),(95,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-04-16 10:15:58'),(96,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-04-16 10:28:14'),(97,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-04-16 10:32:42'),(98,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-04-16 10:33:03'),(99,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-04-16 11:02:01'),(100,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-04-16 11:03:09'),(101,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-04-16 11:13:42'),(102,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-04-16 11:24:55'),(104,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-14 01:11:34'),(105,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-14 01:24:03'),(106,'æå››-ls','127.0.0.1','2019-08-14 01:25:47'),(107,'æå››-ls','127.0.0.1','2019-08-14 01:26:41'),(108,'å­™ä¸ƒ-sq','127.0.0.1','2019-08-14 01:28:22'),(109,'åˆ˜å…«-lb','127.0.0.1','2019-08-14 01:28:32'),(110,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-14 01:46:18'),(111,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-14 02:18:44'),(112,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-14 02:32:06'),(113,'æå››-ls','127.0.0.1','2019-08-14 03:00:19'),(114,'æå››-ls','127.0.0.1','2019-08-14 03:00:56'),(115,'æå››-ls','127.0.0.1','2019-08-14 03:01:31'),(116,'æå››-ls','127.0.0.1','2019-08-14 03:01:39'),(117,'æå››-ls','127.0.0.1','2019-08-14 03:02:25'),(118,'æå››-ls','127.0.0.1','2019-08-14 03:04:57'),(119,'æå››-ls','127.0.0.1','2019-08-14 03:07:19'),(120,'æå››-ls','127.0.0.1','2019-08-14 03:07:54'),(121,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-14 03:13:06'),(122,'æå››-ls','127.0.0.1','2019-08-14 03:14:46'),(123,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-14 06:03:47'),(124,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-14 07:20:12'),(125,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-14 07:23:05'),(126,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-14 07:25:30'),(127,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-14 07:26:34'),(128,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-14 07:27:22'),(129,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-14 07:27:51'),(130,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-14 08:22:05'),(131,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-14 08:43:53'),(132,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-14 08:45:55'),(133,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-14 08:47:13'),(134,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-14 09:35:20'),(135,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-14 09:41:02'),(136,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-14 09:44:04'),(137,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-14 09:50:27'),(138,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-14 09:56:57'),(139,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-14 09:59:02'),(140,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 01:05:37'),(141,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 02:01:44'),(142,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 02:05:57'),(143,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 02:07:04'),(144,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 02:20:02'),(145,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 02:20:20'),(146,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 02:21:42'),(147,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 03:37:37'),(148,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 03:52:40'),(149,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 03:59:37'),(150,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 06:11:45'),(151,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 06:23:27'),(152,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 06:50:31'),(153,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 06:54:49'),(154,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 07:00:48'),(155,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 07:01:18'),(156,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 07:03:35'),(157,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 07:09:55'),(158,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 07:46:09'),(159,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 08:17:59'),(160,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 08:22:29'),(161,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 08:23:32'),(162,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 08:26:48'),(163,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 08:31:19'),(164,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 08:55:36'),(165,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 08:55:59'),(166,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 08:56:53'),(167,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 08:57:42'),(168,'è¶…çº§ç®¡ç†å‘˜-system','127.0.0.1','2019-08-16 09:00:47'),(169,'æå››-ls','192.168.32.1','2020-03-27 13:11:35'),(170,'è¶…çº§ç®¡ç†å‘˜-system','192.168.32.1','2020-03-27 13:18:39'),(171,'æå››-ls','192.168.32.1','2020-03-27 13:18:51'),(172,'è¶…çº§ç®¡ç†å‘˜-system','192.168.32.1','2020-03-27 13:23:59'),(173,'æå››-ls','192.168.32.1','2020-03-27 13:24:20'),(174,'æå››-ls','192.168.32.1','2020-03-28 03:02:10'),(175,'æå››-ls','192.168.32.1','2020-03-28 03:29:26'),(176,'æå››-ls','192.168.32.1','2020-03-28 03:33:32'),(177,'æå››-ls','192.168.32.1','2020-03-28 03:36:40'),(178,'æå››-ls','192.168.32.1','2020-03-28 03:43:36'),(179,'æå››-ls','192.168.32.1','2020-03-28 03:47:26'),(180,'æå››-ls','192.168.32.1','2020-03-28 03:54:20'),(181,'æå››-ls','192.168.32.1','2020-03-28 05:13:23'),(182,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-28 05:15:02'),(183,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-28 05:16:00'),(184,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-28 06:26:40'),(185,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-28 07:31:15'),(186,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-28 07:31:40'),(187,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-28 08:12:14'),(188,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-28 14:42:22'),(189,'æå››-ls','192.168.32.1','2020-03-28 14:42:48'),(190,'æå››-ls','192.168.32.1','2020-03-28 14:44:18'),(191,'æå››-ls','192.168.32.1','2020-03-28 14:47:09'),(192,'è¶…çº§ç®¡ç†å‘˜-system','192.168.32.1','2020-03-28 14:55:41'),(193,'æå››-ls','192.168.32.1','2020-03-28 14:56:03'),(194,'æå››-ls','192.168.32.1','2020-03-28 14:57:46'),(195,'æå››-ls','192.168.32.1','2020-03-28 15:04:17'),(196,'æå››-ls','192.168.32.1','2020-03-28 15:08:06'),(197,'æå››-ls','192.168.32.1','2020-03-28 15:13:09'),(198,'æå››-ls','192.168.32.1','2020-03-28 15:16:34'),(199,'æå››-ls','192.168.32.1','2020-03-29 03:14:11'),(200,'æå››-ls','192.168.32.1','2020-03-29 03:28:57'),(201,'æå››-ls','192.168.32.1','2020-03-29 03:45:45'),(202,'æå››-ls','192.168.32.1','2020-03-29 03:54:06'),(203,'æå››-ls','192.168.32.1','2020-03-29 04:16:14'),(204,'æå››-ls','192.168.32.1','2020-03-29 11:02:47'),(205,'æå››-ls','192.168.32.1','2020-03-29 13:11:13'),(206,'æå››-ls','192.168.32.1','2020-03-29 13:39:41'),(207,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-30 02:38:49'),(208,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-30 02:45:40'),(209,'æå››-ls','192.168.32.1','2020-03-30 02:59:24'),(210,'æå››-ls','192.168.32.1','2020-03-30 03:10:39'),(211,'æå››-ls','192.168.32.1','2020-03-30 03:21:44'),(212,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-30 03:26:12'),(213,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-30 07:44:45'),(214,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-30 07:47:41'),(215,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-30 08:20:45'),(216,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-30 10:45:14'),(217,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-30 10:48:17'),(218,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-30 10:55:26'),(219,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-30 10:56:43'),(220,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-30 11:20:34'),(221,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-30 11:55:16'),(222,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-30 12:13:46'),(223,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-30 14:50:44'),(224,'ç‹äº”-ww','192.168.32.1','2020-03-30 14:51:39'),(225,'èµµå…­-zl','192.168.32.1','2020-03-30 14:52:03'),(226,'èµµå…­-zl','192.168.32.1','2020-03-30 14:55:16'),(227,'èµµå…­-zl','192.168.32.1','2020-03-30 14:57:45'),(228,'èµµå…­-zl','192.168.32.1','2020-03-30 14:59:27'),(229,'èµµå…­-zl','192.168.32.1','2020-03-30 15:03:39'),(230,'èµµå…­-zl','192.168.32.1','2020-03-30 15:07:31'),(231,'ç‹äº”-ww','192.168.32.1','2020-03-30 15:27:43'),(232,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-30 15:29:04'),(233,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 01:09:53'),(234,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 01:37:47'),(235,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 01:39:13'),(236,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 02:23:47'),(237,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 02:30:52'),(238,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 02:35:02'),(239,'è¶…çº§ç®¡ç†å‘˜-system','192.168.32.1','2020-03-31 02:35:59'),(240,'æå››-ls','192.168.32.1','2020-03-31 02:36:08'),(241,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 02:37:15'),(242,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 02:38:57'),(243,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 02:41:16'),(244,'æå››-ls','192.168.32.1','2020-03-31 02:41:53'),(245,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 02:42:59'),(246,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 02:44:23'),(247,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 02:45:48'),(248,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 02:46:51'),(249,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 02:49:00'),(250,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 02:51:34'),(251,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 02:52:39'),(252,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 02:54:07'),(253,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 02:55:08'),(254,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 02:55:45'),(255,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 03:01:52'),(256,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 03:03:57'),(257,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 03:05:07'),(258,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 03:06:46'),(259,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 03:15:54'),(260,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 03:19:03'),(261,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 03:25:17'),(262,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 03:55:49'),(263,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 03:57:26'),(264,'èµµå…­-zl','192.168.32.1','2020-03-31 04:04:21'),(265,'ç‹äº”-ww','192.168.32.1','2020-03-31 04:06:07'),(266,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 04:06:36'),(267,'æå››-ls','192.168.32.1','2020-03-31 04:08:53'),(268,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 04:24:58'),(269,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 04:27:04'),(270,'èµµå…­-zl','192.168.32.1','2020-03-31 04:27:19'),(271,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 05:22:14'),(272,'æå››-ls','192.168.32.1','2020-03-31 05:25:59'),(273,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 05:26:29'),(274,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 05:32:59'),(275,'èµµå…­-zl','192.168.32.1','2020-03-31 05:33:20'),(276,'ç‹äº”-ww','192.168.32.1','2020-03-31 05:34:10'),(277,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 05:34:46'),(278,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 08:51:42'),(279,'æå››-ls','192.168.32.1','2020-03-31 08:59:00'),(280,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 09:41:52'),(281,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 10:09:36'),(282,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 10:13:32'),(283,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 10:57:50'),(284,'èµµå…­-zl','192.168.32.1','2020-03-31 11:00:08'),(285,'ç‹äº”-ww','192.168.32.1','2020-03-31 11:01:16'),(286,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 11:03:08'),(287,'ç‹äº”-ww','192.168.32.1','2020-03-31 12:06:01'),(288,'ç‹äº”-ww','192.168.32.1','2020-03-31 12:09:42'),(289,'ç‹äº”-ww','192.168.32.1','2020-03-31 12:13:04'),(290,'ç‹äº”-ww','192.168.32.1','2020-03-31 12:23:30'),(291,'èµµå…­-zl','192.168.32.1','2020-03-31 12:25:03'),(292,'ç‹äº”-ww','192.168.32.1','2020-03-31 12:25:59'),(293,'ç‹äº”-ww','192.168.32.1','2020-03-31 12:32:27'),(294,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 12:33:31'),(295,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 12:35:13'),(296,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 12:35:50'),(297,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 12:37:33'),(298,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 12:39:58'),(299,'ç‹äº”-ww','192.168.32.1','2020-03-31 12:40:18'),(300,'ç‹äº”-ww','192.168.32.1','2020-03-31 12:55:01'),(301,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 13:08:36'),(302,'ç‹äº”-ww','192.168.32.1','2020-03-31 13:09:26'),(303,'èµµå…­-zl','192.168.32.1','2020-03-31 13:09:46'),(304,'å­™ä¸ƒ-sq','192.168.32.1','2020-03-31 13:10:27'),(305,'èµµå…­-zl','192.168.32.1','2020-03-31 13:11:29'),(306,'ç‹äº”-ww','192.168.32.1','2020-03-31 13:13:12'),(307,'æå››-ls','192.168.32.1','2020-03-31 13:13:39'),(308,'æå››-ls','192.168.32.1','2020-03-31 13:17:36');

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `createtime` datetime DEFAULT NULL,
  `opername` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_notice` */

insert  into `sys_notice`(`id`,`title`,`content`,`createtime`,`opername`) values (1,'å…³äºç³»ç»ŸV1.3æ›´æ–°å…¬å‘Š','2','2018-08-07 00:00:00','ç®¡ç†å‘˜'),(10,'å…³äºç³»ç»ŸV1.2æ›´æ–°å…¬å‘Š','12312312<img src=\"/resources/layui/images/face/42.gif\" alt=\"[æŠ“ç‹‚]\">','2018-08-07 00:00:00','è¶…çº§ç®¡ç†å‘˜'),(11,'å…³äºç³»ç»ŸV1.1æ›´æ–°å…¬å‘Š','21321321321<img src=\"/resources/layui/images/face/18.gif\" alt=\"[å³å“¼å“¼]\">','2018-08-07 00:00:00','è¶…çº§ç®¡ç†å‘˜');

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT 'æƒé™ç±»å‹[menu/permission]',
  `title` varchar(255) DEFAULT NULL,
  `percode` varchar(255) DEFAULT NULL COMMENT 'æƒé™ç¼–ç [åªæœ‰type= permissionæ‰æœ‰  user:view]',
  `icon` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `open` int(11) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  `available` int(11) DEFAULT NULL COMMENT 'çŠ¶æ€ã€0ä¸å¯ç”¨1å¯ç”¨ã€‘',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`pid`,`type`,`title`,`percode`,`icon`,`href`,`target`,`open`,`ordernum`,`available`) values (1,0,'menu','YÂ·Fä»“å‚¨ç®¡ç†ç³»ç»Ÿ',NULL,'&#xe68e;','æ— ','',1,1,1),(2,1,'menu','åŸºç¡€ç®¡ç†',NULL,'&#xe857;','æ— ','',1,2,1),(3,1,'menu','è¿›è´§ç®¡ç†',NULL,'&#xe667;','æ— ',NULL,0,3,1),(4,1,'menu','é”€å”®ç®¡ç†',NULL,'&#xe626;','æ— ','',0,4,1),(5,1,'menu','ç³»ç»Ÿç®¡ç†',NULL,'&#xe716;','æ— ','',0,5,1),(6,1,'menu','å…¶å®ƒç®¡ç†',NULL,'&#xe714;','æ— ','',0,6,1),(7,2,'menu','å®¢æˆ·ç®¡ç†',NULL,'&#xe63a;','/bus/toCustomerManager','',0,7,1),(8,2,'menu','ä¾›åº”å•†ç®¡ç†',NULL,'&#xe658;','/bus/toProviderManager','',0,8,1),(9,2,'menu','å•†å“ç®¡ç†',NULL,'&#xe657;','/bus/toGoodsManager','',0,9,1),(10,3,'menu','å•†å“è¿›è´§',NULL,'&#xe756;','/bus/toInportManager','',0,10,1),(11,3,'menu','å•†å“é€€è´§æŸ¥è¯¢',NULL,'&#xe615;','/bus/toExportManager','',0,11,1),(12,4,'menu','å•†å“é”€å”®',NULL,'&#xe65a;','/bus/toSalesManager','',0,12,1),(13,4,'menu','é”€å”®é€€è´§æŸ¥è¯¢',NULL,'&#xe6b2;','/bus/toSalesbackManager','',0,13,1),(14,5,'menu','éƒ¨é—¨ç®¡ç†',NULL,'&#xe715;','/sys/toDeptManager','',0,14,1),(15,5,'menu','èœå•ç®¡ç†',NULL,'&#xe62a;','/sys/toMenuManager','',0,15,1),(16,5,'menu','æƒé™ç®¡ç†','','&#xe857;','/sys/toPermissionManager','',0,16,1),(17,5,'menu','è§’è‰²ç®¡ç†','','&#xe612;','/sys/toRoleManager','',0,17,1),(18,5,'menu','ç”¨æˆ·ç®¡ç†','','&#xe770;','/sys/toUserManager','',0,18,1),(21,6,'menu','ç™»é™†æ—¥å¿—',NULL,'&#xe621;','/sys/toLogLoginManager','',0,21,1),(22,6,'menu','ç³»ç»Ÿå…¬å‘Š',NULL,'&#xe756;','/sys/toNoticeManager',NULL,0,22,1),(23,6,'menu','å›¾æ ‡ç®¡ç†',NULL,'&#xe600;','/resources/page/icon.html',NULL,0,23,1),(30,14,'permission','æ·»åŠ éƒ¨é—¨','dept:create','',NULL,NULL,0,24,1),(31,14,'permission','ä¿®æ”¹éƒ¨é—¨','dept:update','',NULL,NULL,0,26,1),(32,14,'permission','åˆ é™¤éƒ¨é—¨','dept:delete','',NULL,NULL,0,27,1),(34,15,'permission','æ·»åŠ èœå•','menu:create','','','',0,29,1),(35,15,'permission','ä¿®æ”¹èœå•','menu:update','',NULL,NULL,0,30,1),(36,15,'permission','åˆ é™¤èœå•','menu:delete','',NULL,NULL,0,31,1),(38,16,'permission','æ·»åŠ æƒé™','permission:create','',NULL,NULL,0,33,1),(39,16,'permission','ä¿®æ”¹æƒé™','permission:update','',NULL,NULL,0,34,1),(40,16,'permission','åˆ é™¤æƒé™','permission:delete','',NULL,NULL,0,35,1),(42,17,'permission','æ·»åŠ è§’è‰²','role:create','',NULL,NULL,0,37,1),(43,17,'permission','ä¿®æ”¹è§’è‰²','role:update','',NULL,NULL,0,38,1),(44,17,'permission','è§’è‰²åˆ é™¤','role:delete','',NULL,NULL,0,39,1),(46,17,'permission','åˆ†é…æƒé™','role:selectPermission','',NULL,NULL,0,41,1),(47,18,'permission','æ·»åŠ ç”¨æˆ·','user:create','',NULL,NULL,0,42,1),(48,18,'permission','ä¿®æ”¹ç”¨æˆ·','user:update','',NULL,NULL,0,43,1),(49,18,'permission','åˆ é™¤ç”¨æˆ·','user:delete','',NULL,NULL,0,44,1),(50,18,'permission','ç”¨æˆ·æŸ¥è¯¢','user:view',NULL,NULL,NULL,NULL,50,1),(51,18,'permission','ç”¨æˆ·åˆ†é…è§’è‰²','user:selectRole','',NULL,NULL,0,46,1),(53,14,'permission','éƒ¨é—¨æŸ¥è¯¢','dept:view',NULL,NULL,NULL,0,48,1),(54,15,'permission','èœå•æŸ¥è¯¢','menu:view',NULL,NULL,NULL,0,49,1),(55,16,'permission','æƒé™æŸ¥è¯¢','permission:view',NULL,NULL,NULL,0,50,1),(56,17,'permission','è§’è‰²æŸ¥è¯¢','role:view',NULL,NULL,NULL,0,51,1),(57,18,'permission','ç”¨æˆ·æŸ¥è¯¢','user:view',NULL,NULL,NULL,0,52,1),(58,1,'menu','æµç¨‹ç®¡ç†',NULL,'&#xe653;','æ— ','',0,53,1),(59,58,'menu','æµç¨‹ç®¡ç†',NULL,'&#xe66e;','/sys/toProcessManager','',0,54,1),(61,1,'menu','å®¡æ‰¹ç®¡ç†',NULL,'&#xe679;','æ— ','',0,56,1),(62,61,'menu','è¯·å‡å•ç®¡ç†',NULL,'&#xe637;','/sys/toLeavebillManager','',0,57,1),(63,61,'menu','æˆ‘çš„å¾…åŠä»»åŠ¡',NULL,'&#xe668;','/sys/toTaskManager','',0,58,1),(64,61,'menu','æˆ‘çš„å®¡æ‰¹è®°å½•',NULL,'&#xe665;','/sys/toAuditManager','',0,59,1),(68,7,'permission','å®¢æˆ·æŸ¥è¯¢','customer:view',NULL,NULL,NULL,NULL,60,1),(69,7,'permission','å®¢æˆ·æ·»åŠ ','customer:create',NULL,NULL,NULL,NULL,61,1),(70,7,'permission','å®¢æˆ·ä¿®æ”¹','customer:update',NULL,NULL,NULL,NULL,62,1),(71,7,'permission','å®¢æˆ·åˆ é™¤','customer:delete',NULL,NULL,NULL,NULL,63,1),(73,21,'permission','æ—¥å¿—æŸ¥è¯¢','info:view',NULL,NULL,NULL,NULL,65,1),(74,21,'permission','æ—¥å¿—åˆ é™¤','info:delete',NULL,NULL,NULL,NULL,66,1),(75,21,'permission','æ—¥å¿—æ‰¹é‡åˆ é™¤','info:delete',NULL,NULL,NULL,NULL,67,1),(76,22,'permission','å…¬å‘ŠæŸ¥è¯¢','notice:view',NULL,NULL,NULL,NULL,68,1),(77,22,'permission','å…¬å‘Šæ·»åŠ ','notice:create',NULL,NULL,NULL,NULL,69,1),(78,22,'permission','å…¬å‘Šä¿®æ”¹','notice:update',NULL,NULL,NULL,NULL,70,1),(79,22,'permission','å…¬å‘Šåˆ é™¤','notice:delete',NULL,NULL,NULL,NULL,71,1),(81,8,'permission','ä¾›åº”å•†æŸ¥è¯¢','provider:view',NULL,NULL,NULL,NULL,73,1),(82,8,'permission','ä¾›åº”å•†æ·»åŠ ','provider:create',NULL,NULL,NULL,NULL,74,1),(83,8,'permission','ä¾›åº”å•†ä¿®æ”¹','provider:update',NULL,NULL,NULL,NULL,75,1),(84,8,'permission','ä¾›åº”å•†åˆ é™¤','provider:delete',NULL,NULL,NULL,NULL,76,1),(86,22,'permission','å…¬å‘ŠæŸ¥çœ‹','notice:view',NULL,NULL,NULL,NULL,78,1),(91,9,'permission','å•†å“æŸ¥è¯¢','goods:view',NULL,NULL,NULL,0,79,1),(92,9,'permission','å•†å“æ·»åŠ ','goods:create',NULL,NULL,NULL,0,80,1),(93,9,'permission','å•†å“åˆ é™¤','goods:delete',NULL,NULL,NULL,0,81,1),(94,9,'permission','å•†å“ä¿®æ”¹','goods:update',NULL,NULL,NULL,0,82,1),(97,1,'menu','ç»Ÿè®¡åˆ†æ',NULL,'&#xe6b2','123',NULL,NULL,72,1),(98,97,'menu','å¹´åº¦å•†å“é”€é‡ç»Ÿè®¡',NULL,'&#xe62c;','/stat/toYearGoodsStat',NULL,NULL,30,1),(99,97,'menu','æœˆåº¦å•†å“é€€è´§ç»Ÿè®¡',NULL,'&#xe691;','/stat/toMonthGoodsSalesbackStat',NULL,NULL,31,1);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`remark`,`available`) values (1,'è¶…çº§ç®¡ç†å‘˜','æ‹¥æœ‰æ‰€æœ‰èœå•æƒé™',1),(4,'åŸºç¡€æ•°æ®ç®¡ç†å‘˜','åŸºç¡€æ•°æ®ç®¡ç†å‘˜',1),(5,'ä»“åº“ç®¡ç†å‘˜','ä»“åº“ç®¡ç†å‘˜',1),(6,'é”€å”®ç®¡ç†å‘˜','é”€å”®ç®¡ç†å‘˜',1),(7,'ç³»ç»Ÿç®¡ç†å‘˜','ç³»ç»Ÿç®¡ç†å‘˜',1),(8,'æµç¨‹ç®¡ç†æƒé™','æµç¨‹ç®¡ç†æƒé™',1),(9,'å®¡æ‰¹æƒé™','å®¡æ‰¹æƒé™',1);

/*Table structure for table `sys_role_permission` */

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `rid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`pid`,`rid`),
  KEY `FK_tcsr9ucxypb3ce1q5qngsfk33` (`rid`),
  CONSTRAINT `FK_PERMISSION_PID` FOREIGN KEY (`pid`) REFERENCES `sys_permission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_ROLE_RID` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_permission` */

insert  into `sys_role_permission`(`rid`,`pid`) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,21),(1,22),(1,23),(1,30),(1,31),(1,32),(1,34),(1,35),(1,36),(1,38),(1,39),(1,40),(1,42),(1,43),(1,44),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,61),(1,62),(1,63),(1,64),(1,68),(1,69),(1,70),(1,71),(1,73),(1,74),(1,75),(1,76),(1,77),(1,78),(1,79),(1,81),(1,82),(1,83),(1,84),(1,86),(1,97),(1,98),(1,99),(4,1),(4,2),(4,7),(4,8),(4,9),(4,68),(4,69),(4,70),(4,71),(4,81),(4,82),(4,83),(4,84),(5,1),(5,3),(5,10),(5,11),(6,1),(6,4),(6,12),(6,13),(7,1),(7,5),(7,6),(7,14),(7,15),(7,16),(7,17),(7,18),(7,21),(7,22),(7,23),(7,30),(7,31),(7,32),(7,34),(7,35),(7,36),(7,38),(7,39),(7,40),(7,42),(7,46),(7,51),(7,53),(7,54),(7,55),(7,56),(7,57),(7,73),(7,74),(7,75),(7,76),(7,77),(7,78),(7,79),(7,86),(8,1),(8,58),(8,59),(9,1),(9,61),(9,62),(9,63),(9,64);

/*Table structure for table `sys_role_user` */

DROP TABLE IF EXISTS `sys_role_user`;

CREATE TABLE `sys_role_user` (
  `rid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`rid`),
  KEY `FK_203gdpkwgtow7nxlo2oap5jru` (`rid`),
  CONSTRAINT `FK_203gdpkwgtow7nxlo2oap5jru` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `FK_rmo144ixp2kul8rgs4sk5j0er` FOREIGN KEY (`uid`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_user` */

insert  into `sys_role_user`(`rid`,`uid`) values (1,2),(4,3),(5,4),(6,6),(7,5),(9,3),(9,4),(9,5);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `loginname` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `deptid` int(11) DEFAULT NULL,
  `hiredate` datetime DEFAULT NULL,
  `mgr` int(11) DEFAULT NULL,
  `available` int(11) DEFAULT '1',
  `ordernum` int(11) DEFAULT NULL,
  `type` int(255) DEFAULT NULL COMMENT 'ç”¨æˆ·ç±»å‹[0è¶…çº§ç®¡ç†å‘˜1ï¼Œç®¡ç†å‘˜ï¼Œ2æ™®é€šç”¨æˆ·]',
  `imgpath` varchar(255) DEFAULT NULL COMMENT 'å¤´åƒåœ°å€',
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_3rrcpvho2w1mx1sfiuuyir1h` (`deptid`) USING BTREE,
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`deptid`) REFERENCES `sys_dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`name`,`loginname`,`sex`,`remark`,`pwd`,`deptid`,`hiredate`,`mgr`,`available`,`ordernum`,`type`,`imgpath`,`salt`) values (1,'è¶…çº§ç®¡ç†å‘˜','system',1,'è¶…çº§ç®¡ç†å‘˜','532ac00e86893901af5f0be6b704dbc7',1,'2018-06-25 11:06:34',NULL,1,1,0,'images/defaultuserhead.jpg','04A93C74C8294AA09A8B974FD1F4ECBB'),(2,'æå››','ls',0,'KING','b07b848d69e0553b80e601d31571797e',1,'2018-06-25 11:06:36',NULL,1,2,1,'images/defaultuserhead.jpg','FC1EE06AE4354D3FBF7FDD15C8FCDA71'),(3,'ç‹äº”','ww',1,'ç®¡ç†å‘˜','3c3f971eae61e097f59d52360323f1c8',3,'2018-06-25 11:06:38',2,1,3,1,'images/defaultuserhead.jpg','3D5F956E053C4E85B7D2681386E235D2'),(4,'èµµå…­','zl',1,'ç¨‹åºå‘˜','2e969742a7ea0c7376e9551d578e05dd',4,'2018-06-25 11:06:40',3,1,4,1,'2020-03-31/202003312112498488719.jpg','6480EE1391E34B0886ACADA501E31145'),(5,'å­™ä¸ƒ','sq',1,'ç¨‹åºå‘˜','47b4c1ad6e4b54dd9387a09cb5a03de1',2,'2018-06-25 11:06:43',4,1,5,1,'images/defaultuserhead.jpg','FE3476C3E3674E5690C737C269FCBF8E'),(6,'åˆ˜å…«','lb',1,'ç¨‹åºå‘˜','bcee2b05b4b591106829aec69a094806',4,'2018-08-06 11:21:12',3,1,6,1,'images/defaultuserhead.jpg','E6CCF54A09894D998225878BBD139B20');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
