# 📚 HadithDB API

A **free, simple, and static JSON API** for accessing major hadith collections and their translations.  
Built entirely on **GitHub Pages** — fast, reliable, and always available.

---

## 🚀 API Endpoints

This API uses a clean URL structure to serve Hadith data in JSON format.

### 1. Root Manifest

The entry point for discovering all available hadith collections and translations.

**Endpoint:**  
https://adhilansari.github.io/hadithDb/app.json

---

### 2. Hadith Data (Arabic)

Retrieve the **original Arabic text** of a hadith.

**Structure:**  
https://adhilansari.github.io/hadithDb/data/ara-
<collection_id>/<hadith_number>.json

**Example (Nawawi #1):**  
[https://adhilansari.github.io/hadithDb/data/ara-nawawi/1.json](https://adhilansari.github.io/hadithDb/data/ara-nawawi/1.json)

---

### 3. Translations

Access **translations** of a hadith in multiple languages.

**Structure:**  
https://adhilansari.github.io/hadithDb/translations/
<lang_code>-<collection_id>/<hadith_number>.json

**Examples:**

- English (Nawawi #1):  
  [https://adhilansari.github.io/hadithDb/translations/eng-nawawi/1.json](https://adhilansari.github.io/hadithDb/translations/eng-nawawi/1.json)
- Malayalam (Nawawi #1):  
  [https://adhilansari.github.io/hadithDb/translations/ml-nawawi/1.json](https://adhilansari.github.io/hadithDb/translations/ml-nawawi/1.json)

---

## 📖 Available Collections

The full list of collections is available in the **root manifest** (`app.json`).

| Collection Name                        | ID          |
| -------------------------------------- | ----------- |
| Sahih al-Bukhari                       | `bukhari`   |
| Sahih Muslim                           | `muslim`    |
| Sunan an-Nasai                         | `nasai`     |
| Sunan Abu Dawud                        | `dawud`     |
| Jami At-Tirmidhi                       | `tirmidhi`  |
| Sunan Ibn Majah                        | `ibn-majah` |
| Muwatta Malik                          | `malik`     |
| Forty Hadith of Shah Waliullah Dehlawi | `deh-forty` |
| Forty Hadith of an-Nawawi              | `nawawi`    |
| Forty Hadith Qudsi                     | `qudsi`     |

---

## 💻 Usage Examples

### Fetch Root Manifest

```bash
curl https://adhilansari.github.io/hadithDb/app.json

fetch('https://adhilansari.github.io/hadithDb/app.json')
  .then(response => response.json())
  .then(data => console.log(data));

## Fetch a Single Hadith (English)

fetch('https://adhilansari.github.io/hadithDb/translations/eng-nawawi/1.json')
  .then(response => response.json())
  .then(data => {
    console.log(data.text);
    // Output: "The English translation of Hadith 1..."
  });


## Fetch Arabic Data
fetch('https://adhilansari.github.io/hadithDb/data/ara-nawawi/1.json')
  .then(response => response.json())
  .then(data => {
    console.log(data.text);
    // Output: "عَنْ أَمِيرِ الْمُؤْمِنِينَ ..."
  });

## 🤝 Contribution

This project is open-source.
Want to add a new hadith collection or translation?
Follow the existing file structure and submit a Pull Request.
```
