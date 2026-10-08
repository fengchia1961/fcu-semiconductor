# 逢甲大學半導體學院 網站

逢甲大學半導體學院（與 CSUN 合作）招生／形象網站原型。

## 頁面

| 檔案 | 內容 |
|---|---|
| `index.dc.html` | 首頁 |
| `about-fcu-csun.dc.html` | 關於學院｜逢甲 × CSUN |
| `about-dean.dc.html` | 關於學院｜院長 |
| `about-ceo.dc.html` | 關於學院｜執行長 |
| `faculty.dc.html` | 師資陣容 |
| `faculty-ho-juliang.dc.html` | 教師個人頁｜何汝亮 |
| `curriculum.dc.html` | 課程說明 |
| `scholarship.dc.html` | 獎學金與職涯發展 |
| `admissions.dc.html` | 招生資訊 |
| `labs.dc.html` | 重點實驗室｜欣銓半導體測試中心 |
| `labs-cleanroom.dc.html` | 重點實驗室｜志聖先進封裝無塵室（規劃中） |
| `SiteNav.dc.html` | 共用導覽列元件（所有頁面嵌入） |

## 結構

```
├── *.dc.html      各頁面
├── SiteNav.dc.html 共用導覽列
├── support.js     頁面執行環境（必要，勿刪）
├── image-slot.js  圖片欄位元件
└── assets/        Logo、照片
```

## 本機預覽

頁面之間透過 fetch 載入元件，直接雙擊開啟 `file://` 可能無法顯示，請用本機伺服器：

```bash
npx serve .
# 或
python -m http.server 8000
```

開啟 http://localhost:8000/index.dc.html

## 部署到 GitHub Pages

1. Settings → Pages → Source 選 `main` 分支 / root
2. 網址：`https://<帳號>.github.io/<repo>/index.dc.html`
3. 根目錄的 `index.html` 會自動轉址到 `index.dc.html`

## 待辦

- [ ] 課程說明：課程地圖、產業課程
- [ ] 獎學金與職涯：補內容
- [ ] 其他教師個人頁
- [ ] 常見問題（FAQ）頁
