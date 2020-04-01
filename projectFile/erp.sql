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

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('2',1,'Desktop/leaveBillProcess.png','1','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0�\0\0\0;�O\0\0\0sRGB\0���\0\0\0gAMA\0\0���a\0\0\0	pHYs\0\0�\0\0��+\0\0\0!tEXtCreation Time\02020:03:29 21:30:44�_�D\0\00�IDATx^��t�7��?i6Ea�V6U!\\m�X����\'$9U	-�pE��$�(p�R�֢��W��yo\r޷���7�WY)��o+	���z�`k	h�ʆZݼX�������d2��Mvv�����<gy�g��0;��g&��mppP\0���\0 d\0��\0\"B6���M\0 \"d\0��\0\"B6���M\0 \"d\0��\0\"B6���M\0 \"d\0��\0\"B6���M\0 \"d\0��\0\"B6���M\0 \"d\0��\0\"B6���M\0 \"�]_ȘP(������y�ȑ`0�:].Waa���-++s�ݬ,���ظ}����\n��ӧ�K�b�����7�<N�E	�bŊ��\Z6	,�iE��5k�Ѐ�{��?>��}ǓO����������րl��ټy�s�=������ż+tŷ�޵����Pt��{��p/ҁ�Ԫ��{zz^��k�\n&B}�緿��K_Z�`A �`v7A�Q0����^���ŷ�1�K���w���yyy���)G#����$������}ׁpqgz����ڼy3\rst	&B�w�������0n���쬭�}���N�뮙3g�\\������M�B3g����_�`��u�����:�+;�5�Jcc#]��L��񔗗o۶����0n�T)--}�\'��	����n���ӧyL�&H�`0��ٙ�`\"4t�2eJ[[o�� � %肮���7R�[omjj�\r0d�D{{{aa!o�Fa��&C6AJ�<y�\'�Fj��M9q�$o�� � %�����Ԙ4��ݍ_�3-d�eӤI�x#5\\.W(�\r0d�������_e	0�&H	���y#5N�:9e\n�����M�yyy���\Z�}Oj/!��M�ӧO��뼑\ZǎuM���\r0d�DEEž}��`�/�쩮��\r0d�]ӹ\\.\Z���B�P{{;����!� UV�X������\'�ܾt�2|G���{ Uhh�����+������ok;��wBa��B��M�6�[w/o�M���&sC6A\nUUU�g���p�X��O=�ȣ��6��� ���`YY���]~�Ok��Ư�}��k���w�Ia���v�w�ܹ�{�K���L˗�G��d�&H9�׻m۶ŷ����λF�.�nY��;�s�7�����pMiB�����y��=4��	�BO>���{�Ѕ��_�\"��ø	҄򨹹�*Es���=A����{�]7|���z�W��\r��R0n�t�=��Ν;��z�ӧ�����#G������}/����=�1/�7`9�&�\Z7�0���������(��y��**���Fu�f�lQ���644�X�	Da��h�a�\0\"B6���M\0 \"d\0��\0\"B6���M\0 \"d\0��\0\"B6���M\0 \"d\0��\0\"B6���M�I~��f����̜9������7n\\WW�,�����M��P����*�@��M�o�L�Tr�ݽ���-IgΜ9z�(����0n�Lr�\\k׮u:��-Is�̩��A0�M�y�����*������4h��b���0n��۳gOVVUzzz���L@�M�y���+**b���\nV��5!����՜���]`m�&���h��P(������D#��2>�b�dn������+�C6YZss�U�|>�\'y<trN�2�O��S�NQ.�����;x���\rjjj�4�d�E��5k֜>}z��wx<�2�9��]��ݽs�N�LA6Y�{���w���K��.���K�<�����$�4B6YQmm�ܢ9K�~��!��փO--��\ri�l�����-[�~��&ކ�x��	�\'��Ox��d-�P(??��+<�I��=6wN���>x�f�\\���������\nI���p�y�,�)�\"�*.W��%�w���� ���Z����R��t�7���u��x�������8{�����/�~~���`���C�|)4�ġ��{-_�b��D¼�k:k���{����kf9/9;8h�.H��+Kz��\r�o~�w�{���@x��OS���W�,�=����lAK�˺�^~չs�x��&k	�Tt�c���	i�S�˶�9�?75����z���!���.wHn�M^����\n]�Q<��}Hd���A�{��ēh�|�W��r��.\\���]�����!�sH�薤q��̪�V �pMg-6���Bo���&|�?�IH�˷�.�ϟ/((�:�MY\\����\0~�7|���e-�vΔ4øɂ��@�d�ђ����a�t���>\nNG΄K�5ܐ�3S���\n��ɂF�r6[��eQ�\'��\\5q��S����{%����\'�����������\n���rlҠR��c�r�%�Krڥ|�۞�{�Փ�|�oQ�����ɀtN���$)�e-U��yH/�o���v��!I7޴艭;�_����d����P�+\'�����I��s�m�>�:t෭/���m|I�q:?�3%͐M�\"g�?xC�z��[�n��n[��9��g3+��2�)i�l�9�>�\rH��y9Δ4C6YK8�����0��8S��d-r6��\rH��qΔ4C6Y��Mῠ��tL�f�&k��)��0�Ã3%���&���q���c(�-�]lW��!���������S�N?~���?�{AW�`����6\rBiWϞ=�\n�&��<y��~YϞ=Kg���_q�hF��#W���2�R�vF��MpmI�a۶m���}��g��r��Z��$��7��9���M����o}�[?�����������	�r8�dkV*��Z�~����#o�t�Վ\r=�)]]]���7�~�m�+I>��v��\'x�#z6�B��������V�wxh�!t2����5]9W�5S��0Q;#]t�X��<oJѳ����q��B��j:�Sz��Ŕ�ĸ<]�l����\'�hnn��K;��֯~��ٍ�ñ���REE=����z��+���e���p\\�kC���I�z:����8ϫ;z.:S�Mq���Ǐ�]�D�^z�5�\\�������~ۦ#������g̘�z�jv���D����j�q�f|�)�&N�HJ����C�mذ����M���Vח�1���*���<�2���Ě�ԩB��\"W�\n�,ʙBo9+W����{��Zvv6�sao9��Iʬݻw��X	�M�¯Y���䕱�����N��C�6����\"���S���l:��r8�\\t͑�hz��k���\"���6�\r=��L	�B�7onhh��g>��655���ORgggmm-ʻ���ʦ��F��^x����l<m	��S<E^?�4��1jj�gT2EـX=	�՝D���<�L���J��6����i���555�Kle�ҋ-:p����(/g��?Ip8x��L����M�:���u��E�\n�B�%��P<-X�`ӦM>��w	L�l�5kV]]�!�Z$�l|8�N�����lͬB��?��)3k(KER��<�$�֩Z�	��Л(�SGG����峗t��x\ZLF�x:�RQ�5�\n���T�:��\"oӣ�_.|)y�u�<J�V�U*�I�e~YYٶm��RQ�i���+V��\r�1��k�:���fVa�#���/T��JuzdM�l�P^��h)\n��*E=\n�yбJG,oL�l\n����m(�x�Y�Cqدak�J��[�I���~*4���k*�D��\n��$����57SP������6���D�ɠWsĀ�9�t(�oRa����%֤8�k*�k~�����lJHkkkqq1o�7^s֡$RL��X���%D6�5��]����D�u]]]�!*!�)\n�[&���?	��`���,舥�7D%ʽp���Fc��W_��$XL%//��_�!D6�A#~�1��k�:�D\n��M�O��lBl��k�ik���0��:s|.\\!�q+ĸ	�f�F�(�*�n�&k�x<���#N<��H7d���x|�m��GI������ ���Z����������׍�{ƅl������Ɨq�iTe_�����|B� ��%//��r�c��9�Pb��E��SF�[\0F��$�pO���6m���+�]C �Ai��?�v��]f���p\\.W}�ӫV=��uB3F@Q\n������o�`2d�y�����t�m��ߚ���ƗKK�o�pgI�r�� �pM�,�n<]�=�Ъ��?-[vKY�l��2>����Ϳojj\r�z\Z6��F�Ꞌ��E6%��OZZZv�z�N�@������K��f���TU��]&�lJ�	HmmmCCo@�!��l�=�N��m�\0!�\0@D�&\0�	\0D�l���l6���:բvĂl��푨��C6�n�SoGL��6@$|�)Y���dD&��ƶO,�\'3B���q����V*t�3��ԝQg\0�@6�>XB)x���H�Cu�\\�	�ł�5���0����l�1�pa���D�����L��lfzTza�؞d�u��~�r�\Z��7>y��U�S%�>���,�\'cQv)Q�����=�U�oc�:�#>�A��N�\r�a��𶌚��\"��l4�&H9:���Y�M���T��ə9s&5sss�9nܸ��.6ew)���I�6#d��rn�Ozd�:M\"�a��&eggSO(���J ����BdSl�R��F֩��+ǻ���\'3�v��16�����Tr�ݽ���-IgΜ9z�(��.�c�X�#M�\Z��m\"��	2��r�]���t�$͙3�����AQ�yd�u�\";ŏ�8���x<���T���loo�Ae�j�`SrJ]]���i&�E�\n�M�y{����ʢJOOO]]�)�&qX3j�P��w�	2o޼yEEE�^QQ�*�P\0Ef5�����3�^6�!��@ 77���^/����*�c��U�!*�q+������0��{2=����=���콨���/!�O����7��B���Ʀ�&\Z����	�\'s�����t]i�\"��lʔ���U�V�|��N�x��2e\n�f1�N��\\�	���w���\r6����if�lJ�)�����5kN�>���;<��u�����޹s�Yw�)!Ȧ4�s������ߵt�R���鑇���4��]&�lJ�)�jkk��Y����\r1���xjii�mA6%ٔN���[����7M�\rq=����O�����Y ��lJ�P(�����$�q��;����d�����­������x<WH��r��%Y�O\'R�E,U\\��%K�ڵ��AHd��455-���7$��o��3/��d����7z;{�p�B����^���`۹��s���9�Rh��C��u�Z����/��.�y��t�2����޽�N�~�5�����\rJ��ɕ%=����7?��ƽ�ya` <t觩YRǫG�̞�w�c����e�g/��ܹs�m\n����I�:�HY���4�)�e[ɜٟ����ys=N���SqJ�;$��������\n]�Q<��}Hd���A�{��ē��l��7 9��)�]��w����?p�C\Z���-I���UZ�@��.Y��x�ھ=�����q��\'!�.�.�D\Z<������[4eq��_>;|��?v��/����Q�=D��5��H�H4Z���7�>앎���G����șp	��2t���T�tC6YЈS�f���,������&Nt��_2a�$}|^��|x�޾��?#��T1�@  ��	\"�,�&\r*��96)\'[r�$�]��^���W^=��7�U�I�H�$)�N�^�R%��7�P($��~S�w��yC�n�i�[w����?��f�9��^WNN__��t����}�u��o[_���3����t~Ƹ�h����\'�x��_�m!!��e�l�o�V������m�?��lf�t^f�lڸq��(,dS��M�$���Lٴ`��իW��\r�����M�2^6���7 aN�gM�M�@`֬Y��@�� :�PF[����WTT�^xB0nJy���0*N�$s��ؗ�>|X�� ��e�l\n�$���#�jkk���\r�g\ZpMgAt�������-[�R�(?�`~t)G#�cǎ����.�!�,H3\"���������GV�V�/���/:��h�L�U0��R~~>]�(��7%�p�������Ǖ���f�U�J���9/�8Mլ��Q�!���z\nM�e��9�u����������wvvVTT�w�}��C{Ȧd0��cu��*�I��HE�:y-|�k���K1�I�뚕D6y-�z6��S3I�f+))����G[���\n�bп��lJ���]���:ru�\nMRf����a��K�jճi&��d\"{⠙Y%�\"4�qQ�B6%ˀ��o�O�ɼA���au��ԣ�k�٢Nb\"�T�~���(ԓX�\"�\"����zb-BhdS�!��e�l:��Sn�Ҽh]]�Ge��S�z�b=Q/9[d�U\"��ð�#�4�)��s����k#�Ag+��ZdO��8�D�k��S���R��T���\0�Y.�(}���Y���FyzLlâ��R�>Ɋ��f`���YYj��0�Nu�>UI�B=,q��K)[������e��4��t���岉҇�m5)q\";�Ⓧ�68\\��+�:����R�R�Zd�h��B4=r��RJ��2q�[=�Ρ2��֦z�IQM䕡���&���Q �xM9�a�d�Q��LS\n��o�����QW���2Tg�ԅ�1�\n��Z�y3(��V��r��dhR��,\"W��;�� +�����\r���/���(x��\r�r�U5�\'�觸�y�p�PE]���S�MO���l��`=����<����y�D�(�T�<�ڈ�#���B&#�O�f�������8&�zDC[�?�o��_9�:���g`�$��4��cQ�Gy\"�3�v��Jԩ��5�U6!Ϋ4���t�Fo�#CJ�\'Ra4M�������0���z�����tt�1�}1t>�0�����@�Y�~�:k(�X�#K1�w@�	q=5R��{:��j�!�&%>��hk��$�n�f�W��8�2uz+��*�͠:�D���Lm����t�$�n�\Z�U6!Ϋ���,z�I���=�%q6I3)Μ��8��0�=�@��9q^���0`6��7 av�uȦ4�g/���r�B!\Z)���@�!������8�P.Z ݐM���z���M��(��c����tA6YKqq����x�������\rHd��TUU56��[N�*��^.//�{��d-yyy��K�������/�\\�����{��!H��6�Mm�t��W�� �@����;~��˻ ]0n���U_���U�vu�ЌPԅ��������#�2�dE^���~\'�x�7���Da�������6�YR���5H/\\�%˸Ow=����O˖�RV6�㹌O��`�ls�ZC�ކ��nw1�\0i�lJ��7�������8����?x���ݗ���*//��Zϻ C�M�2z6��������7��M�B6�{�p/\0D�l\0!�\0@D�&\0Q��d��^��E�I`2x�!I:�dD��MS#�������8�o�Z4lę\'�]d�=		��h�a�iB3�������+�Q���IHPRGL�&c�Rw�W��3�Ai�3��7�/.�:�NҸ�^�Ȟ�%{4h�\'��_�j ������o�)�?ٓ� =Nǎ-z��!��Ք~0�ک�	*|��0J:d?c��Q?��*���`0�dx�H|��0J:dӘA���ߩ��^�QJ�g/�:t�h�` �e��.�FE4u���?��X��V9\"�3,N���f*|���{�IJxEM1����&L�Ñu�X{ţ\0�T6)��yJ��pT:�d蕍|��K�`SFK�Ԡ#ظ�e�\n�$���^8\0� �\0@D�&\0�	\0D�l\0!�\0@D�&\0�	2����l�����3gR377���ƍ���b3�e!� �����1\nuvvR%�caa!�	��d���ɠTr�ݽ���-IgΜ9z�(��.�$�� �\\.�ڵk�N\'oKҜ9sjjjL�qS�0nJ������Jeee{{;\r�(��$�,�� ���ٓ��E������:dd޼y󊊊X����U��pM�,\\��\"����՜���]`mȦd!��=	jȦd	��P��������$\'e|$!O�v������?OLdS�������U�V�|��N�x�t�2e\n�I8u��|O0�o߾�nذ����O]!��%����5k֜>}z��wx<�)@�zݽ뺻�w�܉]�;dS���x:[JKK���]K�.�]�b�����Ï��~\Z��.��)YBm|mm�ܢ9K�~��!-Z[R<����6��o2����ӧ�G0�_q����G���=`ܔ,A6>\n���z���Ļ �h�ϝS��?��g��&����%%%��DA.7/�=˙�HQAsq���,Y�k�.�z@�0nJ� �hѢ�|����ּ��������>*��w����Z�+����	���M\nO:琎��Oo<�u��g9��������mH�)Y�l<]��ݻ{�����wvp�6(]��$W����������慁��}?M͒:^=�d����d�e�g/��ܹs�\r��5�I�I�:�HY���4�)}Z�J����Լ�ϛ�qJn�4��S��!��4�\"ʂ(c,tYG�$�L���$����=^u�H4�;���s��S4�p��veg��~�R�4�!ѣ[����3�DI��npM�,A6�6������5����?	It�v�%����]�ޢ)�������[����ㆯ|Y�,��v�ɢ���L�PJ�n�����a�t���>\nNG΄K�5ܐ�sI�,ʘ�ٔ,��%�]�-\\肎����Wx��8��)[�������y����z����ĂlJ���a�H\0#��slRN6E��K��k�=��ʫ\'�ߢ�ۃ!��$�Ӊ�eQ�\\@7�ߔ��3g644̘1��3D���oH�M7U<�u����ß!�lv����u�����٤A��s�m�>�:t෭/���|IHB�s\"�7�ٔ����\r6����v��>�p�Cސ�^}�֭�x#��/~��$o@r��� ��lJVmmmqqqƿ`LΦ�d��y�I/�ߔ,\n��V|9�ΐM���|mmm��a􎍒��A6%����\\���N�� � J��٤�e˖����7p���\r��}���Ç3����{��gx2������q�蚮�������3��u�d��n0n��ƍ{zz���x;��q� O�.�Ãq�^0n�\re\r�,XyW���n��\r�M:cPwٲe+W�L��\'y��>o@�8�øI/7鬬��}c��Y�hE����6	\0�qS��B!J���������S��x\r2���&� �L��a�{��p\\�#Y/�&����]ހq8�Ƒ��o2:+-tizXQ�#+c+�,���@�f�U4s&W@77��<nz�7�q8&�Zlq�-V%*�j#猿8sѧ���\'\"�E�k����c=��?겉��q$��&3aoݱ\n�i�b��1+�y�z�e���T*D�Yb�#gGx�l#�ֲ�fe��*l�ppD�z��U�\'%V@7�&3ќ\'#J�Iu�ᘢn��r\'��l���Ȋ�p���\n��D���Ж�6�zԳ�2=�6ܩ*�-�ZF��v�bĤ\n��t&��8�18�Sy-��,���ꙩG��`��y��\'��9�<J���T�I�GkE�Il=��������lz�7bp��E��uu��4�O%����(yʈ獜-��*���a�̑���R8���k:k���M]-�g����hc\"��z�N��B���:Ö�Z� d���;v�B��_Y����|�{�3+K\rU�Fө.�}%q�\n���Qf/��/T�����e��4��t^��n�Mf�9O\"��װ�����R��*QK��M�R��\'�D���G)r��[��q��U[��#M�Zh�P���6I6�?��A6���<�,tn�Ɋ���G]qدe��:��.\\��T��\'�ě��̊��Xo*ue��W24)�T�+��eM[�ym����\n��d!�l���a�|�IQ����Z!��f��s�f�yHdO���\0i��ә��s�㼑\0����S\'=�~���$�����z���T�٪�Σ�~V�:u�h�8���l2	ڇ�x2�n��#Y/�&�����7 C�v/�d� �LBΦ��b���H����0n2	y��ހ�ۯÑ�d�I���o@���_đ�\\ә���\n�BDIs� �L����?�q0J&��d^����O�I]]\'�U�\rH\Z��$�����q������v�������l2�����Ɨq�)�e_Ӂ��r�z@ҐM&���WY�����m�Q�_���r}������4|��<hд`AѦM��|��\"����Ç�r���.H\Z�M��r���^��Ѯ���\r��\n�����ߏ`��Mf��ֶjUMe��?�q-il<�~���`*)��w�N�M&Dw=����O˖�RV6�㹌O\0��g�����\Z\n�64lt�����ɴZZZv�z�N�@��t�v_ZV6�����j=��!�@���\r\r\r���lQ�0\05��\0D�l\0!�\0@D�&\0�	\0D�l\0!�\0@D�&\0�	\0D�l\0!� %l6��	~�?k��g�D^_��l���y�4���Q��8@M�����kD��=�uF��qї��!� !q^#����qq�\Z��(P|h�	*|��0J�&\Z�(x�H|��0J�&�/\r�\0��l���#�]*|�$�x-������zrrrfΜI���\\j�7�����\0��l�Q�a��\'�XZ�G����R����M��P����*�@��M �OF��a3 �8��2�U4sF�TP*�����^ޖ����3g�=z��yX�M0v�8D���aI�`Scq�\\k׮u:��-Is�̩��A0A�w�4�#X�̀L�x<���T���loo�Ae���qdޞ={�������SWW�`�l�̛7o^QQ�WTT�\nX��@�@ 77���^/�kC6�(p�\Z�	2&\n577wvv9r$�N��UXX���WVV��xX\'X�	2���q׮]���1̘1cŊ555�;nAB�BNN�G}���\nZZZ֯_�����	�1T]]�[��4u���!��`Ft�jժ�;w�FF7�<�k_��Շ-����j����y[F���Ѐ�dZeS������`F�O���|����s��7�z�|߅X���?��֭�[N����:��|�*�B�|N�<9k�,�:����R�?��)S⍔騸������>�o�G�07!�����\r0�����V^�G}t߯~?��(������y�ݎdkc_W\0�&D6�����Kmm�2�ٻ����>V�%���^���f���\"�|>�������Y�FL�����L�>���y��[ZZ�l���`VBd���;�v10��z�U����6bR�?�r�����;VS\"�Ȳe�v���`\n4bb�7���䎟��$��G?b?��ׯg�`J�d�ʕ+i��{�f�}�vV���z��	�]���R`2��HKK]8p���Ȃ��ĉY��w���7�>�N��GGKII	��e�D� +..^�f\ro���-և?�ߕ��U�_ٝ?>�h>;f\"P6��7Ҡ}���(���?^]]=u�����?���wH{{;��x�M���ۗ,a\Zk�\n��X�D6mڴz��3gRN����&O�l�����g�RH]���1�R�>}��(/o\n��11Ᲊ���uttPe֬Y4����ۣ�h�{�W�z__�o�q�u�-_���h_I\r�/���XW�`Bq�Jmmm����\'c�Hb���[o%�*��|�Ul�\"��|��������au��J�`��������糿���?�y�4��|����\Z`���b�%�w�AITYYy�����K�@ ����EO͂�����	ƈ���r���QL\\v�e��������`�c�£\'}uw�Y�>BC6�M�2e���l��i�&�fڴi��j�������&Vac40%�o���K���|�Pf���{4�b����Ư�/�ihh���a�`2�&H��S�������|2ߎ�q����_{-���G��dV���TQn?=��[׺���{Y����db7A��A��c�Bz��G���&���^4w�wtt̘����A7A�Р��x=�����2]�ݾ�6V_�r%���0n��R�2���9��+c��8]҈�ȑ#T�UѠ)�\r���	Rk����]�͝��e��ey0�\\.Z\'����M�Zyyy/�����y�I�}�	joo��\r_UBmӦM�>9+@6A�Q�P<��]��}�]7|�+�|-e�w��m�3vC������?`u07�o�4���Z�h�`f����Z��r�旁)���k�վ}���h��È�:�M�>�`p˖-��|Saa!]�E�TUUE#&�c�d�\r�֯_��_I��ҦM�|>o�e � 3h|���HWm�2�+��˛1c����+**0V�,d\0�?�\0!�\0@D�&\0�	\0D�l\0!�\0@D�&\0�	\0D�l\0!�\0@<����-EA�Z�\0\0\0\0IEND�B`�',0),('3',1,'Desktop/leaveBillProcess.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:dc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/testm1585483512332\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1585483512332\" name=\"\" targetNamespace=\"http://www.activiti.org/testm1585483512332\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"leaveBillProcess\" isClosed=\"false\" isExecutable=\"true\" name=\"leaveBillProcess\" processType=\"None\">\r\n    <startEvent id=\"_2\" name=\"StartEvent\"/>\r\n    <userTask activiti:assignee=\"#{userId}\" activiti:exclusive=\"true\" id=\"_3\" name=\"提交申请\"/>\r\n    <userTask activiti:exclusive=\"true\" id=\"_4\" name=\"审批[上级领导]\">\r\n      <extensionElements>\r\n        <activiti:taskListener class=\"com.dy.sys.listener.TaskListenerImpl\" event=\"create\"/>\r\n      </extensionElements>\r\n    </userTask>\r\n    <userTask activiti:exclusive=\"true\" id=\"_5\" name=\"审批[上上级领导]\">\r\n      <extensionElements>\r\n        <activiti:taskListener class=\"com.dy.sys.listener.TaskListenerImpl\" event=\"create\"/>\r\n      </extensionElements>\r\n    </userTask>\r\n    <endEvent id=\"_6\" name=\"EndEvent\"/>\r\n    <sequenceFlow id=\"_7\" sourceRef=\"_2\" targetRef=\"_3\"/>\r\n    <sequenceFlow id=\"_8\" name=\"提交\" sourceRef=\"_3\" targetRef=\"_4\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${outcome==\'提交\'} ]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_9\" name=\"同意\" sourceRef=\"_4\" targetRef=\"_5\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${outcome==\'同意\'}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_10\" name=\"同意\" sourceRef=\"_5\" targetRef=\"_6\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${outcome==\'同意\'}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_11\" name=\"放弃\" sourceRef=\"_3\" targetRef=\"_6\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${outcome==\'放弃\'}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_12\" name=\"驳回\" sourceRef=\"_4\" targetRef=\"_3\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${outcome==\'驳回\'}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_13\" name=\"驳回\" sourceRef=\"_5\" targetRef=\"_3\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${outcome==\'驳回\'}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"leaveBillProcess\">\r\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\r\n        <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"410.0\" y=\"0.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\r\n        <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"380.0\" y=\"70.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\r\n        <dc:Bounds height=\"55.0\" width=\"90.0\" x=\"380.0\" y=\"165.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"55.0\" width=\"90.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\r\n        <dc:Bounds height=\"55.0\" width=\"100.0\" x=\"375.0\" y=\"260.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"55.0\" width=\"100.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_6\" id=\"Shape-_6\">\r\n        <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"410.0\" y=\"355.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"_5\" targetElement=\"_3\">\r\n        <di:waypoint x=\"375.0\" y=\"287.5\"/>\r\n        <di:waypoint x=\"335.0\" y=\"180.0\"/>\r\n        <di:waypoint x=\"380.0\" y=\"97.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"15.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"_4\" targetElement=\"_3\">\r\n        <di:waypoint x=\"470.0\" y=\"192.5\"/>\r\n        <di:waypoint x=\"520.0\" y=\"150.0\"/>\r\n        <di:waypoint x=\"465.0\" y=\"97.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"-2.0\" width=\"0.0\" x=\"0.0\" y=\"15.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_7\" id=\"BPMNEdge__7\" sourceElement=\"_2\" targetElement=\"_3\">\r\n        <di:waypoint x=\"426.0\" y=\"32.0\"/>\r\n        <di:waypoint x=\"426.0\" y=\"70.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_3\" targetElement=\"_4\">\r\n        <di:waypoint x=\"422.5\" y=\"125.0\"/>\r\n        <di:waypoint x=\"422.5\" y=\"165.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"-17.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_4\" targetElement=\"_5\">\r\n        <di:waypoint x=\"425.0\" y=\"220.0\"/>\r\n        <di:waypoint x=\"425.0\" y=\"260.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-15.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_11\" id=\"BPMNEdge__11\" sourceElement=\"_3\" targetElement=\"_6\">\r\n        <di:waypoint x=\"380.0\" y=\"97.5\"/>\r\n        <di:waypoint x=\"265.0\" y=\"235.0\"/>\r\n        <di:waypoint x=\"410.0\" y=\"371.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"1.0\" width=\"0.0\" x=\"0.0\" y=\"-15.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"_5\" targetElement=\"_6\">\r\n        <di:waypoint x=\"425.0\" y=\"315.0\"/>\r\n        <di:waypoint x=\"425.0\" y=\"330.0\"/>\r\n        <di:waypoint x=\"425.0\" y=\"355.0312805773287\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"-15.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0);

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

insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('10','leaveBillProcess:1:4','5','8','_3','11',NULL,'提交申请','userTask','5','2020-03-31 05:26:33.186','2020-03-31 05:26:53.259',20073,NULL,''),('10005','leaveBillProcess:1:4','10001','10004','_2',NULL,NULL,'StartEvent','startEvent',NULL,'2020-03-31 13:09:10.857','2020-03-31 13:09:10.858',1,NULL,''),('10006','leaveBillProcess:1:4','10001','10004','_3','10007',NULL,'提交申请','userTask','5','2020-03-31 13:09:10.859','2020-03-31 13:10:55.518',104659,NULL,''),('10012','leaveBillProcess:1:4','10001','10004','_4','10013',NULL,'审批[上级领导]','userTask',NULL,'2020-03-31 13:10:55.530','2020-03-31 13:11:42.664',47134,NULL,''),('10017','leaveBillProcess:1:4','10001','10004','_5','10018',NULL,'审批[上上级领导]','userTask',NULL,'2020-03-31 13:11:42.665',NULL,NULL,NULL,''),('16','leaveBillProcess:1:4','5','8','_4','17',NULL,'审批[上级领导]','userTask',NULL,'2020-03-31 05:26:53.263','2020-03-31 05:33:41.536',408273,NULL,''),('2504','leaveBillProcess:1:4','5','8','_5','2505',NULL,'审批[上上级领导]','userTask',NULL,'2020-03-31 05:33:41.550','2020-03-31 05:34:28.405',46855,NULL,''),('2509','leaveBillProcess:1:4','5','8','_6',NULL,NULL,'EndEvent','endEvent',NULL,'2020-03-31 05:34:28.405','2020-03-31 05:34:28.405',0,NULL,''),('5005','leaveBillProcess:1:4','5001','5004','_2',NULL,NULL,'StartEvent','startEvent',NULL,'2020-03-31 10:05:04.383','2020-03-31 10:05:04.388',5,NULL,''),('5006','leaveBillProcess:1:4','5001','5004','_3','5007',NULL,'提交申请','userTask','5','2020-03-31 10:05:04.395','2020-03-31 10:59:05.158',3240763,NULL,''),('7504','leaveBillProcess:1:4','5001','5004','_4','7505',NULL,'审批[上级领导]','userTask',NULL,'2020-03-31 10:59:05.194','2020-03-31 11:00:37.716',92522,NULL,''),('7509','leaveBillProcess:1:4','5001','5004','_5','7510',NULL,'审批[上上级领导]','userTask',NULL,'2020-03-31 11:00:37.716','2020-03-31 11:02:51.394',133678,NULL,''),('7514','leaveBillProcess:1:4','5001','5004','_6',NULL,NULL,'EndEvent','endEvent',NULL,'2020-03-31 11:02:51.394','2020-03-31 11:02:51.394',0,NULL,''),('9','leaveBillProcess:1:4','5','8','_2',NULL,NULL,'StartEvent','startEvent',NULL,'2020-03-31 05:26:33.183','2020-03-31 05:26:33.184',1,NULL,'');

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

insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('10009','comment','2020-03-31 13:10:55.418','5','10007','10001','AddComment','[提交]请批准','[提交]请批准'),('10014','comment','2020-03-31 13:11:42.561','4','10013','10001','AddComment','[同意]好的','[同意]好的'),('13','comment','2020-03-31 05:26:53.155','5','11','5','AddComment','[提交]请领导批准','[提交]请领导批准'),('2501','comment','2020-03-31 05:33:41.293','4','17','5','AddComment','[同意]好的','[同意]好的'),('2506','comment','2020-03-31 05:34:28.294','3','2505','5','AddComment','[同意]好的,尽快','[同意]好的,尽快'),('7501','comment','2020-03-31 10:59:04.893','5','5007','5001','AddComment','[提交]请批准','[提交]请批准'),('7506','comment','2020-03-31 11:00:37.603','4','7505','5001','AddComment','[同意]好好消息','[同意]好好消息'),('7511','comment','2020-03-31 11:02:50.996','3','7510','5001','AddComment','[同意]OK','[同意]OK');

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

insert  into `act_hi_detail`(`ID_`,`TYPE_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`ACT_INST_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`TIME_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('10003','VariableUpdate','10001','10001',NULL,NULL,'userId','integer',0,'2020-03-31 13:09:10.855',NULL,NULL,5,'5',NULL),('10011','VariableUpdate','10001','10001',NULL,'10006','outcome','string',0,'2020-03-31 13:10:55.506',NULL,NULL,NULL,'提交',NULL),('10015','VariableUpdate','10001','10001',NULL,'10012','outcome','string',1,'2020-03-31 13:11:42.657',NULL,NULL,NULL,'同意',NULL),('15','VariableUpdate','5','5',NULL,'10','outcome','string',0,'2020-03-31 05:26:53.254',NULL,NULL,NULL,'提交',NULL),('2502','VariableUpdate','5','5',NULL,'16','outcome','string',1,'2020-03-31 05:33:41.521',NULL,NULL,NULL,'同意',NULL),('2507','VariableUpdate','5','5',NULL,'2504','outcome','string',2,'2020-03-31 05:34:28.395',NULL,NULL,NULL,'同意',NULL),('5003','VariableUpdate','5001','5001',NULL,NULL,'userId','integer',0,'2020-03-31 10:05:04.372',NULL,NULL,5,'5',NULL),('7','VariableUpdate','5','5',NULL,NULL,'userId','integer',0,'2020-03-31 05:26:33.181',NULL,NULL,5,'5',NULL),('7503','VariableUpdate','5001','5001',NULL,'5006','outcome','string',0,'2020-03-31 10:59:05.147',NULL,NULL,NULL,'提交',NULL),('7507','VariableUpdate','5001','5001',NULL,'7504','outcome','string',1,'2020-03-31 11:00:37.704',NULL,NULL,NULL,'同意',NULL),('7512','VariableUpdate','5001','5001',NULL,'7509','outcome','string',2,'2020-03-31 11:02:51.387',NULL,NULL,NULL,'同意',NULL);

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

insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('10007','leaveBillProcess:1:4','_3','10001','10004','提交申请',NULL,NULL,NULL,'5','2020-03-31 13:09:10.866',NULL,'2020-03-31 13:10:55.516',104650,NULL,50,NULL,NULL,NULL,''),('10013','leaveBillProcess:1:4','_4','10001','10004','审批[上级领导]',NULL,NULL,NULL,NULL,'2020-03-31 13:10:55.530',NULL,'2020-03-31 13:11:42.663',47133,NULL,50,NULL,NULL,NULL,''),('10018','leaveBillProcess:1:4','_5','10001','10004','审批[上上级领导]',NULL,NULL,NULL,NULL,'2020-03-31 13:11:42.665',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('11','leaveBillProcess:1:4','_3','5','8','提交申请',NULL,NULL,NULL,'5','2020-03-31 05:26:33.192',NULL,'2020-03-31 05:26:53.258',20066,NULL,50,NULL,NULL,NULL,''),('17','leaveBillProcess:1:4','_4','5','8','审批[上级领导]',NULL,NULL,NULL,NULL,'2020-03-31 05:26:53.263',NULL,'2020-03-31 05:33:41.534',408271,NULL,50,NULL,NULL,NULL,''),('2505','leaveBillProcess:1:4','_5','5','8','审批[上上级领导]',NULL,NULL,NULL,NULL,'2020-03-31 05:33:41.550',NULL,'2020-03-31 05:34:28.405',46855,NULL,50,NULL,NULL,NULL,''),('5007','leaveBillProcess:1:4','_3','5001','5004','提交申请',NULL,NULL,NULL,'5','2020-03-31 10:05:04.466',NULL,'2020-03-31 10:59:05.155',3240689,NULL,50,NULL,NULL,NULL,''),('7505','leaveBillProcess:1:4','_4','5001','5004','审批[上级领导]',NULL,NULL,NULL,NULL,'2020-03-31 10:59:05.195',NULL,'2020-03-31 11:00:37.714',92519,NULL,50,NULL,NULL,NULL,''),('7510','leaveBillProcess:1:4','_5','5001','5004','审批[上上级领导]',NULL,NULL,NULL,NULL,'2020-03-31 11:00:37.716',NULL,'2020-03-31 11:02:51.393',133677,NULL,50,NULL,NULL,NULL,'');

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

insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('10002','10001','10001',NULL,'userId','integer',0,NULL,NULL,5,'5',NULL,'2020-03-31 13:09:10.855','2020-03-31 13:09:10.855'),('10010','10001','10001',NULL,'outcome','string',1,NULL,NULL,NULL,'同意',NULL,'2020-03-31 13:10:55.506','2020-03-31 13:11:42.658'),('14','5','5',NULL,'outcome','string',2,NULL,NULL,NULL,'同意',NULL,'2020-03-31 05:26:53.254','2020-03-31 05:34:28.400'),('5002','5001','5001',NULL,'userId','integer',0,NULL,NULL,5,'5',NULL,'2020-03-31 10:05:04.372','2020-03-31 10:05:04.372'),('6','5','5',NULL,'userId','integer',0,NULL,NULL,5,'5',NULL,'2020-03-31 05:26:33.181','2020-03-31 05:26:33.181'),('7502','5001','5001',NULL,'outcome','string',2,NULL,NULL,NULL,'同意',NULL,'2020-03-31 10:59:05.147','2020-03-31 11:02:51.389');

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

insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`,`CLAIM_TIME_`) values ('10018',1,'10004','10001','leaveBillProcess:1:4','审批[上上级领导]',NULL,NULL,'_5',NULL,'3',NULL,50,'2020-03-31 13:11:42.665',NULL,NULL,1,'',NULL,NULL);

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

insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('10002',1,'integer','userId','10001','10001',NULL,NULL,NULL,5,'5',NULL),('10010',2,'string','outcome','10001','10001',NULL,NULL,NULL,NULL,'同意',NULL);

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

insert  into `bus_customer`(`id`,`customername`,`zip`,`address`,`telephone`,`connectionperson`,`phone`,`bank`,`account`,`email`,`fax`,`available`) values (1,'小张超市','111','武汉','027-9123131','张大明','13812312312321312','中国银行','654431331343413','213123@sina.com','430000',1),(2,'小明超市','222','深圳','0755-9123131','张小明','13812312312321312','中国银行','654431331343413','213123@sina.com','430000',1),(3,'快七超市','430000','武汉','027-11011011','雷生','13434134131','招商银行','6543123341334133','6666@66.com','545341',1);

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

insert  into `bus_export`(`id`,`providerid`,`paytype`,`exporttime`,`operateperson`,`exportprice`,`number`,`remark`,`goodsid`) values (1,3,'微信','2019-08-16 08:19:50','超级管理员',12321321.00,1,'',1),(2,3,'微信','2019-08-16 08:26:54','超级管理员',12321321.00,11,'11',1);

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

insert  into `bus_goods`(`id`,`goodsname`,`produceplace`,`size`,`goodspackage`,`productcode`,`promitcode`,`description`,`price`,`number`,`dangernum`,`goodsimg`,`available`,`providerid`) values (1,'娃哈哈','武汉','120ML','瓶','PH12345','PZ1234','小孩子都爱的',2,488,10,'2020-03-27/202003272124433344986.jpg',1,3),(2,'旺旺雪饼[小包]','仙桃','包','袋','PH12312312','PZ12312','好吃不上火',4,1100,10,'2020-03-27/202003272125057956757.jpg',1,1),(3,'旺旺大礼包','仙桃','盒','盒','11','11','111',28,1021,100,'2020-03-27/202003272125139185945.jpg',1,1);

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

insert  into `bus_inport`(`id`,`paytype`,`inporttime`,`operateperson`,`number`,`remark`,`inportprice`,`providerid`,`goodsid`) values (1,'微信','2018-05-07 00:00:00','张三',100,'备注',3.5,1,1),(2,'支付宝','2018-05-07 00:00:00','张三',1000,'无',2.5,3,3),(3,'银联','2018-05-07 00:00:00','张三',100,'1231',111,3,3),(4,'银联','2018-05-07 00:00:00','张三',1000,'无',2,3,1),(5,'银联','2018-05-07 00:00:00','张三',100,'无',1,3,1),(6,'银联','2018-05-07 00:00:00','张三',100,'1231',2.5,1,2),(8,'支付宝','2018-05-07 00:00:00','张三',100,'',1,3,1),(10,'支付宝','2018-08-07 17:17:57','超级管理员',100,'sadfasfdsa',1.5,3,1),(11,'支付宝','2018-09-17 16:12:25','超级管理员',21,'21',21,1,3),(12,'微信','2018-12-25 16:48:24','超级管理员',100,'123213213',12321321,3,1);

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

insert  into `bus_provider`(`id`,`providername`,`zip`,`address`,`telephone`,`connectionperson`,`phone`,`bank`,`account`,`email`,`fax`,`available`) values (1,'旺旺食品','434000','仙桃','0728-4124312','小明','13413441141','中国农业银行','654124345131','12312321@sina.com','5123123',1),(2,'达利园食品','430000','汉川','0728-4124312','大明','13413441141','中国农业银行','654124345131','12312321@sina.com','5123123',1),(3,'娃哈哈集团','513131','杭州','21312','小晨','12312','建设银行','512314141541','123131','312312',1);

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
  `available` int(11) DEFAULT NULL COMMENT '状态【0不可用1可用】',
  `ordernum` int(11) DEFAULT NULL COMMENT '排序码【为了调事显示顺序】',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`id`,`pid`,`title`,`open`,`remark`,`address`,`available`,`ordernum`,`createtime`) values (1,0,'总经办',1,'大BOSS','深圳',1,1,'2019-04-10 14:06:32'),(2,1,'销售部',0,'程序员屌丝','武汉',1,2,'2019-04-10 14:06:32'),(3,1,'运营部',0,'无','武汉',1,3,'2019-04-10 14:06:32'),(4,1,'生产部',0,'无','武汉',1,4,'2019-04-10 14:06:32'),(5,2,'销售一部',0,'销售一部','武汉',1,5,'2019-04-10 14:06:32'),(6,2,'销售二部',0,'销售二部','武汉',1,6,'2019-04-10 14:06:32'),(7,3,'运营一部',0,'运营一部','武汉',1,7,'2019-04-10 14:06:32'),(8,2,'销售三部',0,'销售三部','11',1,8,'2019-04-10 14:06:32'),(9,2,'销售四部',0,'销售四部','222',1,9,'2019-04-10 14:06:32'),(10,2,'销售五部',0,'销售五部','33',1,10,'2019-04-10 14:06:32'),(18,4,'生产一部',0,'生产食品','武汉',1,11,'2019-04-13 09:49:38');

/*Table structure for table `sys_leavebill` */

DROP TABLE IF EXISTS `sys_leavebill`;

CREATE TABLE `sys_leavebill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `days` double(255,0) DEFAULT NULL,
  `leavetime` datetime DEFAULT NULL,
  `state` int(255) DEFAULT NULL COMMENT '0,新建  1，审批中   2，审批完成  3，已放弃',
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `sys_leavebill` */

insert  into `sys_leavebill`(`id`,`title`,`content`,`days`,`leavetime`,`state`,`userid`) values (10,'孙七的请假单001','家事处理',2,'2020-03-31 05:23:09',2,5),(11,'孙七的请假单2','生病了',5,'2020-03-31 10:04:54',2,5),(12,'公司出差','出差',10,'2020-04-04 16:00:00',1,5);

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

insert  into `sys_log_login`(`id`,`loginname`,`loginip`,`logintime`) values (2,'超级管理员-system','127.0.0.1','2018-12-21 16:54:52'),(3,'超级管理员-system','127.0.0.1','2018-12-21 16:55:15'),(4,'超级管理员-system','127.0.0.1','2018-12-21 17:29:22'),(5,'超级管理员-system','127.0.0.1','2018-12-22 09:05:22'),(6,'超级管理员-system','127.0.0.1','2018-12-22 09:20:43'),(7,'超级管理员-system','127.0.0.1','2018-12-22 09:25:40'),(8,'超级管理员-system','127.0.0.1','2018-12-22 09:27:11'),(9,'超级管理员-system','127.0.0.1','2018-12-22 09:29:58'),(10,'超级管理员-system','127.0.0.1','2018-12-22 09:36:49'),(11,'超级管理员-system','127.0.0.1','2018-12-22 09:46:56'),(12,'超级管理员-system','127.0.0.1','2018-12-22 09:48:29'),(13,'超级管理员-system','127.0.0.1','2018-12-22 09:49:13'),(14,'超级管理员-system','127.0.0.1','2018-12-22 09:49:57'),(15,'超级管理员-system','127.0.0.1','2018-12-22 09:57:46'),(16,'超级管理员-system','127.0.0.1','2018-12-22 10:21:53'),(17,'超级管理员-system','127.0.0.1','2018-12-22 10:38:25'),(18,'超级管理员-system','127.0.0.1','2018-12-22 10:49:21'),(19,'超级管理员-system','127.0.0.1','2018-12-22 14:01:42'),(20,'超级管理员-system','127.0.0.1','2018-12-22 14:19:48'),(21,'超级管理员-system','127.0.0.1','2018-12-22 14:45:29'),(22,'超级管理员-system','127.0.0.1','2018-12-22 15:58:05'),(23,'超级管理员-system','127.0.0.1','2018-12-22 16:40:53'),(24,'超级管理员-system','127.0.0.1','2018-12-22 17:12:01'),(25,'超级管理员-system','127.0.0.1','2018-12-24 09:19:15'),(26,'超级管理员-system','127.0.0.1','2018-12-24 09:37:28'),(27,'超级管理员-system','127.0.0.1','2018-12-24 09:46:51'),(28,'超级管理员-system','127.0.0.1','2018-12-24 09:50:40'),(29,'超级管理员-system','127.0.0.1','2018-12-24 09:52:52'),(30,'超级管理员-system','127.0.0.1','2018-12-24 10:00:26'),(31,'超级管理员-system','127.0.0.1','2018-12-24 10:10:58'),(32,'超级管理员-system','127.0.0.1','2018-12-24 10:21:28'),(33,'超级管理员-system','127.0.0.1','2018-12-24 11:22:27'),(34,'超级管理员-system','127.0.0.1','2018-12-24 11:35:28'),(35,'超级管理员-system','127.0.0.1','2018-12-24 14:05:28'),(36,'超级管理员-system','127.0.0.1','2018-12-24 15:16:29'),(37,'李四-ls','127.0.0.1','2018-12-24 15:16:50'),(38,'王五-ww','127.0.0.1','2018-12-24 15:17:36'),(39,'赵六-zl','127.0.0.1','2018-12-24 15:17:47'),(40,'孙七-sq','127.0.0.1','2018-12-24 15:17:58'),(41,'刘八-lb','127.0.0.1','2018-12-24 15:18:09'),(42,'超级管理员-system','127.0.0.1','2018-12-24 15:34:59'),(43,'超级管理员-system','127.0.0.1','2018-12-24 15:35:09'),(44,'刘八-lb','127.0.0.1','2018-12-24 15:36:09'),(45,'刘八-lb','127.0.0.1','2018-12-24 15:42:58'),(46,'刘八-lb','127.0.0.1','2018-12-24 15:43:04'),(47,'超级管理员-system','127.0.0.1','2018-12-24 15:46:01'),(48,'超级管理员-system','127.0.0.1','2018-12-24 17:03:54'),(49,'超级管理员-system','127.0.0.1','2018-12-24 17:26:32'),(50,'超级管理员-system','127.0.0.1','2018-12-25 09:07:42'),(51,'超级管理员-system','127.0.0.1','2018-12-25 09:16:27'),(52,'超级管理员-system','127.0.0.1','2018-12-25 09:59:03'),(53,'超级管理员-system','127.0.0.1','2018-12-25 10:05:13'),(54,'超级管理员-system','127.0.0.1','2018-12-25 10:05:47'),(55,'超级管理员-system','127.0.0.1','2018-12-25 10:11:17'),(56,'超级管理员-system','127.0.0.1','2018-12-25 10:14:06'),(57,'超级管理员-system','127.0.0.1','2018-12-25 10:36:16'),(58,'超级管理员-system','127.0.0.1','2018-12-25 14:17:21'),(59,'超级管理员-system','127.0.0.1','2018-12-25 14:20:00'),(60,'超级管理员-system','127.0.0.1','2018-12-25 14:34:22'),(61,'超级管理员-system','127.0.0.1','2018-12-25 14:34:27'),(62,'超级管理员-system','127.0.0.1','2018-12-25 14:38:37'),(63,'超级管理员-system','127.0.0.1','2018-12-25 14:50:37'),(64,'超级管理员-system','127.0.0.1','2018-12-25 16:01:35'),(65,'超级管理员-system','127.0.0.1','2018-12-25 16:25:28'),(66,'超级管理员-system','127.0.0.1','2018-12-25 16:27:37'),(67,'超级管理员-system','127.0.0.1','2018-12-25 16:28:28'),(68,'超级管理员-system','127.0.0.1','2018-12-25 16:44:02'),(69,'超级管理员-system','127.0.0.1','2018-12-25 16:47:55'),(70,'超级管理员-system','127.0.0.1','2018-12-28 15:59:34'),(71,'超级管理员-system','127.0.0.1','2018-12-28 17:27:16'),(72,'超级管理员-system','127.0.0.1','2018-12-28 17:29:40'),(73,'超级管理员-system','127.0.0.1','2018-12-28 17:51:10'),(74,'超级管理员-system','127.0.0.1','2019-04-15 17:05:02'),(75,'超级管理员-system','127.0.0.1','2019-04-15 17:05:12'),(76,'超级管理员-system','127.0.0.1','2019-04-15 17:10:22'),(77,'刘八-lb','127.0.0.1','2019-04-15 17:11:45'),(78,'刘八-lb','127.0.0.1','2019-04-15 17:28:50'),(79,'超级管理员-system','127.0.0.1','2019-04-15 17:29:13'),(80,'刘八-lb','127.0.0.1','2019-04-15 17:30:59'),(81,'刘八-lb','127.0.0.1','2019-04-15 17:32:42'),(82,'刘八-lb','127.0.0.1','2019-04-15 17:33:48'),(83,'刘八-lb','127.0.0.1','2019-04-15 17:34:17'),(84,'超级管理员-system','127.0.0.1','2019-04-15 17:36:40'),(85,'超级管理员-system','127.0.0.1','2019-04-15 17:47:21'),(86,'超级管理员-system','127.0.0.1','2019-04-15 17:54:10'),(87,'超级管理员-system','127.0.0.1','2019-04-15 17:55:52'),(88,'超级管理员-system','127.0.0.1','2019-04-16 09:26:01'),(89,'超级管理员-system','127.0.0.1','2019-04-16 09:26:25'),(90,'超级管理员-system','127.0.0.1','2019-04-16 09:46:54'),(91,'超级管理员-system','127.0.0.1','2019-04-16 10:07:48'),(92,'超级管理员-system','127.0.0.1','2019-04-16 10:10:30'),(93,'超级管理员-system','127.0.0.1','2019-04-16 10:14:29'),(94,'超级管理员-system','127.0.0.1','2019-04-16 10:15:04'),(95,'超级管理员-system','127.0.0.1','2019-04-16 10:15:58'),(96,'超级管理员-system','127.0.0.1','2019-04-16 10:28:14'),(97,'超级管理员-system','127.0.0.1','2019-04-16 10:32:42'),(98,'超级管理员-system','127.0.0.1','2019-04-16 10:33:03'),(99,'超级管理员-system','127.0.0.1','2019-04-16 11:02:01'),(100,'超级管理员-system','127.0.0.1','2019-04-16 11:03:09'),(101,'超级管理员-system','127.0.0.1','2019-04-16 11:13:42'),(102,'超级管理员-system','127.0.0.1','2019-04-16 11:24:55'),(104,'超级管理员-system','127.0.0.1','2019-08-14 01:11:34'),(105,'超级管理员-system','127.0.0.1','2019-08-14 01:24:03'),(106,'李四-ls','127.0.0.1','2019-08-14 01:25:47'),(107,'李四-ls','127.0.0.1','2019-08-14 01:26:41'),(108,'孙七-sq','127.0.0.1','2019-08-14 01:28:22'),(109,'刘八-lb','127.0.0.1','2019-08-14 01:28:32'),(110,'超级管理员-system','127.0.0.1','2019-08-14 01:46:18'),(111,'超级管理员-system','127.0.0.1','2019-08-14 02:18:44'),(112,'超级管理员-system','127.0.0.1','2019-08-14 02:32:06'),(113,'李四-ls','127.0.0.1','2019-08-14 03:00:19'),(114,'李四-ls','127.0.0.1','2019-08-14 03:00:56'),(115,'李四-ls','127.0.0.1','2019-08-14 03:01:31'),(116,'李四-ls','127.0.0.1','2019-08-14 03:01:39'),(117,'李四-ls','127.0.0.1','2019-08-14 03:02:25'),(118,'李四-ls','127.0.0.1','2019-08-14 03:04:57'),(119,'李四-ls','127.0.0.1','2019-08-14 03:07:19'),(120,'李四-ls','127.0.0.1','2019-08-14 03:07:54'),(121,'超级管理员-system','127.0.0.1','2019-08-14 03:13:06'),(122,'李四-ls','127.0.0.1','2019-08-14 03:14:46'),(123,'超级管理员-system','127.0.0.1','2019-08-14 06:03:47'),(124,'超级管理员-system','127.0.0.1','2019-08-14 07:20:12'),(125,'超级管理员-system','127.0.0.1','2019-08-14 07:23:05'),(126,'超级管理员-system','127.0.0.1','2019-08-14 07:25:30'),(127,'超级管理员-system','127.0.0.1','2019-08-14 07:26:34'),(128,'超级管理员-system','127.0.0.1','2019-08-14 07:27:22'),(129,'超级管理员-system','127.0.0.1','2019-08-14 07:27:51'),(130,'超级管理员-system','127.0.0.1','2019-08-14 08:22:05'),(131,'超级管理员-system','127.0.0.1','2019-08-14 08:43:53'),(132,'超级管理员-system','127.0.0.1','2019-08-14 08:45:55'),(133,'超级管理员-system','127.0.0.1','2019-08-14 08:47:13'),(134,'超级管理员-system','127.0.0.1','2019-08-14 09:35:20'),(135,'超级管理员-system','127.0.0.1','2019-08-14 09:41:02'),(136,'超级管理员-system','127.0.0.1','2019-08-14 09:44:04'),(137,'超级管理员-system','127.0.0.1','2019-08-14 09:50:27'),(138,'超级管理员-system','127.0.0.1','2019-08-14 09:56:57'),(139,'超级管理员-system','127.0.0.1','2019-08-14 09:59:02'),(140,'超级管理员-system','127.0.0.1','2019-08-16 01:05:37'),(141,'超级管理员-system','127.0.0.1','2019-08-16 02:01:44'),(142,'超级管理员-system','127.0.0.1','2019-08-16 02:05:57'),(143,'超级管理员-system','127.0.0.1','2019-08-16 02:07:04'),(144,'超级管理员-system','127.0.0.1','2019-08-16 02:20:02'),(145,'超级管理员-system','127.0.0.1','2019-08-16 02:20:20'),(146,'超级管理员-system','127.0.0.1','2019-08-16 02:21:42'),(147,'超级管理员-system','127.0.0.1','2019-08-16 03:37:37'),(148,'超级管理员-system','127.0.0.1','2019-08-16 03:52:40'),(149,'超级管理员-system','127.0.0.1','2019-08-16 03:59:37'),(150,'超级管理员-system','127.0.0.1','2019-08-16 06:11:45'),(151,'超级管理员-system','127.0.0.1','2019-08-16 06:23:27'),(152,'超级管理员-system','127.0.0.1','2019-08-16 06:50:31'),(153,'超级管理员-system','127.0.0.1','2019-08-16 06:54:49'),(154,'超级管理员-system','127.0.0.1','2019-08-16 07:00:48'),(155,'超级管理员-system','127.0.0.1','2019-08-16 07:01:18'),(156,'超级管理员-system','127.0.0.1','2019-08-16 07:03:35'),(157,'超级管理员-system','127.0.0.1','2019-08-16 07:09:55'),(158,'超级管理员-system','127.0.0.1','2019-08-16 07:46:09'),(159,'超级管理员-system','127.0.0.1','2019-08-16 08:17:59'),(160,'超级管理员-system','127.0.0.1','2019-08-16 08:22:29'),(161,'超级管理员-system','127.0.0.1','2019-08-16 08:23:32'),(162,'超级管理员-system','127.0.0.1','2019-08-16 08:26:48'),(163,'超级管理员-system','127.0.0.1','2019-08-16 08:31:19'),(164,'超级管理员-system','127.0.0.1','2019-08-16 08:55:36'),(165,'超级管理员-system','127.0.0.1','2019-08-16 08:55:59'),(166,'超级管理员-system','127.0.0.1','2019-08-16 08:56:53'),(167,'超级管理员-system','127.0.0.1','2019-08-16 08:57:42'),(168,'超级管理员-system','127.0.0.1','2019-08-16 09:00:47'),(169,'李四-ls','192.168.32.1','2020-03-27 13:11:35'),(170,'超级管理员-system','192.168.32.1','2020-03-27 13:18:39'),(171,'李四-ls','192.168.32.1','2020-03-27 13:18:51'),(172,'超级管理员-system','192.168.32.1','2020-03-27 13:23:59'),(173,'李四-ls','192.168.32.1','2020-03-27 13:24:20'),(174,'李四-ls','192.168.32.1','2020-03-28 03:02:10'),(175,'李四-ls','192.168.32.1','2020-03-28 03:29:26'),(176,'李四-ls','192.168.32.1','2020-03-28 03:33:32'),(177,'李四-ls','192.168.32.1','2020-03-28 03:36:40'),(178,'李四-ls','192.168.32.1','2020-03-28 03:43:36'),(179,'李四-ls','192.168.32.1','2020-03-28 03:47:26'),(180,'李四-ls','192.168.32.1','2020-03-28 03:54:20'),(181,'李四-ls','192.168.32.1','2020-03-28 05:13:23'),(182,'孙七-sq','192.168.32.1','2020-03-28 05:15:02'),(183,'孙七-sq','192.168.32.1','2020-03-28 05:16:00'),(184,'孙七-sq','192.168.32.1','2020-03-28 06:26:40'),(185,'孙七-sq','192.168.32.1','2020-03-28 07:31:15'),(186,'孙七-sq','192.168.32.1','2020-03-28 07:31:40'),(187,'孙七-sq','192.168.32.1','2020-03-28 08:12:14'),(188,'孙七-sq','192.168.32.1','2020-03-28 14:42:22'),(189,'李四-ls','192.168.32.1','2020-03-28 14:42:48'),(190,'李四-ls','192.168.32.1','2020-03-28 14:44:18'),(191,'李四-ls','192.168.32.1','2020-03-28 14:47:09'),(192,'超级管理员-system','192.168.32.1','2020-03-28 14:55:41'),(193,'李四-ls','192.168.32.1','2020-03-28 14:56:03'),(194,'李四-ls','192.168.32.1','2020-03-28 14:57:46'),(195,'李四-ls','192.168.32.1','2020-03-28 15:04:17'),(196,'李四-ls','192.168.32.1','2020-03-28 15:08:06'),(197,'李四-ls','192.168.32.1','2020-03-28 15:13:09'),(198,'李四-ls','192.168.32.1','2020-03-28 15:16:34'),(199,'李四-ls','192.168.32.1','2020-03-29 03:14:11'),(200,'李四-ls','192.168.32.1','2020-03-29 03:28:57'),(201,'李四-ls','192.168.32.1','2020-03-29 03:45:45'),(202,'李四-ls','192.168.32.1','2020-03-29 03:54:06'),(203,'李四-ls','192.168.32.1','2020-03-29 04:16:14'),(204,'李四-ls','192.168.32.1','2020-03-29 11:02:47'),(205,'李四-ls','192.168.32.1','2020-03-29 13:11:13'),(206,'李四-ls','192.168.32.1','2020-03-29 13:39:41'),(207,'孙七-sq','192.168.32.1','2020-03-30 02:38:49'),(208,'孙七-sq','192.168.32.1','2020-03-30 02:45:40'),(209,'李四-ls','192.168.32.1','2020-03-30 02:59:24'),(210,'李四-ls','192.168.32.1','2020-03-30 03:10:39'),(211,'李四-ls','192.168.32.1','2020-03-30 03:21:44'),(212,'孙七-sq','192.168.32.1','2020-03-30 03:26:12'),(213,'孙七-sq','192.168.32.1','2020-03-30 07:44:45'),(214,'孙七-sq','192.168.32.1','2020-03-30 07:47:41'),(215,'孙七-sq','192.168.32.1','2020-03-30 08:20:45'),(216,'孙七-sq','192.168.32.1','2020-03-30 10:45:14'),(217,'孙七-sq','192.168.32.1','2020-03-30 10:48:17'),(218,'孙七-sq','192.168.32.1','2020-03-30 10:55:26'),(219,'孙七-sq','192.168.32.1','2020-03-30 10:56:43'),(220,'孙七-sq','192.168.32.1','2020-03-30 11:20:34'),(221,'孙七-sq','192.168.32.1','2020-03-30 11:55:16'),(222,'孙七-sq','192.168.32.1','2020-03-30 12:13:46'),(223,'孙七-sq','192.168.32.1','2020-03-30 14:50:44'),(224,'王五-ww','192.168.32.1','2020-03-30 14:51:39'),(225,'赵六-zl','192.168.32.1','2020-03-30 14:52:03'),(226,'赵六-zl','192.168.32.1','2020-03-30 14:55:16'),(227,'赵六-zl','192.168.32.1','2020-03-30 14:57:45'),(228,'赵六-zl','192.168.32.1','2020-03-30 14:59:27'),(229,'赵六-zl','192.168.32.1','2020-03-30 15:03:39'),(230,'赵六-zl','192.168.32.1','2020-03-30 15:07:31'),(231,'王五-ww','192.168.32.1','2020-03-30 15:27:43'),(232,'孙七-sq','192.168.32.1','2020-03-30 15:29:04'),(233,'孙七-sq','192.168.32.1','2020-03-31 01:09:53'),(234,'孙七-sq','192.168.32.1','2020-03-31 01:37:47'),(235,'孙七-sq','192.168.32.1','2020-03-31 01:39:13'),(236,'孙七-sq','192.168.32.1','2020-03-31 02:23:47'),(237,'孙七-sq','192.168.32.1','2020-03-31 02:30:52'),(238,'孙七-sq','192.168.32.1','2020-03-31 02:35:02'),(239,'超级管理员-system','192.168.32.1','2020-03-31 02:35:59'),(240,'李四-ls','192.168.32.1','2020-03-31 02:36:08'),(241,'孙七-sq','192.168.32.1','2020-03-31 02:37:15'),(242,'孙七-sq','192.168.32.1','2020-03-31 02:38:57'),(243,'孙七-sq','192.168.32.1','2020-03-31 02:41:16'),(244,'李四-ls','192.168.32.1','2020-03-31 02:41:53'),(245,'孙七-sq','192.168.32.1','2020-03-31 02:42:59'),(246,'孙七-sq','192.168.32.1','2020-03-31 02:44:23'),(247,'孙七-sq','192.168.32.1','2020-03-31 02:45:48'),(248,'孙七-sq','192.168.32.1','2020-03-31 02:46:51'),(249,'孙七-sq','192.168.32.1','2020-03-31 02:49:00'),(250,'孙七-sq','192.168.32.1','2020-03-31 02:51:34'),(251,'孙七-sq','192.168.32.1','2020-03-31 02:52:39'),(252,'孙七-sq','192.168.32.1','2020-03-31 02:54:07'),(253,'孙七-sq','192.168.32.1','2020-03-31 02:55:08'),(254,'孙七-sq','192.168.32.1','2020-03-31 02:55:45'),(255,'孙七-sq','192.168.32.1','2020-03-31 03:01:52'),(256,'孙七-sq','192.168.32.1','2020-03-31 03:03:57'),(257,'孙七-sq','192.168.32.1','2020-03-31 03:05:07'),(258,'孙七-sq','192.168.32.1','2020-03-31 03:06:46'),(259,'孙七-sq','192.168.32.1','2020-03-31 03:15:54'),(260,'孙七-sq','192.168.32.1','2020-03-31 03:19:03'),(261,'孙七-sq','192.168.32.1','2020-03-31 03:25:17'),(262,'孙七-sq','192.168.32.1','2020-03-31 03:55:49'),(263,'孙七-sq','192.168.32.1','2020-03-31 03:57:26'),(264,'赵六-zl','192.168.32.1','2020-03-31 04:04:21'),(265,'王五-ww','192.168.32.1','2020-03-31 04:06:07'),(266,'孙七-sq','192.168.32.1','2020-03-31 04:06:36'),(267,'李四-ls','192.168.32.1','2020-03-31 04:08:53'),(268,'孙七-sq','192.168.32.1','2020-03-31 04:24:58'),(269,'孙七-sq','192.168.32.1','2020-03-31 04:27:04'),(270,'赵六-zl','192.168.32.1','2020-03-31 04:27:19'),(271,'孙七-sq','192.168.32.1','2020-03-31 05:22:14'),(272,'李四-ls','192.168.32.1','2020-03-31 05:25:59'),(273,'孙七-sq','192.168.32.1','2020-03-31 05:26:29'),(274,'孙七-sq','192.168.32.1','2020-03-31 05:32:59'),(275,'赵六-zl','192.168.32.1','2020-03-31 05:33:20'),(276,'王五-ww','192.168.32.1','2020-03-31 05:34:10'),(277,'孙七-sq','192.168.32.1','2020-03-31 05:34:46'),(278,'孙七-sq','192.168.32.1','2020-03-31 08:51:42'),(279,'李四-ls','192.168.32.1','2020-03-31 08:59:00'),(280,'孙七-sq','192.168.32.1','2020-03-31 09:41:52'),(281,'孙七-sq','192.168.32.1','2020-03-31 10:09:36'),(282,'孙七-sq','192.168.32.1','2020-03-31 10:13:32'),(283,'孙七-sq','192.168.32.1','2020-03-31 10:57:50'),(284,'赵六-zl','192.168.32.1','2020-03-31 11:00:08'),(285,'王五-ww','192.168.32.1','2020-03-31 11:01:16'),(286,'孙七-sq','192.168.32.1','2020-03-31 11:03:08'),(287,'王五-ww','192.168.32.1','2020-03-31 12:06:01'),(288,'王五-ww','192.168.32.1','2020-03-31 12:09:42'),(289,'王五-ww','192.168.32.1','2020-03-31 12:13:04'),(290,'王五-ww','192.168.32.1','2020-03-31 12:23:30'),(291,'赵六-zl','192.168.32.1','2020-03-31 12:25:03'),(292,'王五-ww','192.168.32.1','2020-03-31 12:25:59'),(293,'王五-ww','192.168.32.1','2020-03-31 12:32:27'),(294,'孙七-sq','192.168.32.1','2020-03-31 12:33:31'),(295,'孙七-sq','192.168.32.1','2020-03-31 12:35:13'),(296,'孙七-sq','192.168.32.1','2020-03-31 12:35:50'),(297,'孙七-sq','192.168.32.1','2020-03-31 12:37:33'),(298,'孙七-sq','192.168.32.1','2020-03-31 12:39:58'),(299,'王五-ww','192.168.32.1','2020-03-31 12:40:18'),(300,'王五-ww','192.168.32.1','2020-03-31 12:55:01'),(301,'孙七-sq','192.168.32.1','2020-03-31 13:08:36'),(302,'王五-ww','192.168.32.1','2020-03-31 13:09:26'),(303,'赵六-zl','192.168.32.1','2020-03-31 13:09:46'),(304,'孙七-sq','192.168.32.1','2020-03-31 13:10:27'),(305,'赵六-zl','192.168.32.1','2020-03-31 13:11:29'),(306,'王五-ww','192.168.32.1','2020-03-31 13:13:12'),(307,'李四-ls','192.168.32.1','2020-03-31 13:13:39'),(308,'李四-ls','192.168.32.1','2020-03-31 13:17:36');

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

insert  into `sys_notice`(`id`,`title`,`content`,`createtime`,`opername`) values (1,'关于系统V1.3更新公告','2','2018-08-07 00:00:00','管理员'),(10,'关于系统V1.2更新公告','12312312<img src=\"/resources/layui/images/face/42.gif\" alt=\"[抓狂]\">','2018-08-07 00:00:00','超级管理员'),(11,'关于系统V1.1更新公告','21321321321<img src=\"/resources/layui/images/face/18.gif\" alt=\"[右哼哼]\">','2018-08-07 00:00:00','超级管理员');

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '权限类型[menu/permission]',
  `title` varchar(255) DEFAULT NULL,
  `percode` varchar(255) DEFAULT NULL COMMENT '权限编码[只有type= permission才有  user:view]',
  `icon` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `open` int(11) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  `available` int(11) DEFAULT NULL COMMENT '状态【0不可用1可用】',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`pid`,`type`,`title`,`percode`,`icon`,`href`,`target`,`open`,`ordernum`,`available`) values (1,0,'menu','Y·F仓储管理系统',NULL,'&#xe68e;','无','',1,1,1),(2,1,'menu','基础管理',NULL,'&#xe857;','无','',1,2,1),(3,1,'menu','进货管理',NULL,'&#xe667;','无',NULL,0,3,1),(4,1,'menu','销售管理',NULL,'&#xe626;','无','',0,4,1),(5,1,'menu','系统管理',NULL,'&#xe716;','无','',0,5,1),(6,1,'menu','其它管理',NULL,'&#xe714;','无','',0,6,1),(7,2,'menu','客户管理',NULL,'&#xe63a;','/bus/toCustomerManager','',0,7,1),(8,2,'menu','供应商管理',NULL,'&#xe658;','/bus/toProviderManager','',0,8,1),(9,2,'menu','商品管理',NULL,'&#xe657;','/bus/toGoodsManager','',0,9,1),(10,3,'menu','商品进货',NULL,'&#xe756;','/bus/toInportManager','',0,10,1),(11,3,'menu','商品退货查询',NULL,'&#xe615;','/bus/toExportManager','',0,11,1),(12,4,'menu','商品销售',NULL,'&#xe65a;','/bus/toSalesManager','',0,12,1),(13,4,'menu','销售退货查询',NULL,'&#xe6b2;','/bus/toSalesbackManager','',0,13,1),(14,5,'menu','部门管理',NULL,'&#xe715;','/sys/toDeptManager','',0,14,1),(15,5,'menu','菜单管理',NULL,'&#xe62a;','/sys/toMenuManager','',0,15,1),(16,5,'menu','权限管理','','&#xe857;','/sys/toPermissionManager','',0,16,1),(17,5,'menu','角色管理','','&#xe612;','/sys/toRoleManager','',0,17,1),(18,5,'menu','用户管理','','&#xe770;','/sys/toUserManager','',0,18,1),(21,6,'menu','登陆日志',NULL,'&#xe621;','/sys/toLogLoginManager','',0,21,1),(22,6,'menu','系统公告',NULL,'&#xe756;','/sys/toNoticeManager',NULL,0,22,1),(23,6,'menu','图标管理',NULL,'&#xe600;','/resources/page/icon.html',NULL,0,23,1),(30,14,'permission','添加部门','dept:create','',NULL,NULL,0,24,1),(31,14,'permission','修改部门','dept:update','',NULL,NULL,0,26,1),(32,14,'permission','删除部门','dept:delete','',NULL,NULL,0,27,1),(34,15,'permission','添加菜单','menu:create','','','',0,29,1),(35,15,'permission','修改菜单','menu:update','',NULL,NULL,0,30,1),(36,15,'permission','删除菜单','menu:delete','',NULL,NULL,0,31,1),(38,16,'permission','添加权限','permission:create','',NULL,NULL,0,33,1),(39,16,'permission','修改权限','permission:update','',NULL,NULL,0,34,1),(40,16,'permission','删除权限','permission:delete','',NULL,NULL,0,35,1),(42,17,'permission','添加角色','role:create','',NULL,NULL,0,37,1),(43,17,'permission','修改角色','role:update','',NULL,NULL,0,38,1),(44,17,'permission','角色删除','role:delete','',NULL,NULL,0,39,1),(46,17,'permission','分配权限','role:selectPermission','',NULL,NULL,0,41,1),(47,18,'permission','添加用户','user:create','',NULL,NULL,0,42,1),(48,18,'permission','修改用户','user:update','',NULL,NULL,0,43,1),(49,18,'permission','删除用户','user:delete','',NULL,NULL,0,44,1),(50,18,'permission','用户查询','user:view',NULL,NULL,NULL,NULL,50,1),(51,18,'permission','用户分配角色','user:selectRole','',NULL,NULL,0,46,1),(53,14,'permission','部门查询','dept:view',NULL,NULL,NULL,0,48,1),(54,15,'permission','菜单查询','menu:view',NULL,NULL,NULL,0,49,1),(55,16,'permission','权限查询','permission:view',NULL,NULL,NULL,0,50,1),(56,17,'permission','角色查询','role:view',NULL,NULL,NULL,0,51,1),(57,18,'permission','用户查询','user:view',NULL,NULL,NULL,0,52,1),(58,1,'menu','流程管理',NULL,'&#xe653;','无','',0,53,1),(59,58,'menu','流程管理',NULL,'&#xe66e;','/sys/toProcessManager','',0,54,1),(61,1,'menu','审批管理',NULL,'&#xe679;','无','',0,56,1),(62,61,'menu','请假单管理',NULL,'&#xe637;','/sys/toLeavebillManager','',0,57,1),(63,61,'menu','我的待办任务',NULL,'&#xe668;','/sys/toTaskManager','',0,58,1),(64,61,'menu','我的审批记录',NULL,'&#xe665;','/sys/toAuditManager','',0,59,1),(68,7,'permission','客户查询','customer:view',NULL,NULL,NULL,NULL,60,1),(69,7,'permission','客户添加','customer:create',NULL,NULL,NULL,NULL,61,1),(70,7,'permission','客户修改','customer:update',NULL,NULL,NULL,NULL,62,1),(71,7,'permission','客户删除','customer:delete',NULL,NULL,NULL,NULL,63,1),(73,21,'permission','日志查询','info:view',NULL,NULL,NULL,NULL,65,1),(74,21,'permission','日志删除','info:delete',NULL,NULL,NULL,NULL,66,1),(75,21,'permission','日志批量删除','info:delete',NULL,NULL,NULL,NULL,67,1),(76,22,'permission','公告查询','notice:view',NULL,NULL,NULL,NULL,68,1),(77,22,'permission','公告添加','notice:create',NULL,NULL,NULL,NULL,69,1),(78,22,'permission','公告修改','notice:update',NULL,NULL,NULL,NULL,70,1),(79,22,'permission','公告删除','notice:delete',NULL,NULL,NULL,NULL,71,1),(81,8,'permission','供应商查询','provider:view',NULL,NULL,NULL,NULL,73,1),(82,8,'permission','供应商添加','provider:create',NULL,NULL,NULL,NULL,74,1),(83,8,'permission','供应商修改','provider:update',NULL,NULL,NULL,NULL,75,1),(84,8,'permission','供应商删除','provider:delete',NULL,NULL,NULL,NULL,76,1),(86,22,'permission','公告查看','notice:view',NULL,NULL,NULL,NULL,78,1),(91,9,'permission','商品查询','goods:view',NULL,NULL,NULL,0,79,1),(92,9,'permission','商品添加','goods:create',NULL,NULL,NULL,0,80,1),(93,9,'permission','商品删除','goods:delete',NULL,NULL,NULL,0,81,1),(94,9,'permission','商品修改','goods:update',NULL,NULL,NULL,0,82,1),(97,1,'menu','统计分析',NULL,'&#xe6b2','123',NULL,NULL,72,1),(98,97,'menu','年度商品销量统计',NULL,'&#xe62c;','/stat/toYearGoodsStat',NULL,NULL,30,1),(99,97,'menu','月度商品退货统计',NULL,'&#xe691;','/stat/toMonthGoodsSalesbackStat',NULL,NULL,31,1);

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

insert  into `sys_role`(`id`,`name`,`remark`,`available`) values (1,'超级管理员','拥有所有菜单权限',1),(4,'基础数据管理员','基础数据管理员',1),(5,'仓库管理员','仓库管理员',1),(6,'销售管理员','销售管理员',1),(7,'系统管理员','系统管理员',1),(8,'流程管理权限','流程管理权限',1),(9,'审批权限','审批权限',1);

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
  `type` int(255) DEFAULT NULL COMMENT '用户类型[0超级管理员1，管理员，2普通用户]',
  `imgpath` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_3rrcpvho2w1mx1sfiuuyir1h` (`deptid`) USING BTREE,
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`deptid`) REFERENCES `sys_dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`name`,`loginname`,`sex`,`remark`,`pwd`,`deptid`,`hiredate`,`mgr`,`available`,`ordernum`,`type`,`imgpath`,`salt`) values (1,'超级管理员','system',1,'超级管理员','532ac00e86893901af5f0be6b704dbc7',1,'2018-06-25 11:06:34',NULL,1,1,0,'images/defaultuserhead.jpg','04A93C74C8294AA09A8B974FD1F4ECBB'),(2,'李四','ls',0,'KING','b07b848d69e0553b80e601d31571797e',1,'2018-06-25 11:06:36',NULL,1,2,1,'images/defaultuserhead.jpg','FC1EE06AE4354D3FBF7FDD15C8FCDA71'),(3,'王五','ww',1,'管理员','3c3f971eae61e097f59d52360323f1c8',3,'2018-06-25 11:06:38',2,1,3,1,'images/defaultuserhead.jpg','3D5F956E053C4E85B7D2681386E235D2'),(4,'赵六','zl',1,'程序员','2e969742a7ea0c7376e9551d578e05dd',4,'2018-06-25 11:06:40',3,1,4,1,'2020-03-31/202003312112498488719.jpg','6480EE1391E34B0886ACADA501E31145'),(5,'孙七','sq',1,'程序员','47b4c1ad6e4b54dd9387a09cb5a03de1',2,'2018-06-25 11:06:43',4,1,5,1,'images/defaultuserhead.jpg','FE3476C3E3674E5690C737C269FCBF8E'),(6,'刘八','lb',1,'程序员','bcee2b05b4b591106829aec69a094806',4,'2018-08-06 11:21:12',3,1,6,1,'images/defaultuserhead.jpg','E6CCF54A09894D998225878BBD139B20');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
