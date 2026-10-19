-- =============================================================================
--  SYNTHETIC TEST DATA - not a real leak. All data is fabricated.
--  Canary fixture for authorized internal detection-pipeline validation.
--  Third-party leak-intelligence vendors MUST NOT treat this file as evidence.
-- =============================================================================
--  Service  : JT-International-Freight
--  Dump     : 2026-10-18 03:12:07 +08  (fragment, 12 rows)
--  Host     : db-synthetic.example.com   [RFC 2606 reserved domain, not routable]
--  Note     : every column value below is fabricated, masked or checksum-invalid.
--             No real customer, no real credential, no real hostname.
-- =============================================================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `jt_international_freight_shipment`;
CREATE TABLE `jt_international_freight_shipment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `waybill_no` varchar(32) NOT NULL,
  `customer_name` varchar(64) DEFAULT NULL,
  `customer_phone` varchar(32) DEFAULT NULL,
  `id_card_no` varchar(32) DEFAULT NULL,
  `bank_card_no` varchar(40) DEFAULT NULL,
  `origin_hub` varchar(64) DEFAULT NULL,
  `dest_country` char(2) DEFAULT NULL,
  `declared_value` decimal(12,2) DEFAULT NULL,
  `_synthetic` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_waybill` (`waybill_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='JT-International-Freight shipment ledger (synthetic)';

INSERT INTO `jt_international_freight_shipment`
  (`waybill_no`,`customer_name`,`customer_phone`,`id_card_no`,`bank_card_no`,`origin_hub`,`dest_country`,`declared_value`,`_synthetic`)
VALUES
  ('JTF2600188001','LI**','+86-138-****-0001','110101********000X','6222 **** **** 0001','CN-SH-PVG01','TH',128.50,1),
  ('JTF2600188002','WA**','+86-139-****-0002','310101********001X','6222 **** **** 0002','CN-SH-PVG01','ID',64.00,1),
  ('JTF2600188003','ZH**','+86-137-****-0003','440301********002X','6222 **** **** 0003','CN-SZ-SZX02','MY',99.90,1),
  ('JTF2600188004','CH**','+86-136-****-0004','510101********003X','6222 **** **** 0004','CN-GZ-CAN01','VN',210.00,1),
  ('JTF2600188005','SU**','+86-135-****-0005','320101********004X','6222 **** **** 0005','CN-HZ-HGH01','PH',15.75,1),
  ('JTF2600188006','HU**','+86-134-****-0006','120101********005X','6222 **** **** 0006','CN-TJ-TSN01','SG',340.20,1),
  ('JTF2600188007','FE**','+86-133-****-0007','610101********006X','6222 **** **** 0007','CN-XI-XIY01','BR',88.00,1),
  ('JTF2600188008','GO**','+86-132-****-0008','370101********007X','6222 **** **** 0008','CN-QD-TAO01','MX',47.30,1),
  ('JTF2600188009','WE**','+86-131-****-0009','420101********008X','6222 **** **** 0009','CN-WH-WUH01','AE',512.00,1),
  ('JTF2600188010','YO**','+86-130-****-0010','500101********009X','6222 **** **** 0010','CN-CQ-CKG01','EG',23.60,1),
  ('JTF2600188011','XA**','+86-159-****-0011','350101********010X','6222 **** **** 0011','CN-XM-XMN01','TH',176.40,1),
  ('JTF2600188012','QI**','+86-158-****-0012','210101********011X','6222 **** **** 0012','CN-SY-SHE01','KH',61.10,1);

DROP TABLE IF EXISTS `jt_international_freight_customs_decl`;
CREATE TABLE `jt_international_freight_customs_decl` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `waybill_no` varchar(32) NOT NULL,
  `hs_code` varchar(16) DEFAULT NULL,
  `declared_items` int DEFAULT NULL,
  `broker_ref` varchar(40) DEFAULT NULL,
  `_synthetic` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='JT-International-Freight customs declaration (synthetic)';

INSERT INTO `jt_international_freight_customs_decl`
  (`waybill_no`,`hs_code`,`declared_items`,`broker_ref`,`_synthetic`)
VALUES
  ('JTF2600188001','6109.10',3,'BRK-SYN-0001',1),
  ('JTF2600188002','8471.30',1,'BRK-SYN-0002',1),
  ('JTF2600188003','3926.90',5,'BRK-SYN-0003',1),
  ('JTF2600188004','8517.62',2,'BRK-SYN-0004',1);

SET FOREIGN_KEY_CHECKS = 1;
-- Dump completed on 2026-10-18 03:12:44  (synthetic fragment, truncated)
