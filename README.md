# in-silico-approach-on-herbal-compound-identification

Repository ini dibuat untuk kolaborasi tim dalam program PKM-RE dengan judul "_Pendekatan In Silico dengan Menggunakan Molecular Fingerprint dan Support Vector Classifier untuk Identifikasi Senyawa Herbal Indonesia sebagai Treatment Pasien Alzheimer_" 

Pada folder ini, terdapat 2 direktori utama dan 1 file Dockerfile:

## src

Direktori ini digunakan untuk menyimpan source code. Source code baik dalam ekstensi `.py` maupun `.ipynb` dapat disimpan di direktori ini.

Catatan: harap gunakan nama file yang menjelaskan tujuan dari source code tersebut. Misalnya source code untuk melakukan web scrapping data di PubChem dapat diberi nama berikut:

`pubchem-web-scrapping.ipynb`.

## data

Direktori ini berisi dataset-dataset yang akan diolah oleh program yang ada di source code. Harap gunakan nama file yang menjelaskan isi dari dataset tersebut. Misalnya dataset yang berisi smiles dari senyawa ligand dapat diberi nama:

`ligand-smiles.csv`

Catatan: Apabila ada perubahan terhadap isi file dataset, wajib beri nama baru dengan tambahan tanggal file tersebut terakhir diubah. Misalnya:

`ligand-smiles.27-juni-2023.csv`

## Dockerfile

File dengan nama `Dockerfile` merupakan file yang berisi perintah-perintah untuk membuat sebuah docker image baru (saat ini belum jadi). Untuk mem-_build_-nya, gunakan perintah berikut:

```bash
docker build -t jupyter-pyfingerprint:latest .
```

Kemudian, untuk menjalankan container dari image tersebut, gunakan perintah:

```bash
docker run -it -p 8889:8888 jupyter-pyfingerprint:1.0
```

Setelah itu, klik link yang diberikan oleh jupyter. Link berbentuk seperti berikut:

```
http://127.0.0.1:8888/lab?token=29c88118b379099f669716be8ab2c4fab6b479979c3edb9a
```

Ganti port 8888 menjadi 8889.

Dockerized jupyter lab siap dijalankan!