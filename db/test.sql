DELETE FROM timbanganMasuk WHERE idLaporan = '';

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