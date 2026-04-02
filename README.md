# Artesanía Los Califas — Landing Page

## Estructura de archivos

```
artesania-los-califas/
├── index.html          ← Landing page principal
├── gracias.html        ← Página tras envío del formulario
├── netlify.toml        ← Configuración de Netlify
├── images/             ← TUS FOTOS (créala manualmente)
│   ├── productos-hero.webp     ← Foto principal del hero
│   ├── marco-grande.webp       ← Producto 1 (destacado)
│   ├── minarete.webp           ← Producto 2
│   ├── panel-bicolor.webp      ← Producto 3
│   ├── marco-caligrafia.webp   ← Producto 4
│   └── set-coleccion.webp      ← Producto 5
└── README.md
```

---

## 1. Convertir fotos a WebP (desde WSL)

```bash
# Instalar cwebp
sudo apt update && sudo apt install -y webp

# Convertir una foto
cwebp foto.jpg -o images/productos-hero.webp -q 85

# Convertir todas las fotos de una carpeta
for f in fotos-originales/*.jpg; do
  cwebp "$f" -o "images/$(basename "${f%.jpg}").webp" -q 85
done
```

---

## 2. Sustituir placeholders por imágenes reales

Busca en `index.html` los comentarios marcados como:
```
<!-- DESARROLLADOR: <img src="./images/..."> -->
```
Y reemplaza el bloque `<div class="hero-img-placeholder">` (o `product-placeholder`)
por una etiqueta `<img>` real. Ejemplo:

```html
<!-- ANTES (placeholder) -->
<div class="hero-img-placeholder">...</div>

<!-- DESPUÉS (imagen real) -->
<img src="./images/productos-hero.webp"
     alt="Colección de artesanía andalusí Los Califas"
     style="width:100%; height:auto; display:block; object-fit:cover;">
```

---

## 3. Actualizar datos de contacto

En `index.html`, busca y reemplaza:
- `+34 600 000 000` → tu teléfono real de WhatsApp
- `info@artesanialoscalifas.es` → tu email real
- `https://wa.me/34600000000` → tu número en formato internacional sin espacios ni `+`

---

## 4. Subir a GitHub (desde WSL)

```bash
# Primera vez: crear repo
cd /home/tu-usuario/artesania-los-califas
git init
git add .
git commit -m "feat: primer borrador landing page"

# Conectar con GitHub (crea el repo vacío en github.com primero)
git remote add origin https://github.com/TU-USUARIO/artesania-los-califas.git
git branch -M main
git push -u origin main
```

---

## 5. Conectar Netlify

1. Entra en [netlify.com](https://netlify.com) → New site → Import from Git
2. Selecciona tu repo de GitHub
3. Build command: (déjalo vacío)
4. Publish directory: `.`
5. Deploy site ✓

Cada `git push` actualizará la web automáticamente.

---

## 6. Configurar Netlify Forms

El formulario ya tiene los atributos necesarios (`data-netlify="true"`).
En el dashboard de Netlify: **Forms** → verás los envíos ahí.
Puedes configurar notificaciones por email en: Site Settings → Forms → Notifications.

---

## 7. Dominio propio (opcional pero recomendado)

En Netlify → Domain settings → Add custom domain.
Registra tu dominio en Namecheap o Porkbun (~12€/año).
Netlify gestiona el certificado SSL gratis automáticamente.
