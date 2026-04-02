GITHUB
token: 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

Si en algún momento añades o modificas archivos,
el proceso para actualizar GitHub siempre es el mismo tres pasos:
	git add .
	git commit -m "describe qué cambiaste"
	git push origin main


PASOS A SEGUIR CREADOS POR CLAUDE

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

-----------------------------------------------------------------------------------------

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

--------------------------------------------------------------------------------------------

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

`````````imagenes de portadas
<!-- ELIMINA ESTO: -->
<div class="hero-img-placeholder">
  ...todo el contenido interior...
</div>

<!-- PON ESTO EN SU LUGAR: --> Para dispositivos variados usa lo siguiente
<picture>
  <source media="(max-width: 480px)"
          srcset="./images/productos-hero-mobile.webp">
  <source media="(max-width: 900px)"
          srcset="./images/productos-hero-tablet.webp">
  <img src="./images/productos-hero.webp"
       alt="Colección de artesanía andalusí Los Califas"
       style="width:100%; height:100%; object-fit:cover; display:block;">
</picture>

```````` imagenes de los productos
<!-- ELIMINA ESTO: -->
<div class="product-placeholder p-bg-1" style="height:100%; ...">
  <div style="font-size:5rem; opacity:0.3;">🪟</div>
</div>

<!-- PON ESTO EN SU LUGAR: --> usar loading="lazy" para que en los dispositivos moviles se vea más fluido
<picture>
  <source media="(max-width: 480px)"
          srcset="./images/marco-grande-mobile.webp">
  <img src="./images/marco-grande.webp"
       alt="Marco decorativo andalusí grande"
       loading="lazy"
       style="width:100%; height:100%; object-fit:cover; display:block;">
</picture>


--------------------------------------------------------------------------------------------

## 3. Actualizar datos de contacto

En `index.html`, busca y reemplaza:
- `+34 600 000 000` → tu teléfono real de WhatsApp
- `info@artesanialoscalifas.es` → tu email real
- `https://wa.me/34600000000` → tu número en formato internacional sin espacios ni `+`


-----------------------------------------------------------------------------------------------

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

-----------------------------------------------------------------------------------------------

## 5. Conectar Netlify

1. Entra en [netlify.com](https://netlify.com) → New site → Import from Git
2. Selecciona tu repo de GitHub
3. Build command: (déjalo vacío)
4. Publish directory: `.`
5. Deploy site ✓

Cada `git push` actualizará la web automáticamente.

-----------------------------------------------------------------------------------------------

## 6. Configurar Netlify Forms

El formulario ya tiene los atributos necesarios (`data-netlify="true"`).
En el dashboard de Netlify: **Forms** → verás los envíos ahí.
Puedes configurar notificaciones por email en: Site Settings → Forms → Notifications.

-----------------------------------------------------------------------------------------------

## 7. Dominio propio (opcional pero recomendado)

En Netlify → Domain settings → Add custom domain.
Registra tu dominio en Namecheap o Porkbun (~12€/año).
Netlify gestiona el certificado SSL gratis automáticamente.
