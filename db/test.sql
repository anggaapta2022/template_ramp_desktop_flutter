DELETE FROM timbanganMasuk WHERE idLaporan = '';

DELETE FROM timbanganMasuk;


insert into barang(idBarang, namaBarang, tipeBarang, satuanBarang, tanggalDibuat, tanggalDiubah, diUbahOleh, tanggalSinkron)
values ('BR-06/06/23/1234', 'TBS Super', 'Buah', 'kg', '2023-06-06', '2023-06-06', 'SYSTEM', '2023-06-06'),
('BR-06/06/23/1245', 'TBS Besar', 'Buah', 'kg', '2023-06-06', '2023-06-06', 'SYSTEM', '2023-06-06'),
('BR-06/06/23/1321', 'TBS Sedang', 'Buah', 'kg', '2023-06-06', '2023-06-06', 'SYSTEM', '2023-06-06'),
('BR-06/06/23/1451', 'TBS Kecil', 'Buah', 'kg', '2023-06-06', '2023-06-06', 'SYSTEM', '2023-06-06'),
('BR-06/06/23/1278', 'Berondolan', 'Buah', 'kg', '2023-06-06', '2023-06-06', 'SYSTEM', '2023-06-06'),
('BR-06/06/23/1264', 'CPO', 'Produk', 'liter', '2023-06-06', '2023-06-06', 'SYSTEM', '2023-06-06'),
('BR-06/06/23/1290', 'Kernel', 'Produk', 'liter', '2023-06-06', '2023-06-06', 'SYSTEM', '2023-06-06'),
('BR-06/06/23/1265', 'Cangkang', 'Produk', 'kg', '2023-06-06', '2023-06-06', 'SYSTEM', '2023-06-06'),
('BR-06/06/23/1229', 'Fibre', 'Produk', 'kg', '2023-06-06', '2023-06-06', 'SYSTEM', '2023-06-06'),
('BR-06/06/23/1334', 'Abu', 'Produk', 'kg', '2023-06-06', '2023-06-06', 'SYSTEM', '2023-06-06'),
('BR-06/06/23/1295', 'Solid', 'Produk', 'kg', '2023-06-06', '2023-06-06', 'SYSTEM', '2023-06-06');


insert into supplier(idSupplier,kodeGroup, namaSupplier, alamat, namaSP,telepon,fax,pic, tanggalDibuat,tanggalDiubah,diubahOleh,tanggalSinkron)
values('SP-06/06/23/Lw4B','PJD','Andi Ardianta','Jl. Sudirman RT 004 RW 001','IR','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06');


insert into supplier(idSupplier,kodeGroup, namaSupplier, alamat, namaSP,telepon,fax,pic, tanggalDibuat,tanggalDiubah,diubahOleh,tanggalSinkron)
values('SP-06/06/23/YQzD','PJD','Saut Banjarnahor','Komp Menteng Indah Blok F1 25 Medan','SJ','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/v3sm','PJD','Guantanamo Martin','Jl. Pukat II No 27 Medan','G Martin','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/KGg1','PJD','Gunawan Halim','Jl. Intan No 8 Medan','GHM','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/Q5Wt','PJD','Supriyadi','Jl. Tuamang No 169 Medan','Supriyadi','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/1vDo','PJD','Charles','Jl. Tapanuli No. 21 Medan','Charles','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/n8j1','PJD','Welly Chandra','Jl. Jend Sudirman Bagan Batu','Welly Chandra','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/WZkY','PJD','Santo','Jl. Jend Sudirman Bagan Batu','Santo','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/f5mq','PJD','Wendy','Jl. Jend Sudirman Bagan Batu','Wendy','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/jhQf','PJD','Suka Ginting','Jl. Irigasi No. 15 LK-II Medan','ART','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/uyNv','PJD','Suparno','Dusun Makmur Pematang Seleng','Suparno','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/1gbZ','PJD','Flora Siburian','Jl. Mesjid No. 59 Medan','Flora','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/8E2a','PJD','Porman Banjarnahor','Jl. Piere Tandean Bagan Batu','MB','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06');

insert into supplier(idSupplier,kodeGroup, namaSupplier, alamat, namaSP,telepon,fax,pic, tanggalDibuat,tanggalDiubah,diubahOleh,tanggalSinkron)
values('SP-06/06/23/GTzY','PJD','CV. Amanah Sawit Sejahtera','Jl. Jend Sudirman Bagan Batu','CV. Amanah Sawit Sejahtera','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/jqRp','PJD','Savir Wahyujoe','Jl. Pukat V No 1-AB Medan','Andre','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/2kfe','PJD','Yap Lily','Jl. Pukat V No 1-AB Medan','Savir','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/v54d','PJD','Salomo Chandra Mikael Sianipar','Jl. Sei Rahayu No 43 Medan','Usaha Tani Bersama','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/u3b9','PJD','Timbang Sianipar','Jl. Jend Sudirman Bagan Batu','Pelita Jaya','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/rk7q','PJD','Dedi Sumanto Sianipar','Jl. Rokan Bagan Batu','Mutiara Bertani','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/t8ld','PJD','Muhammad Raja Ihsan','Jl. Tanjung III Blok K No 4 Jakarta Selatan','Ihsan','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/6b39','PJD','Becquini Akbar ST','Jl. Tanjung IV Blok K/6 Jakarta Selatan','Becquini','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/yhfc','PJD','Flavia Mianasari','Jl. Tegal Parang Utara V No 31 Kav 15 Jakarta Selatan','F Mianasari','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/zasr','PJD','Ir. Abdul Haris MBA','Jl. Tanjung III Blok K No 4 Jakarta Selatan','AH','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/19kj','PJD','Ir. Toty Mirawaty MM','Jl. Tanjung III Blok K No 4 Jakarta Selatan','TM','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/kzyb','PJD','Thomas Ginting','Desa Bangun Jadi','KRN','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/zn3c','PJD','Ribka Ginting','Dusun Jadi Damai Bagan Sinembah','KM 9','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/5g8d','PJD','Verawati Simanungkalit','Tebing Tinggi III','LB','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/gu9f','PJD','Johan Alas Jalani','Jl. Lintas Tanjung Medan Mahato','JH','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/xj4s','PJD','PT. Bukit Gajah Putih','Jl. Padi Kompleks Maryland No 8 Sumatera Utara','BGP','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/k5g3','PJD','Johari Ginting','Jl. HR Subrantas Bagan Batu','Koperasi','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/axp2','PJD','Dahlan Pasaribu','Jl. Lintas Seremban Jaya RT.001/RW.001 Seremban Jaya, Rimba Melintang','Dahlan Pasaribu','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/c46f','PJD','Janter Pangaribuan','Bentengan Timur No. 7, Sunter Jaya, Tanjung Priok','Janter P','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/1b67','KPJ','Salman ST','Komp BTN Seuriget Blok C No 54, Serambi Indah, Langsa Barat','SLM','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/9b86','KPJ','Saiful Amri','Dusun Tikem, Simpang Peut, Rantau Selamat','Rimba Grup','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/0fc3','KPJ','Imam Sugiyanto','Harapan Mulia, Buket Hagu, Lhoksukun','52','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/21d8','KPJ','CV Jabal Nur','Desa Gampong Simpang Peut, Rantau Selamat','CV Jabal Nur','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/dad5','KPJ','Amiruzzahri','Dusun Cot Kala Gampong Bayen, Rantau Selamat','UD Yus','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/f65e','KPJ','Iskandar','Dusun Tingkeum, Simpang Peut, Rantau Selamat','ISK','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/3d56','KPJ','Baharuddin','Dusun Makmur Indah, Alue Dua Bakaran Batee, Langsa Baro','HR','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/8ef6','KPJ','Chairul Bahri','Dusun Bakti, Seuneubok Punti, Manyak Payed','Chairul','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/b60e','KPJ','PT. Sulaiman Saleh','Jl. Sunggal No 91/103 Sunggal','PT S.Saleh','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/61c9','KPJ','PT. Bumi Flora','Jl. Iskandar Muda No 104, Peukan Langsa, Langsa Kota','Bumi Flora','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/e430','ARP','Suroto','Jl. Batu Delima No. 28 Kel/Desa Sidodadi Kecamatan Kota Kisaran Barat','Purbaya','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23/7a54','ARP','Indra Perdana Simangunsong','Dusun IV Desa Padang Pulau Kel/Desa Padang Pulau Kecamatan Bandar Pulau','Indra Simagunsong','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23-Lw4B','ARP','Jemmi Febriani Elisabeth Hutauruk','Huta Sitiotio Kel/Desa Pardomuan Nauli Kecamatan Pematang Bandar','JGT','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23-YQzD','ARP','Tjin Siang/Hermanto Tanadi','Jln. Sutomo No. 51 Perdagangan I / Bandar Simalungun - Sumatera Utara','YTS','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23-v3sm','ARP','PT. Saributua','Jl. Iskandar Muda No. 5 Kota Medan','PT. Saributua','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23-KGg1','ARP','CV. Bolon Tua','Dusun IX Silau Jawa Kab. Asahan','CV. Bolon Tua','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23-7QFW','ARP','CV. Garuda Mas Jaya','Nagori Teladan, Teladan, Kab. Simalungun','CV. Garuda Mas Jaya','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23-9dVE','ARP','Pandapotan Kurnia Tanjung','Dusun II Babussalam RT. 002 RW. 003 Kel/Desa Babussalam Kecamatan Merbau','Nina Merbau','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23-uz2z','ARP','Ngahoa/Hadi Ismanto','Jl. P. Polem No. 68/97 (Asahan), Kisaran','PTN','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23-3D8V','ARP','CV. Sinar Kurnia Mandiri','Jl. Sutomo No. 466, Kota Medan','CV. Sinar Kurnia Mandiri','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23-1hUr','ARP','CV. Kahraman Widdagdo','Jl. Lintas Sumatera KM. 140 Perjuangan, Sei Balai Kab. Batu Bara Sumatera Utara','CV. Kahraman','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23-yAwN','ARP','Adi Sirait Candra','Jl. Bajak V Gg. Rukun IX No. 4 Kel/Desa Harjosari II Kecamatan Medan Amplas','Adi Sirait Candra','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23-KwUQ','ARP','CV. Ramadhani Perkasa','Huta II Ujung Ban Kel/Desa Buntu Bayu Kec. Hatonduhan','CV. Ramadhani Perkasa','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06'),
('SP-06/06/23-C7ot','ARP','Evan Ronaldo Purba','JL. Karya April I LKVII Medan Kel/Desa Sarirejo Kecamatan Medan Polonia ','EP','','','','2023-06-06','2023-06-06','SYSTEM','2023-06-06');


CREATE TABLE IF NOT EXISTS supir (
  idSupir TEXT PRIMARY KEY NOT NULL,
  supirName TEXT,
  noSim TEXT,
  statusSupir TEXT,
  perusahaan TEXT,
  tanggalDibuat TEXT,
  tanggalDiubah TEXT,
  diubahOleh TEXT,
  tanggalSinkron TEXT
);


INSERT INTO supir(idSupir, supirName, noSim, statusSupir, perusahaan, tanggalDibuat, tanggalDiubah, diubahOleh, tanggalSinkron)
VALUES
('SPR-07/06/23/abcd','Cahyo','182085437268631','ext','Andi Ardianta','21/May/2023','21/May/2023','SYSTEM','21/May/2023'),
('SPR-07/06/23/efgh','Paijo','348782119613005','ext','Saut Banjarnahor','21/May/2023','21/May/2023','SYSTEM','21/May/2023'),
('SPR-07/06/23/ijkl','Djoko','444663863252441','ext','Guantanamo Martin','21/May/2023','21/May/2023','SYSTEM','21/May/2023'),
('SPR-07/06/23/mnop','Parmin','1600236026105','ext','Gunawan Halim','21/May/2023','21/May/2023','SYSTEM','21/May/2023'),
('SPR-07/06/23/qrst','Ucok','211466854151993','ext','Supriyadi','21/May/2023','21/May/2023','SYSTEM','21/May/2023'),
('SPR-07/06/23/uvwx','Zulhajral','460716997634637','ext','Charles','21/May/2023','21/May/2023','SYSTEM','21/May/2023'),
('SPR-07/06/23/yzab','Bara','320002612643716','ext','Welly Chandra','21/May/2023','21/May/2023','SYSTEM','21/May/2023'),
('SPR-07/06/23/cdef','Delson','238921335129486','ext','Santo','21/May/2023','21/May/2023','SYSTEM','21/May/2023'),
('SPR-07/06/23/ghij','Charles','353436439342102','ext','Wendy','21/May/2023','21/May/2023','SYSTEM','21/May/2023'),
('SPR-07/06/23/klmn','Richard','153635429956866','ext','Suka Ginting','21/May/2023','21/May/2023','SYSTEM','21/May/2023'),
('SPR-07/06/23/opqr','Mendas','18642263399982','ext','Suparno','21/May/2023','21/May/2023','SYSTEM','21/May/2023'),
('SPR-07/06/23/stuv','Manumpak','594712612669682','ext','Flora Siburian','21/May/2023','21/May/2023','SYSTEM','21/May/2023'),
('SPR-07/06/23/wxyz','Nanu','441506902161682','ext','Porman Banjarnahor','21/May/2023','21/May/2023','SYSTEM','21/May/2023'),
('SPR-07/06/23/1234','Asep','672385894814606','ext','CV. Amanah Sawit Sejahtera','21/May/2023','21/May/2023','SYSTEM','21/May/2023'),
('SPR-07/06/23/5678','Ujang','223813741631678','ext','Savir Wahyujoe','21/May/2023','21/May/2023','SYSTEM','21/May/2023'),
('SPR-07/06/23/90ab','Kohir','30563308385620','ext','Yap Lily','21/May/2023','21/May/2023','SYSTEM','21/May/2023'),
('SPR-07/06/23/235t','Tuniyo','692382050013284','ext','Salomo Chandra Mikael Sianipar','21/May/2023','21/May/2023','SYSTEM','21/May/2023'),
('SPR-07/06/23/df45','Pardi','532355161425292','ext','Timbang Sianipar','21/May/2023','21/May/2023','SYSTEM','21/May/2023'),
('SPR-07/06/23/ak92','Sukoco','275274117143821','ext','Dedi Sumanto Sianipar','21/May/2023','21/May/2023','SYSTEM','21/May/2023'),
('SPR-07/06/23/lk90','Budiawan','618894657639130','ext','Muhammad Raja Ihsan','21/May/2023','21/May/2023','SYSTEM','21/May/2023'),
('SPR-07/06/23/jk24','Alpin','618894657635327','int','Aptaworks','21/May/2023','21/May/2023','SYSTEM','21/May/2023');

UPDATE supir
SET tanggalDibuat = '2023-06-07',
    tanggalDiubah = '2023-06-07',
    tanggalSinkron = '2023-06-07'
WHERE tanggalDibuat = '21/May/2023';


CREATE TABLE IF NOT EXISTS kendaraan (
    idKendaraan TEXT NOT NULL PRIMARY KEY,
    typeKendaraan TEXT,
    noPolisi TEXT,
    statusKendaraan TEXT,
    perusahaan TEXT,
    tanggalDibuat TEXT,
    tanggalDiubah TEXT,
    diubahOleh TEXT,  
    tanggalSinkron TEXT
);

insert into kendaraan(idKendaraan, typeKendaraan, noPolisi, statusKendaraan, perusahaan, tanggalDibuat,tanggalDiubah,diubahOleh,tanggalSinkron)
values('truck-bg47240cdx-21052023-c3f1-550d-9f95','truck','BG 4724 CDX','ext','Andi Ardianta','2023-06-07','2023-06-07','SYSTEM','2023-06-07'),
('truck-bg32376yig-21052023-0dd7-7b0a-8d68','truck','BG 3237 YIG','ext','Saut Banjarnahor','2023-06-07','2023-06-07','SYSTEM','2023-06-07'),
('truck-bg1140szz-21052023-d630-d5ee-9d6b','truck','BG 1140 SZZ','ext','Guantanamo Martin','2023-06-07','2023-06-07','SYSTEM','2023-06-07'),
('truck-bg29143cbg-21052023-cc7a-1ab2-2807','truck','BG 2914 CBG','ext','Gunawan Halim','2023-06-07','2023-06-07','SYSTEM','2023-06-07'),
('truck-bg11116yad-21052023-b186-4088-2a9e','truck','BG 1111 YAD','ext','Supriyadi','2023-06-07','2023-06-07','SYSTEM','2023-06-07'),
('truck-bg30349vkv-21052023-3b37-be53-b5da','truck','BG 3034 VKV','ext','Charles','2023-06-07','2023-06-07','SYSTEM','2023-06-07'),
('truck-bg59595nfr-21052023-30c6-daca-4f83','truck','BG 5959 NFR','ext','Welly Chandra','2023-06-07','2023-06-07','SYSTEM','2023-06-07'),
('truck-bg39190oyc-21052023-73c8-a990-90b7','truck','BG 3919 OYC','ext','Santo','2023-06-07','2023-06-07','SYSTEM','2023-06-07'),
('truck-bg53909wnm-21052023-2a68-e059-dd77','truck','BG 5390 WNM','ext','Wendy','2023-06-07','2023-06-07','SYSTEM','2023-06-07'),
('truck-bg35935zkx-21052023-d91c-1401-1acd','truck','BG 3593 ZKX','ext','Suka Ginting','2023-06-07','2023-06-07','SYSTEM','2023-06-07'),
('truck-bg37742yna-21052023-2801-95cc-52b5','truck','BG 3774 YNA','ext','Suparno','2023-06-07','2023-06-07','SYSTEM','2023-06-07'),
('truck-bg1055ngh-21052023-c0c0-0788-56c3','truck','BG 1055 NGH','ext','Flora Siburian','2023-06-07','2023-06-07','SYSTEM','2023-06-07'),
('truck-bg56627dfz-21052023-536e-c101-f7b2','truck','BG 5662 DFZ','ext','Porman Banjarnahor','2023-06-07','2023-06-07','SYSTEM','2023-06-07'),
('truck-bg14772ime-21052023-0af0-9c47-70bc','truck','BG 1477 IME','ext','CV. Amanah Sawit Sejahtera','2023-06-07','2023-06-07','SYSTEM','2023-06-07'),
('truck-bg33366rmv-21052023-e531-69d7-8d7d','truck','BG 3336 RMV','ext','Savir Wahyujoe','2023-06-07','2023-06-07','SYSTEM','2023-06-07'),
('truck-bg9719jva-21052023-25f9-e68f-c202','truck','BG 9719 JVA','ext','Yap Lily','2023-06-07','2023-06-07','SYSTEM','2023-06-07'),
('truck-bg19533ncr-21052023-1fc3-3dfe-342f','truck','BG 1953 NCR','ext','Salomo Chandra Mikael Sianipar','2023-06-07','2023-06-07','SYSTEM','2023-06-07'),
('truck-bg49773uss-21052023-a653-29d8-c1b4','truck','BG 4977 USS','ext','Timbang Sianipar','2023-06-07','2023-06-07','SYSTEM','2023-06-07'),
('truck-bg32953onw-21052023-ec5d-4e24-4f8f','truck','BG 3295 ONW','ext','Dedi Sumanto Sianipar','2023-06-07','2023-06-07','SYSTEM','2023-06-07'),
('truck-bg30077bfc-21052023-7123-c527-4afe','truck','BG 3007 BFC','ext','Muhammad Raja Ihsan','2023-06-07','2023-06-07','SYSTEM','2023-06-07');

UPDATE kendaraan
SET idKendaraan = 'KN-07/06/23/' || SUBSTR(CAST(ABS(RANDOM()) % 10000 AS TEXT), 1, 4)
WHERE idKendaraan LIKE 'truck-%';
