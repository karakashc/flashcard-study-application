BEGIN TRANSACTION;
INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('christopher','$2a$10$dgGIiaOtk5E3CUrtb96X9.cHamto0BCthX6ahaJsVzAh.rWLpyHaG','ROLE_USER');

INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','Capital Of France','Paris','Countries, Capitals',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','Capital Of Germany','Berlin','Countries, Capitals',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','Capital Of Turkey','Ankara','Countries, Capitals',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','Capital Of Serbia','Belgrade','Countries, Capitals',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','Capital Of Philippines','Manila','Countries, Capitals',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','Capital Of New Zealand','Wellington','Countries, Capitals',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','Capital Of Nepal','Kathmandu','Countries, Capitals',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','Capital Of Italy','Rome','Countries, Capitals',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','Capital Of Indonesia','Jakarta','Countries, Capitals',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','Capital Of Greece','Athens','Countries, Capitals',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','Capital Of Venezuela','Caracas','Countries, Capitals',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','Capital Of Spain','Madrid','Countries, Capitals',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','Capital Of Taiwan','Taipei','Countries, Capitals',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','Capital Of Ukraine','Kiev','Countries, Capitals',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','Capital Of Montenegro','Podgorica','Countries, Capitals',false);

INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','ba + (-27 / 0) + a','baNaNa','Integer Operations',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','-6 - (-7)','1','Integer Operations',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','-10 - (-10)','0','Integer Operations',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','-8 / 12','-2/3','Integer Operations',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','-9 x -8','72','Integer Operations',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','-11(23)','-253','Integer Operations',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','-22 + (-6)','-28','Integer Operations',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','3 - (-7) - (-2)','12','Integer Operations',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','-8 + 20','12','Integer Operations',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','-12 + 9 + (-5)','-8','Integer Operations',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','6 - (-16)','22','Integer Operations',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','-5 - (-7) - (-1) - 10','-7','Integer Operations',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','-66 / 6','-11','Integer Operations',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','17 - (-4)','21','Integer Operations',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','-3 + (-6)','-9','Integer Operations',false);

INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','安静','ān jìng quiet; peaceful; calm','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','安排','ān pái to arrange; to plan; to set up','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','办法','bàn fǎ means; method; way (to do something)','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','半天','bàn tiān half of the day; a long time; quite a while','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','帮助','bāng zhù assistance; aid; to help; to assist','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','杯子','bēi zi cup; glass','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','北边','bĕi biān (n) location to the north','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','比较','bǐ jiào compare; contrast; fairly; comparatively; relatively; quite; rather','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','比赛','bǐ sài [athletic or other] competition; match','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','必须','bì xū to have to; must','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','表示','biǎo shì to express; to show; to express; to say; to state; to indicate','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','表演','biǎo yǎn perform; act; play; show; performance; exhibition; demonstrate','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','别的','bié de else; other','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','不错','bù cuò correct; right; not bad; pretty good','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','不同','bù tóng different; distinct; not the same; not alike','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','参观','cān guān to look around; to inspect; visit and observe','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','参加','cān jiā to participate; to take part; to join','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','常常','cháng cháng frequently; usually; often','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','车站','chē zhàn (bus) station','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','成绩','chéng jì result; score; mark; achievement; performance','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','错误','cuò wù error; mistake; mistaken','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','打算','dǎ suàn to plan; to intend; to calculate; plan; intention; calculation','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','大声','dà shēng loudly; loud','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','锻炼','duàn liàn to do physical training','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','翻译','fān yì translate','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','方向','fāng xiàng direction; orientation; path to follow','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','放假','fàng jià to have a holiday or vacation','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','高兴','gāo xìng happy; glad; willing (to do sth); in a cheerful mood','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','忽然','hū rán suddenly; all of a sudden','Chinese',false);
INSERT INTO card (username,front_text,back_text,card_tags,is_public) VALUES ('christopher','决定','jué dìng to decide (to do something); to determine; to resolve','Chinese',false);

INSERT INTO deck (username,deck_title,deck_tags,is_public) VALUES ('christopher','Countries & Capitals','Geography',false);
INSERT INTO deck (username,deck_title,deck_tags,is_public) VALUES ('christopher','Integer Operations','Math',false);
INSERT INTO deck (username,deck_title,deck_tags,is_public) VALUES ('christopher','Chinese','Languages',false);

INSERT INTO deck_card (deck_id,card_id) VALUES (1001,3001);
INSERT INTO deck_card (deck_id,card_id) VALUES (1001,3002);
INSERT INTO deck_card (deck_id,card_id) VALUES (1001,3003);
INSERT INTO deck_card (deck_id,card_id) VALUES (1001,3004);
INSERT INTO deck_card (deck_id,card_id) VALUES (1001,3005);
INSERT INTO deck_card (deck_id,card_id) VALUES (1001,3006);
INSERT INTO deck_card (deck_id,card_id) VALUES (1001,3007);
INSERT INTO deck_card (deck_id,card_id) VALUES (1001,3008);
INSERT INTO deck_card (deck_id,card_id) VALUES (1001,3009);
INSERT INTO deck_card (deck_id,card_id) VALUES (1001,3010);
INSERT INTO deck_card (deck_id,card_id) VALUES (1001,3011);
INSERT INTO deck_card (deck_id,card_id) VALUES (1001,3012);
INSERT INTO deck_card (deck_id,card_id) VALUES (1001,3013);
INSERT INTO deck_card (deck_id,card_id) VALUES (1001,3014);
INSERT INTO deck_card (deck_id,card_id) VALUES (1001,3015);

INSERT INTO deck_card (deck_id,card_id) VALUES (1002,3016);
INSERT INTO deck_card (deck_id,card_id) VALUES (1002,3017);
INSERT INTO deck_card (deck_id,card_id) VALUES (1002,3018);
INSERT INTO deck_card (deck_id,card_id) VALUES (1002,3019);
INSERT INTO deck_card (deck_id,card_id) VALUES (1002,3020);
INSERT INTO deck_card (deck_id,card_id) VALUES (1002,3021);
INSERT INTO deck_card (deck_id,card_id) VALUES (1002,3022);
INSERT INTO deck_card (deck_id,card_id) VALUES (1002,3023);
INSERT INTO deck_card (deck_id,card_id) VALUES (1002,3024);
INSERT INTO deck_card (deck_id,card_id) VALUES (1002,3025);
INSERT INTO deck_card (deck_id,card_id) VALUES (1002,3026);
INSERT INTO deck_card (deck_id,card_id) VALUES (1002,3027);
INSERT INTO deck_card (deck_id,card_id) VALUES (1002,3028);
INSERT INTO deck_card (deck_id,card_id) VALUES (1002,3029);
INSERT INTO deck_card (deck_id,card_id) VALUES (1002,3030);

INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3031);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3032);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3033);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3034);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3035);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3036);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3037);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3038);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3039);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3040);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3041);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3042);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3043);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3044);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3045);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3046);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3047);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3048);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3049);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3050);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3051);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3052);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3053);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3054);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3055);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3056);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3057);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3058);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3059);
INSERT INTO deck_card (deck_id,card_id) VALUES (1003,3060);
COMMIT TRANSACTION;